# 比较文件内容

## diff

只有左边有显示为`<`，只有右边`>`

    $ diff file1.py file2.py
    1,3c1
    < from __future__ import print_function
    <
    < print('hello', 'world')
    ---
    > print 'hello world'

## md5sum

通过比较两个文件的md5值，可以很快的判断文件内容是否更改。从网上下载大文件的时候，也常常用来判断下载过程中是否有出错。

    $ md5sum file*.py
    3844a58270e73cc0bc6a0eaac979feea  file1.py
    d05d0c8adf1f67e6e52f82aba1bbeb5a  file2.py
