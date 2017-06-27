# excise

1. 使用tail -f事实查看nginx日志，过滤某个接口500的日志
2. 使用netstat命令，监控当前机器上不同socket状态的数量
3. 在一个python源代码的根目录，统计所有源文件的代码行数




































参考答案

    $ watch -n2 "date; echo; netstat -n -ptcp | awk '{print \$6}' | sort | uniq -c | sort -nr"

    Every 2.0s: date; echo; netstat -n -ptcp | awk '{print $6}' | sort | uniq - Wed Jun 28 00:30:44 2017

    Wed Jun 28 00:30:44 CST 2017

     161 CLOSE_WAIT
     115 ESTABLISHED
       2 SYN_SENT
       1 LAST_ACK
       1 Foreign
       1
