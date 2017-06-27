# 查看用户

## whoami

    $ whoami
    alice

## id

    $ id
    uid=1000(alice) gid=1000(alice) groups=1000(alice),27(sudo)

## who：显示目前有哪些用户登陆到系统

    $ who
    huanghao console  Jun 10 12:04
    huanghao ttys000  Jun 21 13:08
    huanghao ttys001  Jun 21 13:09
    huanghao ttys003  Jun 26 19:34
    huanghao ttys004  Jun 27 12:35

## last：显示登陆用户的历史信息

    $ last -10
    huanghao  ttys004                   Tue Jun 27 12:35   still logged in
    huanghao  ttys004                   Tue Jun 27 00:34   still logged in
    huanghao  ttys004                   Mon Jun 26 23:32   still logged in
    huanghao  ttys003                   Mon Jun 26 19:34   still logged in
    huanghao  ttys003                   Thu Jun 22 13:48   still logged in
    huanghao  ttys003                   Wed Jun 21 17:10   still logged in
    huanghao  ttys001                   Wed Jun 21 13:09   still logged in
    huanghao  ttys000                   Wed Jun 21 13:08   still logged in
    huanghao  ttys004                   Mon Jun 19 18:08   still logged in
    huanghao  ttys004                   Sat Jun 17 23:55   still logged in
