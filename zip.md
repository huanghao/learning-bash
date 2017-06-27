# 打包，压缩

## tar：打包

创建tarball

    $ tar -cf archive.tar file1 file2 dir1
    $ ls -l archive.tar
    -rw-r--r-- 1 alice alice 10240 Jun 27 13:05 archive.tar

查看压缩包里的内容

    $ tar -tvf archive.tar
    -rw-r--r-- alice/alice       0 2017-06-27 13:04 file1
    -rw-r--r-- alice/alice       0 2017-06-27 13:04 file2
    drwxr-xr-x alice/alice       0 2017-06-27 13:04 dir1/

解包

    $ mkdir tmp
    $ cd tmp
    $ tar -xf ../archive.tar
    $ ls
    dir1/  file1  file2

## gzip, gunzip, zcat

    $ ls -lh foo
    -rw-r--r-- 1 alice alice 283K Jun 27 13:08 foo
    $ gzip foo
    $ ls -lh foo.gz
    -rw-r--r-- 1 alice alice 107K Jun 27 13:08 foo.gz

不解压缩，直接查看内容

    $ zcat foo.gz | head -2
    1
    2

## bzip2, bunzip, bzcat

    $ bzip2 foo
    $ ls -lh foo.bz2
    -rw-r--r-- 1 alice alice 67K Jun 27 13:08 foo.bz2

tar命令中添加z和j两个参数，可以指定压缩和解压

- `-z`, `--gzip`, 文件扩展名一般为`.tgz`,或者`.tar.gz`
- `-j`, `--bzip2`，扩展名`.tbz`，`.tar.bz2`
