# Echo

## echo

    $ echo hello world
    hello world

转义, `\n`, `\t`, `\\`等

    $ echo -e 'hello\nworld'
    hello
    world

不输出尾部的回车

    alice@lb:~$ echo -n 1234
    1234alice@lb:~$

## printf

和c语言的printf类似

    $ printf "%03d%5d\n" 1 2
    001    2

## 变量

默认都是全局变量，在当前的shell运行期间都可以见。

    $ X=123
    $ echo $X
    123
    $ echo $Y
    
    $

变量赋值，直接用`=`，注意等号两边不要有空格。变量名规则，一般的标示符。下划线和字符开头，后跟下划线字符数字。

引用变量时，在变量前面加`$`。还可以把变量名用`{}`包裹起来。变量不存在时，不会报错，而是以空来代替。


    $ echo .${X}_Y.
    .123_Y.
    $ echo .$X_Y.
    ..

TODO: export

## seq：用来生成数字序列

last

    alice@lb:~$ seq 3
    1
    2
    3

first last

    alice@lb:~$ seq 3 5
    3
    4
    5

first incr last

    alice@lb:~$ seq 3 2 7
    3
    5
    7

## clear：清理当前的屏幕
