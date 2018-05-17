for line in `cat ip.txt`
do
#ssh -p59522 root@${line} "sed -i 's/hadoop-s5qy3/hadoop-s5qy3u/g' /data/flumetaildir/waptail.sh"
#ssh -p59522 root@${line} "sed -i 's/hadoop-s5qy3uuu/hadoop-s5qy3u/g' /data/flumetaildir/share.sh"
#ssh -p59522 root@${line} "\mv /opt/hadoop-s5qy3 /opt/hadoop-s5qy3u "
#ssh -p59522 root@${line} "rm -rf /opt/hadoop-s5qy3"
#ssh -p59522 root@${line} "\rm -rf /opt/elk/flume-1.7.0-s5qy3 "
ssh -p59522 root@${line} >> ssh-comment.log << EOF
ls /opt/elk/flume-1.7.0-5nxpdx
EOF
done
