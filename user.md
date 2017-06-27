# 编辑用户

## useradd

    添加一个新用户alice，创建home目录(`-m`)，设置登陆shell为bash(`-s`)，添加sudo组`-G`

    $ useradd -m -s /bin/bash -G sudo alice

## userdel

    $ userdel bob
    $ id bob
    id: 'bob': no such user

## change password

    每行修改一个用户。用户名和密码用`:`分割

    $ printf 'alice:Docker!\nbob:Docker!' | chpasswd

交互式修改密码

    $ passwd
    Changing password for alice.
    (current) UNIX password: xxx
    Enter new UNIX password: yyy
    Retype new UNIX password: yyy
    passwd: password updated successfully

## chsh：修改登陆shell

    $ chsh
    Password: xxx
    Changing the login shell for alice
    Enter the new value, or press ENTER for the default
        Login Shell [/bin/bash]: /bin/sh
