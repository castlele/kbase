---
tags:
  - MIFI
  - linux
  - devops
  - os
  - packagemanagers
  - dpkg
  - rpm
---
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
	dpkg -i <package-name>.dep
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

### Hight level package managers
dpkg and RPM don't manage dependencies between packages by itself. For that there are hight level systems like APT (Advanced Package Tool) and DNF (Dandified Yum). They automates the process of the installation and updates of all dependencies and conflicts.

h**APT** - control system for the packages, used by Debian distributions. It is a high level interface for low level dpkg. 