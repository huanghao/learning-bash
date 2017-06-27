# bash语法

## 空格和换行

bash的shell脚本对于空格和换行非常敏感。有很多时候，在需要加空格的地方一定要有空格，在没有空格的地方必须不能有。不然都会有语法错误。所以，一定在学习的过程中，养成良好的语法习惯，避免以后的很多麻烦。

## 变量

前面已经用到了一些变量的例子。

一般来说，变量里存放都只是字符串而已。不过某些特殊的命令可以把字符串当成数字来处理。

shell中的变量都是全局变量。

## 输入和输出

输出通过echo，printf都可以。这里单说通过read读键盘输入，存到一个变量里：

    $ read NAME
    alice
    $ echo $NAME
    alice

## 逻辑值和返回值

每个进程在退出的时候都会有一个退出码(return code)。在shell用`$?`来表示。一般用0代表正常。

$ echo hello; echo $?
hello
0

用`;`来分割同一行的两条命令。

    $ ls not-exist-file; echo $?
    ls: cannot access 'not-exist-file': No such file or directory
    2

可以看到ls出错时，退出码为2。

### test 和 `[`

test和`[`是同一个东西。通过对表达式求值，得到布尔值。

    $ type test [
    test is a shell builtin
    [ is a shell builtin

查看一个文件是否存在，存在的话`$?`返回0

    $ test -f not-exist; echo $?
    1

这个两种方式得到相同的结果

    $ [ -f not-exist ]; echo $?
    1

| test | `[]` | 含义 |
| --- | --- | --- |
| 文件测试 |
| -d name | `[ -d name ]` | 是一个目录 |
| -f name | `[ -f name ]` | 是一个文件 |
| -L name | `[ -L name ]` | 是符号链接 |
| -r name | `[ -r name ]` | 存在，并且可读 |
| -w name | `[ -w name ]` | 存在，并且可写 |
| -x name | `[ -x name ]` | 存在，并且可执行 |
| -s name | `[ -s name ]` | 存在，并且大小不为0 |
| f1 -nt f2 | `[ f1 -nt f2 ]` | 文件f1比f2更新 |
| f1 -ot f2 | `[ f1 -ot f2 ]` | 文件f1比f2更旧 |
| 字符串测试 |
| s1 = s2 | `[ s1 = s2 ]` | 相等 |
| s1 != s2 | `[ s1 != s2 ]` | 不等 |
| -z s1 | `[ -z s1 ]` | 长度为0 |
| -n s1 | `[ -n s1 ]` | 长度不为0 |
| 数值测试 |
| a -eq b | `[ a -eq b ]` | 相等 |
| a -ne b | `[ a -ne b ]` | 不等 |
| a -gt b | `[ a -gt b ]` | 大于 |
| a -ge b | `[ a -ge b ]` | 大于等于 |
| a -lt b | `[ a -lt b ]` | 小于 |
| a -le b | `[ a -le b ]` | 小于等于 |
| 组合 |
| t1 -a t2 | `[ t1 -a t2 ]` | 与 && |
| t1 -o t2 | `[ t1 -o t2 ]` | 或 |
| !t1 | | 非 |

### true && false

    $ type true false
    true is a shell builtin
    false is a shell builtin
    $ false; echo $?
    1

## 条件语句

    if [ $(whoami) = root ]; then
        echo "You are the super user"
    elif sudo -n true; then
        echo "You have permission to run as a super user"
    else
        echo bye !
    fi

## for循环

    for name in Tom Jack Harry; do
        echo "$name is my friend";
    done

## while循环

    seq 1 5 | while read N; do
        echo $(expr $N \* 2);
    done

## shebang

shell脚本的第一行一般都是`#!/bin/bash`

这是因为，`#`代表这一行是注释。如果这是文件的第一行，并且这个文件有执行权限，shell会通过路径找到这个命令，并把文件传给命令来执行。

其他脚本语言，也有类似的写法，例如python的第一行，也常见`#!/usr/bin/python`。原理也是类似的。