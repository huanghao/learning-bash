# 控制进程

## kill

| SIGNUM | 含义 |
| --- | --- |
| 1 | HUP (hang up) |
| 2 | INT (interrupt) |
| 3 | QUIT (quit) |
| 6 | ABRT (abort) |
| 9 | KILL (non-catchable, non-ignorable kill) |
| 14 | ALRM (alarm clock) |
| 15 | TERM (software termination signal) |
| 30 | USR1 (user defined signal 1) |
| 31 | USR2 (user defined signal 2) |

### trap

## sleep

    $ sleep 1

## watch

    $ watch -n5 date
    Every 5.0s: date                                     Tue Jun 27 14:26:00 2017
    
    Tue Jun 27 14:27:15 UTC 2017

## crontab

    .---------------- minute (0 - 59) 
    |  .------------- hour (0 - 23)
    |  |  .---------- day of month (1 - 31)
    |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ... 
    |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7)  OR sun,mon,tue,wed,thu,fri,sat 
    |  |  |  |  |
    *  *  *  *  *  command to be executed

    $ crontab -l
    0 12 * * * /usr/bin/python /tmp/sync_issues.py

    $ crontab -e

格式 | 含义
--- | ---
`* * * * *` | 每分钟执行一次
`3,15 * * * *` | 每小时的第3，15分钟执行
`3,15 8-11 * * *` | 上午8点到11点的每个小时的第3，第15分钟执行
`3,15 8-11 */2 * *` | 每隔两天的上午8点到11点的第3和第15分钟执行
`3,15 8-11 * * 1` | 每周一上午8点到11点的第3和第15分钟执行
`30 21 * * *` | 每晚的21:30执行
`45 4 1,10,22 * *` | 每月1、10、22日的4 : 45
