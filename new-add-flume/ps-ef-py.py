#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
count=0
log_name = file('log_name.txt','r')   #打开文件## r只读，w可写，a追加
for log_name in log_name.readlines():
    #log_name = line.strip(\n').(':') # 把每一行  按照：  进行分割，存储在列表中  并且 删除回车
    count=count+1
    print (count)
    count2=0
    ip=file('ip.txt','r')
    for ip in ip.readlines():
        #ip = line_ip.strip(\n)
        count2=count2+1 
        ssh_commend="ssh -p 59522 root@%s ' ps -ef | grep flume| grep hadoop| grep %s '" % (ip.strip('\n'),log_name.strip('\n'))
        print ssh_commend
        os.system(ssh_commend)
        print (count2)

