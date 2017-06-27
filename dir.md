# 目录操作

## pwd：查看当前目录

    $ pwd
    /home/alice

## cd：切换当前目录

    alice@lb:~$ cd /tmp
    alice@lb:/tmp$ pwd
    /tmp

`-`切换到上次的位置

    alice@lb:/tmp$ cd -
    /home/alice
    alice@lb:~$ cd -
    /tmp

`pushd`和`popd`维护了一个目录栈（FILO）。

`pushd`切换到给定目录，并把该目录放到栈顶。

`popd`从栈顶移除一个目录，并切换到这个目录。

仔细看例子PS1中当前目录的变化

    alice@lb:~$ pushd /tmp
    /tmp ~
    alice@lb:/tmp$ pushd /var/lib
    /var/lib /tmp ~
    alice@lb:/var/lib$ echo do something
    do something
    alice@lb:/var/lib$ popd
    /tmp ~
    alice@lb:/tmp$ echo do something else
    do something else
    alice@lb:/tmp$ popd
    ~
    alice@lb:~$ popd
    bash: popd: directory stack empty

## mkdir：创建目录

    $ mkdir dirx
    $ ls
    dirx/

被创建目录的父目录必须存在

    $ mkdir x/y
    mkdir: cannot create directory 'x/y': No such file or directory
    $ mkdir x
    $ mkdir x/y

递归创建所有目录

    $ mkdir -p x/y/z
    $ tree
    .
    `-- x
        `-- y
            `-- z

## rmdir：删除空目录

    $ tree
    .
    |-- dirx
    |   `-- a
    `-- x
        `-- y
            `-- z

目录不为空，不能删除，需要先把里面的文件和子目录都删除

    $ rmdir dirx
    rmdir: failed to remove 'dirx': Directory not empty
    $ rm dirx/a
    $ rmdir dirx
    $ ls
    x/

递归删除指定目录和所有祖先空目录

    $ rmdir x
    rmdir: failed to remove 'x': Directory not empty
    $ rmdir -p x/y/z
    $ tree
    .
    
    0 directories, 0 files

如果某层目录不为空，就停止

    $ tree
    .
    `-- x
        `-- y
            |-- a
            `-- z
    
    3 directories, 1 file
    $ rmdir -p x/y/z
    rmdir: failed to remove directory 'x/y': Directory not empty
    $ tree
    .
    `-- x
        `-- y
            `-- a
    
    2 directories, 1 file

从顶层目录开始递归删除（包含所有文件）

    $ rm -r x/