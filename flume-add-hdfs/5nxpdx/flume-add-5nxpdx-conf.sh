for ip_line in `cat ip.txt`
do
#ssh -p59522 root@${ip_line} >>hadoop-flume.log << EOF
#    cp -r /opt/elk/flume-1.7.0 /opt/elk/flume-1.7.0-5nxpdx
#    rm -f /opt/elk/flume-1.7.0-5nxpdx/conf/*.conf
#    cp /opt/elk/flume-1.7.0/conf/default.conf /opt/elk/flume-1.7.0-5nxpdx/conf/
#    ln -s /opt/hadoop-5nxpdx/etc/hadoop/hdfs-site.xml /opt/elk/flume-1.7.0-5nxpdx/conf/hdfs-site.xml
#    ln -s /opt/hadoop-5nxpdx/etc/hadoop/core-site.xml /opt/elk/flume-1.7.0-5nxpdx/conf/core-site.xml
#    chown hadoop:hadoop -R /opt/elk/
#EOF
    for conf_name in `cat conf_name.txt`
    do
    #修改flume DataDir,CheckpointDir,HdfsName,H
    ssh -p59522 root@${ip_line} >> hadoop-flume.log << EOF
        cp /opt/elk/flume-1.7.0/conf/${conf_name}.conf /opt/elk/flume-1.7.0-5nxpdx/conf/${conf_name}5.conf
        sed -i '/a1.channels.c1.checkpointDir/ s/\$/5/g'       /opt/elk/flume-1.7.0-5nxpdx/conf/${conf_name}5.conf
        sed -i '/a1.channels.c1.dataDirs/ s/\$/5/g'              /opt/elk/flume-1.7.0-5nxpdx/conf/${conf_name}5.conf
        sed -i 's/dftthdmaster001.bj2:9000/5nxpdxcluster/g'   /opt/elk/flume-1.7.0-5nxpdx/conf/${conf_name}5.conf
        sed -i '/a1.sinks.k1.hdfs.filePrefix/ s/ = / = 5/g'   /opt/elk/flume-1.7.0-5nxpdx/conf/${conf_name}5.conf
	chown hadoop:hadoop -R /opt/elk/
EOF
    done
done
