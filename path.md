# 文件位置，路径

## which：查找命令的路径

    $ which wget
    /usr/bin/wget

### $PATH：命令搜索路径

一个用`:`分割的路径列表。shell在查找命令的时候会按照这个搜索路径的顺序依次查找某个命令名字是否存在。如果存在多个重名的命令，那么第一个将被返回。

按照这个顺序，local中的命令是本地后安装的，优先级较高，usr的次之，顶层目录一般是随系统安装的，优先级最低。

    $ echo $PATH
    /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

当前目录`.`默认是不在搜索列表中的。所以经常看到为了执行当前目录下的某个命令，需要输入类似`./cmd`形式的命令，显式指定cmd在当前目录下。

这是因为如果把当前目录作为优先级最高的搜索项，会有安全风险。攻击者只需要创建一些权限较低，但是名字通用的可执行文件，来骗用户执行恶意程序。

    $ cat cd
    #!/bin/bash
    echo really bad !
    
    $ ./cd tmp
    really bad !

## type：找出命令

type比which要快，因为它是 *a shell builtin* （内置函数）；而which是个程序，可以被其他的任何shell或者进程来调用。

    $ type which type if wget
    which is hashed (/usr/bin/which)
    type is a shell builtin
    if is a shell keyword
    wget is /usr/bin/wget

另外 *hashed* 是一个加速查找的hash table，hashed以后命令，不会每次从磁盘上去查找它的位置。

### help for builtin commands

内置命令不能通过man来查看文档，因为它们并没有安装对应的man pages。但是它们可以直接在bash里通过help来查看。

    $ man type
    No manual entry for type

    $ help type | less
    $ help hash | less

## find [OPTIONS] [starting-point ...] [expression]: 查找文件

find是linux命令中非常有用的命令之一。它的功能强大，用法也比较复杂。单独用一章来详细讲解都不算多。在这里，我们只是介绍find的基本用法，详细的用法请通过阅读man find来仔细学习。

不带任何参数的find从当前目录往下列出所有文件和目录

    alice@lb:/usr/lib/python3.5$ find | head
    .
    ./http
    ./http/server.py
    ./http/cookies.py
    ./http/client.py
    ./http/__init__.py
    ./http/cookiejar.py
    ./http/__pycache__
    ./http/__pycache__/server.cpython-35.pyc
    ./http/__pycache__/cookiejar.cpython-35.pyc

某种文件名模式

    alice@lb:/usr/lib/python3.5$ find . -name '*.py' | head
    ./http/server.py
    ./http/cookies.py
    ./http/client.py
    ./http/__init__.py
    ./http/cookiejar.py
    ./copy.py
    ./_osx_support.py
    ./logging/handlers.py
    ./logging/config.py
    ./logging/__init__.py

通过文件大小来查找，并使用ls -l来输出它们的信息

    alice@lb:/usr/lib/python3.5$ find . -size +300k -exec ls -lh {} \;
    -rw-r--r-- 1 root root 389K Nov 17  2016 ./pydoc_data/topics.py
    -rw-r--r-- 1 root root 379K Jun 27 01:42 ./pydoc_data/__pycache__/topics.cpython-35.pyc

空文件

    alice@lb:/usr/lib/python3.5$ find . -size 0 -exec ls -lh {} \;
    -rw-r--r-- 1 root root 0 Nov 17  2016 ./pydoc_data/__init__.py
    -rw-r--r-- 1 root root 0 Nov 17  2016 ./urllib/__init__.py
    -rw-r--r-- 1 root root 0 Nov 17  2016 ./email/mime/__init__.py

通过修改时间来查找。300天以上没有被修改的文件

    alice@lb:/usr/lib/python3.5$ find . -mtime +300 -exec ls -lh {} \;
    -rw-r--r-- 1 root root 126 Nov 23  2013 ./_sysconfigdata.py

和时间相关的还有-atime, -mtime, -ctime

通过路径匹配。`-print`就是默认动作，打印文件名

    alice@lb:/usr/lib/python3.5$ find . -path '*/socket*' -print
    ./socketserver.py
    ./socket.py
    ./__pycache__/socket.cpython-35.pyc
    ./__pycache__/socketserver.cpython-35.pyc

通过正则表达式匹配

    alice@lb:/usr/lib/python3.5$ find . -regex '.*urllib.*.py'
    ./lib2to3/fixes/fix_urllib.py
    ./urllib/response.py
    ./urllib/parse.py
    ./urllib/error.py
    ./urllib/request.py
    ./urllib/__init__.py
    ./urllib/robotparser.py
