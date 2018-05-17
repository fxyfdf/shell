#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import re
import time
'''
hdfs_path= 'hdfs://dftthdmaster001.bj2:9000/user/hive/warehouse/sportsdb.db/log_wxsport_h5_active'
log_dir ='/data/wxsportsdatah5/active'
log_name ='active.log'
log_ip ='10.9.141.221'
118跳板机远程执行补多个地址数据
'''
def main():
    hdfs_hadoop = "/opt/dftthadoop/bin/hadoop"
   
    print ("远程补数据，需要输入以下信息：log_dir，log_name，hdfs_path，log_ip多个空格分开，日志格式选择")
    print ("补数据范围需要手动输入")
    log_dir =  raw_input('log_dir(不包含日志名):')
    log_name =  raw_input('log_name(实时生成的日志名字(不含.log) 如：active):')
    hdfs_path =  raw_input('hdfs_path:')
    log_ip =  raw_input('log_dir(本机IP)多个空格隔开:')
    log_format_status =  raw_input(''''
    历史log_name
    为log_name.log.2017-08-15.log 输入1，
    为：logname.log20170907.log 输入2,
    为logname.2017-08-15.log 输入3
    依照格式选择:''')
    '''
    #测试数据
    log_dir =  "/data/mopstatistical/mopwapclick"
    log_name =  "mopwapclick"
    hdfs_path =  "hdfs://dftthdmaster001.bj2:9000/lpf/mop/"
    log_ip =  "10.9.89.139 10.9.141.221"
    log_format_status =  1
    '''
    nian = [2018]
    yue = [3]
    ri1 = range(2,3)
    port=52222
    if int(log_format_status) == 1:
        dt_old1 = log_dt_old_1(nian,yue,ri1,log_name)
    elif int(log_format_status) == 2:
        dt_old1 = log_dt_old_2(nian,yue,ri1,log_name)
    else:
        dt_old1 = log_dt_old_3(nian,yue,ri1,log_name)
    ip = ip_list(log_ip)
 
    for ip in ip:
        for i in range(len(dt_old1[0])):
            dir_log=log_dir+"/"+str(dt_old1[1][i])
            hdfs_dir_log=hdfs_path+"/"+str(dt_old1[0][i])+"/"+str(dt_old1[1][i])+'.'+str(ip) + ' &'
            hdfs_put = dir_log + " " + hdfs_dir_log
            #/opt/dftthadoop/bin/hadoo fs -put /**/aa.log.2018-01-01.log hdfs:/***/dt=20180101/aa.log.2018-01-01.log.ip
            hdfs_commend = hdfs_hadoop + " fs -put " + hdfs_put
            hdfs_commend = "'%s'" %(hdfs_commend)
            hdfs_commend_su = "su - hadoop -c " + hdfs_commend
            hdfs_commend_su = '"%s"' %(hdfs_commend_su)
            ssh_commend ="ssh -p%d -tt %s "  %(port,ip)
            ssh_hdfs_commend = ssh_commend + hdfs_commend_su
            #print  hdfs_commend
            #print hdfs_commend_su
            #print ssh_commend
            #print ssh_hdfs_commend
       
            time1 =  time.strftime('%Y-%m-%d %H:%M:%S')
            time2 =  time.strftime('%Y-%m-%d')
            log=(ip,dir_log)
            log_os=os.popen(ssh_hdfs_commend).readline()
            log_os1 = re.split(r':',log_os)
            log_os2=str(log_os1[-1])
            os.system ('echo "%s%s%s" >> hadoop-put.log' %(str(time1),str(log),log_os2))
            print (str(time1),str(log),log_os2)
       
            '''
            #当前不可判断，需要远程执行
            if os.path.isfile(dir_log):
                os.system(ssh_hdfs_commend)
                print ("上传成功  dir_log")
                #注意需要远程登录并且切换hadoop 用户  su - hadoop -c hdfs_commend
               
                os.popen(hdfs_commend)
            else:
                print ("文件不存在")
            '''                 
            print (hdfs_put) 
#返回表分区dt 和 历史日志格式 log_old
def log_dt_old_1(nian,yue,ri1,log_name):
    '''
   (['dt=20180101', 'dt=20180201'], ['a.log.2018-01-01.log', 'a.log.2018-02-01.log'])
        返回表分区dt 和 历史日志格式 log_old
    '''
    dt1=[]
    log_old1=[]
    for yue in yue:
        for ri in ri1:
            ij = nian[0]*10000 + yue*100 + ri
            #ij = 'sdfsdf'
            log_format = str(ij)+'.log'
            dt = 'dt='+ str(ij)
            if yue < 10:
                if ri < 10:
                    log_dt = '%d-0%d-0%d.log' %(nian[0],yue,ri)
                else:
                    log_dt = '%d-0%d-%d.log' %(nian[0],yue,ri)
            else:
                if ri < 10:
                    log_dt = '%d-%d-0%d.log' %(nian[0],yue,ri)
                else:
                    log_dt = '%d-%d-%d.log' %(nian[0],yue,ri)      
            log_old = '%s.log.%s' %(log_name,log_dt)
            dt1.append(dt)
            log_old1.append(log_old)
    return (dt1,log_old1)
 
def log_dt_old_2(nian,yue,ri1,log_name):
    '''
        返回表分区dt 和 历史日志格式 log_old
   (['dt=20180101', 'dt=20180201'], ['a.log.20180101.log', 'a.log.20180201.log'])
    '''
    dt1=[]
    log_old1=[]
    for yue in yue:
        for ri in ri1:
            ij = nian[0]*10000 + yue*100 + ri
            #ij = 'sdfsdf'
            log_format = str(ij)+'.log'
            dt = 'dt='+ str(ij)
            log_dt = str(ij) + '.log'
            log_old = '%s.log%s' %(log_name,log_dt)    
            dt1.append(dt)
            log_old1.append(log_old)
    return (dt1,log_old1)
   
def log_dt_old_3(nian,yue,ri1,log_name):
    '''
        返回表分区dt 和 历史日志格式 log_old
   (['dt=20180101', 'dt=20180201'], ['a.2018-01-01.log', 'a.2018-02-01.log'])
    '''
    dt1=[]
    log_old1=[]
    for yue in yue:
        for ri in ri1:
            ij = nian[0]*10000 + yue*100 + ri
            #ij = 'sdfsdf'
            log_format = str(ij)+'.log'
            dt = 'dt='+ str(ij)   
            if yue < 10:
                if ri < 10:
                    log_dt = '%d-0%d-0%d.log' %(nian[0],yue,ri)
                else:
                    log_dt = '%d-0%d-%d.log' %(nian[0],yue,ri)
            else:
                if ri < 10:
                    log_dt = '%d-%d-0%d.log' %(nian[0],yue,ri)
                else:
                    log_dt = '%d-%d-%d.log' %(nian[0],yue,ri)
                #log_dt = '%d-0%d-%0d' %(nian[0],yue[0],ri)
            log_old = '%s.%s' %(log_name,log_dt)
            
            dt1.append(dt)
            log_old1.append(log_old)
    return (dt1,log_old1)
def ip_list(log_ip):
    '''
    把以空格分隔的IP进行转换，返回列表
    '''
    x=log_ip
    f = lambda x: [e for e in re.findall(r'[0-9]+.[0-9]+.[0-9]+.[0-9]+', x)]
    ip = f(x)
    return ip
#ip列表
#log_old = '%s%s' %(log_name,log_dt)
#hdfs_log = '%s.%s'%(log_old,log_ip)
   
if __name__ == '__main__':
    main()
    #os.system('echo "执行成功" >> hdfs.log' )

