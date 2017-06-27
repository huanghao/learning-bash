# 学习环境

## ubuntu 16.04 LTS

所有的例子都在ubuntu-16.04上给出。还有bash的版本。

    $ docker run --rm -h lb -ti lb /bin/bash
    alice@lb:~$ cat /etc/issue
    Ubuntu 16.04.2 LTS \n \l

    alice@lb:~$ bash --version
    GNU bash, version 4.3.48(1)-release (x86_64-pc-linux-gnu)
    Copyright (C) 2013 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

    This is free software; you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.

## alice

命令前会有 `$` 或者 `#` 符号。分别代表普通用户，或者root用户。

除非需要root权限，后面的命令都使用`alice`用户来运行，这是我们为讲解而创建的默认用户。

    alice@lb:~$ id
    uid=1000(alice) gid=1000(alice) groups=1000(alice)

如果需要root权限，通过`sudo`命令来运行（alice用户运行sudo不需要输入自己的密码）。

    alice@lb:~$ sudo whoami
    root
    alice@lb:~$ sudo su -
    root@lb:~# id
    uid=0(root) gid=0(root) groups=0(root)
    root@lb:~#

一般情况下，默认的当前目录都是/home/alice目录，这是alice的home目录，一般用 `~` 这个符号来表示home目录。

任何时候想要回到家目录，只需要执行不带参数的`cd`命令，或者`cd ~`，就可以回到home目录。

    alice@lb:~$ pwd
    /home/alice
    alice@lb:~$ cd /usr/lib/python2.7/dist-packages/
    alice@lb:/usr/lib/python2.7/dist-packages$ cd
    alice@lb:~$ pwd
    /home/alice

命令行之前的提示符叫做PS1（prompt string 1）。shell在每次等待我们的输入时，都会显示这个。

在我们的例子里它一直都会是`<user>@<host>:<dir>$`这种格式，关于如何定制修改它不在这里解释。

    alice@lb:~$ echo $PS1
    \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$

## editor

一般情况下，我们使用vim来编辑文件。

    alice@lb:~$ vim

![vim.png](vim.png)

输入`:q<Enter>`可以退出vim编辑器，回到shell提示符。

## manual

man命令可以用来查看命令的手册。将会进入到一个交互式的界面。需要记住的几个按键有：

- q: 退出man
- h: 查看帮助
- f: 下一页
- b: 上一页

    alice@lb:~$ man bash

![man.png](man.png)

## apt

apt是ubuntu的包管理命令。它是一系列的命令合集。这里列举几个非常有用的命令：

查找

    $ apt-cache search netcat
    netcat-openbsd - TCP/IP swiss army knife
    cryptcat - A lightweight version netcat extended with twofish encryption
    netcat - TCP/IP swiss army knife -- transitional package
    netcat-traditional - TCP/IP swiss army knife
    netrw - netcat like tool with nice features to transport files over network

安装

    # apt-get install netcat
    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    The following additional packages will be installed:
      netcat-traditional
    The following NEW packages will be installed:
      netcat netcat-traditional
    0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
    Need to get 64.1 kB of archives.
    After this operation, 191 kB of additional disk space will be used.
    Do you want to continue? [Y/n] y
    Get:1 http://mirrors.tuna.tsinghua.edu.cn/ubuntu xenial/universe amd64 netcat-traditional amd64 1.10-41 [60.7 kB]
    Get:2 http://mirrors.tuna.tsinghua.edu.cn/ubuntu xenial/universe amd64 netcat all 1.10-41 [3438 B]
    Fetched 64.1 kB in 0s (173 kB/s)
    debconf: delaying package configuration, since apt-utils is not installed
    Selecting previously unselected package netcat-traditional.
    (Reading database ... 15677 files and directories currently installed.)
    Preparing to unpack .../netcat-traditional_1.10-41_amd64.deb ...
    Unpacking netcat-traditional (1.10-41) ...
    Selecting previously unselected package netcat.
    Preparing to unpack .../netcat_1.10-41_all.deb ...
    Unpacking netcat (1.10-41) ...
    Processing triggers for man-db (2.7.5-1) ...
    Setting up netcat-traditional (1.10-41) ...
    update-alternatives: using /bin/nc.traditional to provide /bin/nc (nc) in auto mode
    Setting up netcat (1.10-41) ...

查看某个包安装的文件列表

    $ dpkg-query -L netcat
    /.
    /usr
    /usr/share
    /usr/share/doc
    /usr/share/doc/netcat
    /usr/share/doc/netcat/copyright
    /usr/share/doc/netcat/changelog.Debian.gz

查看某个文件由哪个包提供

    $ dpkg-query -S $(which apt-get)
    apt: /usr/bin/apt-get

替换apt安装源为国内镜像，下面的例子是[清华大学tuna](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/)

    $ cat /etc/apt/sources.list
    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse

