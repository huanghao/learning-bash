# 切换用户

## su：切换用户

不写用户名，表示要切换到root用户

    alice@lb:~$ su -
    Password: xxxx
    su: Authentication failure

使用`-`代表，希望模拟用户登陆进入的环境

    alice@lb:~$ su - bob
    Password: xxxx
    bob@lb:~$

## sudo

sudo是一套管理命令。使得管理员能够为用户配置以别人的身份来运行指定的命令。不需要他们之间共享密码。并且每次运行sudo都是有日志记录的。包括正常和失败。

    root@lb:~# cat /etc/sudoers
    #
    # This file MUST be edited with the 'visudo' command as root.
    #
    # Please consider adding local content in /etc/sudoers.d/ instead of
    # directly modifying this file.
    #
    # See the man page for details on how to write a sudoers file.
    #
    Defaults    env_reset
    Defaults    mail_badpass
    Defaults    secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
    
    # Host alias specification
    
    # User alias specification
    
    # Cmnd alias specification
    
    # User privilege specification
    root    ALL=(ALL:ALL) ALL
    
    # Members of the admin group may gain root privileges
    %admin ALL=(ALL) ALL
    
    # Allow members of group sudo to execute any command
    %sudo   ALL=(ALL:ALL) ALL
    
    # See sudoers(5) for more information on "#include" directives:
    
    #includedir /etc/sudoers.d
    alice ALL=NOPASSWD: ALL
