---
tags:
  - MIFI
  - linux
  - devops
  - os
  - packagemanagers
  - dpkg
  - rpm
  - apt
  - dnf
---
- [[#Linux|Linux]]
	- [[#Linux#dpkg and RPM commands|dpkg and RPM commands]]
	- [[#Linux#Hight level package managers (`apt`)|Hight level package managers (`apt`)]]
		- [[#Hight level package managers (`apt`)#`apt` commands|`apt` commands]]
		- [[#Hight level package managers (`apt`)#`deb` package creation|`deb` package creation]]
	- [[#Linux#Hight level package managers (`dnf`)|Hight level package managers (`dnf`)]]
		- [[#Hight level package managers (`dnf`)#`dnf` commands|`dnf` commands]]
		- [[#Hight level package managers (`dnf`)#`dnf` package creation|`dnf` package creation]]

> **Операционная система** — совокупность системных программ, предназначенная для обеспечения определенного уровня эффективности системы обработки информации за счет автоматизированного управления ее работой и предоставляемого пользователю определенного набора услуг.

OS is needed for:
- hardware management
- interface for file management
- downloading and execution of different software
- access control to the data stored on the computer
## Linux
Main way of distribution of the software on Linux is with **packages**. 

Packages can be one of two types:
- binary packages: packages that holds only the compiled program that can be immediately executed
- source files packages: packages that holds source files of the programs. With this type of the distribution the user should compile program on his machine by himself. Usually package distributes with installation scripts for ease of compiling.

Packages usually installed by **package managers**. There are all sorts of those managers for different linux distributives:
- dpkg (Debian Package) - package manager created Linux distributions based on Debian: Debian itself, Ubuntu, Linux Mint. dpkg is a low level package manager. This means that dpkg can delete and install packages but can't control their dependencies.
- RPM (Red Hat Package Manager) - another low level package manager firstly created for Red Hat Linux distributions. But right now it is used on other distributions like Fedora Linux, CentOs, openSUSE and Mageia

### dpkg and RPM commands
- Installation is actually an unpacking of the package and installation of its files in the corresponding directories. Metadata like version of the package and list of installed files saves in the data base (usually it is `/var/lib/dpkg` and `/var/lib/rpm`):

	```bash
	dpkg -i <package-name>.deb
	rpm -i <package-name>.rpm
	```

- Package removal removes all package files. However, dpkg don't delete configuration files by default:

	```bash
	dpkg -r <package-name>
	rpm -e <package-name>

	# Full deletion of the package with configuration files
	dpkg --purge <package-name>
	```

- Package update changes all package files and its metadata:

	```bash
	dpkg -i <new-package-version>.deb
	rpm -U <package>.rpm
	```

- List the full data base of packages:

	```bash
	dpkg -l
	rpm -qa
	```

- Lists files owned by the package:

	```bash
	dpkg -L <package-name>
	rpm -ql <package-name>
	```

- Searching of the package by the file:

	```bash
	dpkg -S <file>
	rpm -qf <file>
	```

### Hight level package managers (`apt`)

dpkg and RPM don't manage dependencies between packages by itself. For that there are hight level systems like APT (Advanced Package Tool) and DNF (Dandified Yum). They automates the process of the installation and updates of all dependencies and conflicts.

**APT** - control system for the packages, used by Debian distributions. It is a high level interface for low level dpkg. APT stores its configuration in `/etc/apt/sources.list` and `/etc/apt/sources.list.d/` files. This files stores information about repositories from where APT can download packages.

Also, APT includes two commands `apt-get` and `apt-cache`. Both of the commands are legacy for now and fully replaced with just `apt`.

APT stores downloaded packages in `/var/cache/apt/archives` directory. Packages's metadata stored in `/var/lib/apt/lists/`.

#### `apt` commands

- package installation: `sudo apt install <package_name>`
- package removal: `sudo apt remove <package_name>`
- update information about latest available packages: `sudo apt update`
- update packages to the latest available versions: `sudo apt upgrade`
- search for the package: `apt search <key_word>`
- display information about the package: `apt show <package_name>`
- removal of the packages that are stored as dependencies but isn't used no more: `sudo apt autoremove`

#### `deb` package creation

Main steps:
1. Create a program for packaging
2. Prepare a structure of the directory
3. Create `control` file, where dependencies and metadata will be described
4. Package directory into `.deb` file
5. Sign the package

Files for building:
1. Public key, that is being exported
2. `mypackage/DEBINAN/control`: file with metadata about the package
3. `mypackage/usr/local/bin/info.sh`: script or program, that is included in the package
4. `mypackage.deb`: Packed `.deb` file

```bash
PACKAGE_NAME="mypackage"

mkdir -p $PACKAGE_NAME/DEBIAN
mkdir -p $PACKAGE_NAME1/usr/local/bin

touch $PACKAGE_NAME1/DEBIAN/control

dpkg-deb --build $PACKAGE_NAME
gpg --gen-key
gpg --list-secret-keys

dpkg-sig --sign builder -k <KEY-ID> ${PACKAGE_NAME}.deb
gpg --armor --export "Nikita Semenov"
```

Example of the `control` file:

```txt
Package: Package name
Version: 1.0
Section: base | admin | utils | etc
Priority: optional | required (no life without it) | important
Architecture: all
Maintainer: Name and contacts
Description: Package description
```
### Hight level package managers (`dnf`)

The analogue for `apt` is `dnf`. But the origins are different. DNF was the replacement for `yum` on distributions like Fedora, CentOS and Red Hat Enterprise Linux. This package manager works with RPM format.

Architecture of DNF also consists of different components. The base of the DNF is a library `libdnf` that manages the installation, removal, updates of the packages and manages dependencies. 

Configuration files of DNF for repositories are stored in `/etc/yum.repos.d/` directory. Packages and its metadata are stored in `/var/cahce/dnf/`.

#### `dnf` commands

- package installation: `sudo dnf install <package_name>`
- package removal: `sudo dnf remove <package_name>`
- update information about latest available packages: `sudo dnf update`
- update packages to the latest available versions: `sudo dnf upgrade`
- search for the package: `dnf search <key_word>`
- display information about the package: `dnf info <package_name>`
- removal of the packages that are stored as dependencies but isn't used no more: `sudo dnf autoremove`

#### `dnf` package creation

Main steps:
1. Prepare a structure of the directory
2. Create directory for package with `<package_name>-<version>` in `rpmbuild/SOURCES/`
3. Create a program
4. Create an `tar.gz` archive with directory with program
5. 

```bash
# Optional step with dependencies installation
sudo dnf install rpmdev* pinentry

PACKAGE_NAME="package"
PACKAGE_VERSION="1.0"

rpmdev-setuptree
cd ~/rpmbuild/SOURCES
mkdir $PACKAGE_NAME-$PACKAGE_VERSION
cd $PACKAGE_NAME-$PACKAGE_VERSION
vim $PACKAGE_NAME
chmod +x $PACKAGE_NAME
cd ~/rpmbuild/SOURCES
```