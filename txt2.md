# 高级文本操作

## grep：从文件中查找模式

grep是另一个linux中非常重要的命令。建议通过man grep详细阅读它的所有文档。

    alice@lb:/usr/lib/python3.5$ grep -n 'import' *.py | head
    __future__.py:20:    from __future__ import FeatureName
    __future__.py:31:    from __future__ import FeatureName
    __future__.py:33:to use the feature in question, but may continue to use such imports.
    __future__.py:54:    "absolute_import",
    __future__.py:71:CO_FUTURE_ABSOLUTE_IMPORT = 0x4000 # perform absolute imports by default
    __future__.py:118:absolute_import = _Feature((2, 5, 0, "alpha", 1),
    _bootlocale.py:2:(imported by the _io module), in order to reduce startup time.
    _bootlocale.py:4:Don't import directly from third-party code; use the `locale` module instead!
    _bootlocale.py:7:import sys
    _bootlocale.py:8:import _locale

查找所有源码中定义了match函数的地方

    alice@lb:/usr/lib/python3.5$ find . -name '*.py' | xargs grep -n 'def match(' | head
    ./re.py:160:def match(pattern, string, flags=0):
    ./sre_parse.py:242:    def match(self, char):
    ./lib2to3/fixer_base.py:78:    def match(self, node):
    ./lib2to3/pytree.py:455:    def match(self, node, results=None):
    ./lib2to3/pytree.py:523:    def match(self, node, results=None):
    ./lib2to3/pytree.py:674:    def match(self, node, results=None):
    ./lib2to3/pytree.py:809:    def match(self, node):
    ./lib2to3/fixes/fix_imports.py:106:    def match(self, node):
    ./lib2to3/fixes/fix_idioms.py:79:    def match(self, node):
    ./lib2to3/fixes/fix_numliterals.py:17:    def match(self, node):

## awk

awk按行来处理文本，每行再分成很多列。输入分隔符是`IFS`，默认是空白字符，输出分隔符是`OFS`，默认是空格。

程序结构

BEGIN block只在程序最开始执行一次，END只在最后执行一次。中间的pattern和action可以有多个。

pattern是可选的，如果没有模式定义，就代表匹配所有。模式的形式类似于`$2 = "404"`。

action在对应的模式匹配了已经需要进行的操作。默认的操作就是输出整行。

    BEGIN {...}
    
    pattern_1 {...}
    ...
    pattern_n {...}
    
    END {}

    $ head -2 logs
    172.17.0.1 - - [27/Jun/2017:18:24:58 +0000] "GET / HTTP/1.1" 403 572 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36" "-"
    172.17.0.1 - - [27/Jun/2017:18:25:02 +0000] "GET / HTTP/1.1" 403 572 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36" "-"

    $ cat logs | awk '{print $4}' | awk -F':' '{print $2 ":" $3}' | uniq -c
          1 18:24
          4 18:25

## sed

## python

一般情况下使用上面几个命令能处理大部分简单的文本。如果实在用上面的命令实在处理有难度。建议直接使用python来处理文本。因为python处理文本非常强大，并且几乎在所有的发行版都有默认安装python。