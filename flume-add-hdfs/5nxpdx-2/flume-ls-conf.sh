i=0
for line in `cat ip.txt`
do
i=$((i+1))
echo "##########$i########$line##############"
ssh -p59522 root@${line} 'ls /opt/elk/flume-1.7.0-5nxpdx/conf/pcadvshowlog5.conf'
done

