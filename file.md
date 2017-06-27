# 简单文件操作

## ls

当前目录

    $ ls
    file1  file2  some-file

其他目录

    $ ls / /home
    /:
    bin/   dev/  home/  lib64/  mnt/  proc/  run/   srv/  tmp/  var/
    boot/  etc/  lib/   media/  opt/  root/  sbin/  sys/  usr/

    /home:
    alice/  bob/

`.`代表当前目录；`..`代表父目录；其他以`.`开头的文件为隐藏文件，默认ls不会显示。

    $ ls -a
    .  ..  .bash_logout  .bashrc  .profile  .viminfo  file1  file2  some-file

列表模式

    $ ls -l
    total 520
    drwxr-xr-x 1 root root    4096 Jun 26 15:53 X11
    -rw-r--r-- 1 root root    3028 Jun 19 20:23 adduser.conf
    drwxr-xr-x 1 root root    4096 Jun 26 16:32 alternatives
    drwxr-xr-x 3 root root    4096 Jun 26 15:53 apparmor
    ...

文件大小

    $ ls -lh
    total 520K
    drwxr-xr-x 1 root root   4.0K Jun 26 15:53 X11
    -rw-r--r-- 1 root root   3.0K Jun 19 20:23 adduser.conf
    drwxr-xr-x 1 root root   4.0K Jun 26 16:32 alternatives
    drwxr-xr-x 3 root root   4.0K Jun 26 15:53 apparmor
    ...

显示文件类型(one of `*/=>@|`)

    $ ls -F
    X11/                    insserv.conf     python3.5/
    adduser.conf            insserv.conf.d/  rc.local*
    alternatives/           iproute2/        rc0.d/
    apparmor/               issue            rc1.d/
    apparmor.d/             issue.net        rc2.d/
    apt/                    kernel/          rc3.d/
    bash.bashrc             ld.so.cache      rc4.d/
    bash_completion.d/      ld.so.conf       rc5.d/
    bindresvport.blacklist  ld.so.conf.d/    rc6.d/
    binfmt.d/               ldap/            rcS.d/
    ca-certificates/        legal            resolv.conf
    ca-certificates.conf    libaudit.conf    rmt*
    calendar/               localtime@       rpc

- `*` executable regular file
- `/` directory
- `=` socket
- `>` door
- `@` symbol link
- `|` FIFO
- (nothing) regular file

颜色显示

    $ ls --color

只显示目录，不显示里面的文件

    $ ls -ld /usr
    drwxr-xr-x 1 root root 4096 Jun 20 23:18 /usr

用时间排序

    alice@lb:/etc$ ls -lt | head
    total 520
    drwxr-xr-x 1 root root    4096 Jun 26 16:32 alternatives
    -rw-r--r-- 1 root root    3332 Jun 26 16:32 mailcap
    -rw-r--r-- 1 root root       3 Jun 26 16:09 hostname
    -rw-r--r-- 1 root root     164 Jun 26 16:09 hosts
    -rw-r--r-- 1 root root     153 Jun 26 16:09 resolv.conf
    lrwxrwxrwx 1 root root      12 Jun 26 16:09 mtab -> /proc/mounts
    -rw-r--r-- 1 root root      19 Jun 26 16:08 subgid
    -rw-r--r-- 1 root root     610 Jun 26 16:08 group
    -rw-r----- 1 root shadow   513 Jun 26 16:08 gshadow

## mv: 移动文件

    $ ls
    file1  file2
    $ mv file2 file3
    $ ls
    file1  file3

如果目标文件名已经存在，**重名的目标文件会被直接覆盖（没有提示）**。

    $ mv file3 file1
    $ ls
    file1

移动到另一个目录中

    $ mv file1 /tmp/file2
    $ ls /tmp
    file2

如果目标是一个目录，文件会被直接移动到目标目录中，不改名

    $ mv file1 /tmp
    $ ls /tmp
    file1

## cp: 复制文件

    $ ls
    file1
    $ cp file1 file2
    $ ls
    file1  file2

递归复制目录和所有子目录

    $ tree
    .
    |-- d1
    |   |-- d2
    |   |   `-- file3
    |   `-- file2
    `-- file1
    
    2 directories, 3 files
    $ cp -r d1 d3
    $ tree
    .
    |-- d1
    |   |-- d2
    |   |   `-- file3
    |   `-- file2
    |-- d3
    |   |-- d2
    |   |   `-- file3
    |   `-- file2
    `-- file1
    
    4 directories, 5 files

行为和`mv`类似，目标文件存在的时候，会直接被覆盖

## rm：删除文件

    $ ls
    file1  file2
    $ rm file1
    $ rm file1
    rm: cannot remove 'file1': No such file or directory

忽略各种错误提示

    $ rm -f file1

递归删除

    $ rm -r dirx/

删除空目录

    $ rm -d dirx/
    $ rm -d d1
    rm: cannot remove 'd1': Directory not empty
    $ rmdir d1
    rmdir: failed to remove 'd1': Directory not empty

## ln：链接文件

hard link很少用。我们只谈symbolic link

    $ ls
    file1
    $ ln -s file1 file2
    $ ls
    file1  file2@
    $ ls -l
    total 0
    -rw-r--r-- 1 alice alice 0 Jun 26 19:15 file1
    lrwxrwxrwx 1 alice alice 5 Jun 26 19:25 file2 -> file1

符号链接只是源文件的一个别名，删除符号链接不会影响源文件。

    $ rm file2
    $ ls
    file1

删除源文件，也不会影响到符号链接，只是通过符号链接就找不到源文件了。

    $ rm file1
    $ ls -l
    total 0
    lrwxrwxrwx 1 alice alice 5 Jun 27 00:01 file2 -> file1

系统中存在大量的符号链接，通过它们提供方便的名字来引用各种文件。

使用`readlink`可以查看它链接的源文件

    $ readlink /usr/bin/vim
    /etc/alternatives/vim
    $ ls -l /usr/bin/vim
    lrwxrwxrwx 1 root root 21 Jun 26 19:00 /usr/bin/vim -> /etc/alternatives/vim*

