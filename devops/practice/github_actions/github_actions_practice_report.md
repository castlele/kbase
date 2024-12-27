В качестве "подопытного" выбрал свой [проект](https://github.com/castlele/cluautils) с полезными утилитами на lua, который я использую в иных своих проектах. Там давольно неплохое покрытие кода [тестами](https://github.com/castlele/cluautils/tree/master/tests), но ранее настройка github actions была лишь в далеких планах.

Т.к. это не web приложение, а библиотка я буду загружать ее в специальный хостинг сервис с другими lua библиотеками [luarocks](https://luarocks.org/modules/castlelecs/cluautils).

 Так же пока есть сложности с поддержкой windows. В данный момент нет возможности загрузить luarocks на этой ОС. Из-за этого пайплайны в текущий момент не гоняются на ней

Я настроил следующий workflow:
```yml
name: cluautils workflow

on:
  # Запуск пайплайна на любой ветке при пуше изменений
  push:
    branches: [ "*" ]
  # Запуск пайплайна в пулреквестах, направленных в master ветку
  pull_request:
    branches: [ "master" ]

jobs:
  # Запуск unit тестов
  unit-tests:
    strategy:
      matrix:
		# Запуск на всех возможных видах ОС
        os:
          - ubuntu-latest
          # TODO: Add windows support later
          # Will be added later: waiting added support in: https://github.com/leafo/gh-actions-luarocks/pull/14
          # - windows-latest
          - macos-latest
          - macos-13
    runs-on: ${{matrix.os}}
    steps:
	  # Использование checkout для запуска на ветках отличных от master
      - uses: actions/checkout@master

	  # Установка Miscrosoft Visual C++ Developer Command Prompt. Необходимо для установки lua и luarocks
      - uses: ilammy/msvc-dev-cmd@v1

	  # Установка компилятора языка lua
      - uses: leafo/gh-actions-lua@v10
        with:
          luaVersion: "5.1.5"
          buildCache: false

	  # Установка менеджера зависимостей для lua - luarocks
      - uses: luarocks/gh-actions-luarocks@v5
        with:
          luarocksVersion: "3.0.0"

	  # Сборка проекта и запуск тестов
      - name: test
        run: |
          luarocks make
          ./run_tests.sh "*"

  # Деплой либы в luarocks.org
  deploy:
    runs-on: ubuntu-latest
	# У данной джобы зависимость на unit-tests (т.е. она не может пройти, пока не пройдут тесты)
    needs: unit-tests
	# Деплой может запускаться только с master ветки
    if: github.ref == 'refs/heads/master'
    steps:
      - uses: actions/checkout@master

      - uses: leafo/gh-actions-lua@v10
        with:
          luaVersion: "5.1.5"

      - uses: leafo/gh-actions-luarocks@v4
        with:
          luarocksVersion: "3.0.0"
	  # Публикация библиотки
      - name: publish-luarocks
        env:
		  # Для публикации необходим ключ, который я сокрыл в секретах github actions
          LUAROCKS_API_KEY: ${{ secrets.LUAROCKS_API_KEY }}
		# Первые две команды необходимы для правильной работы команды `upload` у luarocks
        run: |
          git config --global url."https://".insteadOf git://
          luarocks install --local dkjson
          luarocks upload cluautils-*.rockspec --api-key=$LUAROCKS_API_KEY --force
```