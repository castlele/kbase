---
tags:
  - green
---
## Notes

Очистка кэша шейдеров после обновлений:
```
del /q /s "%USERPROFILE%\AppData\LocalLow\NVIDIA\PerDriverVersion\DXCache\*"
```

Как улучшить сетевое соединение:
- Включите функцию «Показывать график отклонения и некорректной доставки пакетов» для мониторинга состояния сети в реальном времени
- Если на графике вы заметите скачки или значительные потери пакетов, это укажет на проблемы с сетью.
- Настройте параметр «Буферизация для сглаживания потерь пакетов» на значение 1 пакет

Обновление драйверов NVIDIA:
- Загрузка с официального [сайта](https://www.nvidia.com/ru-ru/geforce/drivers/) NVIDIA 
- Использование GeForce Experience с VPN
- Найти через название своей видеокарты в [каталоге обновлений Microsoft](https://www.catalog.update.microsoft.com/Search.aspx?q=RTX%204090)

---
## See also
- [[cs2_train]]