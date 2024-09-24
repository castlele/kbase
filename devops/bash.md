---
tags:
  - MIFI
  - linux
  - bash
  - devops
  - scripting
---
**Shell** is a command-line interpreter that exposes an operating system's services to a user or other programs.

**Bash** is a shell program and command language supported by the Free Software Foundation and first developed for the GNU Project.
## Commands 
Everything in linux is a *file*. So it is mandatory to be able to work with files.
#### ls
Lists sources (all files in the current directory).

- `ls -R`: returns all files for subdirectories recursively
- `ls -l`: returns a list of files as list with additional info like creation date, chmod and etc.
- `ls -a`: returns a list of files including hidden files
- `ls -d ./*`: returns only a list of the directories
#### cp
Copies files (or/and directories) from one directory to another

- `cp file1 file2`: copies file1 to with name file2 by file2 path
- `cp -a dir1/ dir2/`: copies one directory to another directory (works as with coping of the files)
#### cd
Changes directory
#### pwd
Prints working directory
#### grep
Tool that can search in files with different pattern

```bash
# inputfile.txt
# hello world 
# hello
# hello world 
FILE=inputfile.txt

grep -b --colour "hello\ world" $FILE
# output is
# 0:hello world 
# 19:hello world 
```
#### awk
**awk** - "pattern-directed scanning and processing language". This tool scans its input for lines and performs actions on them. This lines can be filtered/parsed/modified with pattern matching.

For example, this program prints second column first:

```bash
# inputfile.txt
# 1 "hello"
# 2 "world"
FILE=inputfile.txt
awk '{ print $2, $1 }' $FILE

# output is
# "hello" 1 
# "world" 2 
```
#### wc
Utility to count character, lines and words from the input
```bash
wc -l file1
```
#### xargs
Reads delimited (by end-of-file/line, tab, spaces) input and executes command for each delimiter.

```bash
find dir1 dir2 -type f | xargs wc -l
```

---
> TBD: mv, rm, mkdir, rmdir, cat, less, head, tail, stat, file, find. touch, ln, umask, df, du, tar, gzip, zip, rsync, scp,  sed и diff
## Users
Any process in Linux OS runs from the name of the user. Moreover, linux is a multiple-user operating system, that means users can have permissions to some common resources, create groups and limit access to resources to certain users who isn't in the group. There are three access levels:

1. owner
2. owner of the group
3. other users

There are three main files to manage users and groups:
1. `/etc/passwd`: configuration file, that stores information about profiles of the users. This is a plain txt file with information like: name of the user, its id and group's id
2. `/etc/shadow`: configuration file, that stores information about logins and passwords of the users. Each password is encoded with a one-way hash function.
3. `/etc/group`: configuration file, that stores information about groups.
## Permissions
Main command that manages permissions in OS is `chmod`. It defines what users can do with a file or folder:

`chmod [options] <permissions> <files>`

Permissions available:

1. read (r)
2. write (w)
3. execution (x): permission to execute file or enter the directory

Each of this permissions can be assigned to one of the following three groups of users:

1. owner: owner of the file or folder
2. group: group of users, that owns file of folder
3. others: other users of the system

With the command [`ls -l`](#ls) given permission can be observed. For example:

```bash
rwxr-xr--
---
 | ---
 |  |  ---
 |  |   |
 |  |
 |  group read and execute access rights
 |  
 owner have all access rights
```

`chmod` allows to setup permissions for users with:

- `u` - owner (user)
- `g` - group
- `o` - others
- `a` - all

and operations:

- `+` - add permission
- `-` - remove permission
- `=` - set permission

```bash
chmod u+x file # add permission of execution to the owner of the file
chmod g-w file # remove permission of writing to the group
chmod o=r file # set permissons to read only for other users
```

Every permission symbol represents some number in binary number system:

- `r`: 4 (100 in binary)
- `w`: 2 (010 in binary)
- `x`: 1 (001 in binary)

So, every permission combination is a sum of numbers:

```bash
chmod 755 file  # set rwxr-xr-x
chmod 644 file2 # set rw-r--r--
```

## Input and Output streams
> Remember, everything in linux is a file. Streams are no exception.

Files are identifies by operating system with *file descriptors*. Every file can have up to 9 descriptors. Three are in reservation of the Bash with ids: 0, 1, 2:

- 0 - `stdin`
- 1 - `stdout`
- 2 - `stderr`

To manipulate streams there are the following commands:

- `>` (redirection): redirects output stream of the lhs command to rhs command (`ls > file.txt`). While `>` overrides rhs command with output stream, there is a `>>` command that appends output stream to the end. With this command there is a possibility to setup output stream.

	```bash
	createFile() {
		FILE_NAME=$1
		CONTENT=$2
		touch "$FILE_NAME"
		cat "$CONTENT" > "$FILE_NAME"
	}

	createFile "file1" "Hello"
	createFile "file2" "World"
	chmod -r file2

	cat file* # this command should return an error of reading file2

	cat file* > logs 2> errorlogs
	               # |
	               # |- this means redirection of the output stream
	```

	Also, output can be redirected to `null`. This can be useful if we want to catch errors but do not want to handle them: 

	```bash
	cat file2 2> /dev/nul
	```

	To redirect output to a certain stream there is a special syntax:

	```bash
	echo "Hello, World as stderr" >&2
	```

- `|` (pipe): gives output stream of lhs command to the input stream to the rhs command (`find notes > notes.txt | nvim`)

## Scripting
As you know you can access value of the variable with `$` dollar sign:

```bash
language = "bash"

echo "My favourite language is $language"
```

But there is more of this. Bash has predefined variables:

- `$HOME` - home directory path
- `OSTYPE` - type of the OS
- `$PATH` - paths to the executables
- `$?` - exit status code of the last executed command
- `$#` - amount of arguments, passed to the script
- `$*` - stores every argument, passed to the script in one line
- `$@` - stores every argument, passed to the script as the table

### Logical operators
- `-eq`: equals (\==)
- `-ne`: not equals (!=)
- `-gt`: greater than (>)
- `-ge`: greater than or equals (>=)
- `-lt`: less than (<)
- `-le`: less than or equals (<=)
- `&&`: logical AND
- `||`: logical OR
- `!`: logical NOT

```bash
if [ "$a" -gt 10 ] && [ "$b" -lt 5 ]; then
	echo "a is greater than 10 and b is less than 5"
fi
```
### Equality check
- `=`: strings are equal
- `!=`: strings aren't equal
- `-z`: string is empty
- `-n`: string isn't empty

### Loops

```bash
# for loop syntax
for i in list; do
	# body of the loop
done

# while loop syntax
while [ condition ]; do
	# body of the loop
done
```

Also, there is a special `while` loop in Bash, that runs only if its condition is false:

```bash
# until loop syntax
until [ condition ]; do
	# body of the loop
done
```