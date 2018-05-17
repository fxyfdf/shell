for ip_line in `cat ip.txt`
do
ssh -p59522 root@${ip_line} >> flume-add-s5qy3u.log << EOF
    cp -r /opt/elk/flume-1.7.0 /opt/elk/flume-1.7.0-s5qy3u
    rm -f /opt/elk/flume-1.7.0-s5qy3u/conf/*.conf
    rm -f /opt/elk/flume-1.7.0-s5qy3u/conf/*.xml
    cp /opt/elk/flume-1.7.0/conf/default.conf /opt/elk/flume-1.7.0-s5qy3u/conf/
    ln -s /opt/hadoop-s5qy3u/etc/hadoop/hdfs-site.xml /opt/elk/flume-1.7.0-s5qy3u/conf/hdfs-site.xml
    ln -s /opt/hadoop-s5qy3u/etc/hadoop/core-site.xml /opt/elk/flume-1.7.0-s5qy3u/conf/core-site.xml
    chown hadoop:hadoop -R /opt/elk/
EOF
    for conf_name in `cat conf_name.txt`
    do
    #修改flume DataDir,CheckpointDir,HdfsName,H
    ssh -p59522 root@${ip_line} >> hadoop-flume.log << EOF
        cp /opt/elk/flume-1.7.0/conf/${conf_name}.conf /opt/elk/flume-1.7.0-s5qy3u/conf/${conf_name}6.conf
        sed -i '/a1.channels.c1.checkpointDir/ s/\$/6/g'       /opt/elk/flume-1.7.0-s5qy3u/conf/${conf_name}6.conf
        sed -i '/a1.channels.c1.dataDirs/ s/\$/6/g'              /opt/elk/flume-1.7.0-s5qy3u/conf/${conf_name}6.conf
        sed -i 's/dftthdmaster001.bj2:9000/s5qy3ucluster/g'   /opt/elk/flume-1.7.0-s5qy3u/conf/${conf_name}6.conf
        sed -i '/a1.sinks.k1.hdfs.filePrefix/ s/ = / = 6/g'   /opt/elk/flume-1.7.0-s5qy3u/conf/${conf_name}6.conf
	chown hadoop:hadoop -R /opt/elk/
EOF
    done
done
