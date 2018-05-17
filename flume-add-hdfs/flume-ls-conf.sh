for line in `cat ip.txt`
do
ssh -p59522 root@${line} 'ls /opt/elk/flume-1.7.0-s5qy3/conf/'
done

