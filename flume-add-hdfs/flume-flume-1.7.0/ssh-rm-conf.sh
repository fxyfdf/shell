#flume_dir="flume-1.7.0-5nxpdx"
flume_dir="flume-1.7.0"
#flume_dir="flume-1.7.0-ecgdbr"
i=0
for line in `cat ip.txt`
do
i=$((i+1))

echo "----------$i------$line-------------" >> ssh-rm-conf.log
for conf_name in `cat conf_name.txt`
do
ssh -p59522 -tt   root@$line  >> ssh-rm-conf.log << EOF
    log_name=${conf_name}.conf
    echo \$log_name
    rm -f /opt/elk/flume-1.7.0/conf/log_name
    exit
EOF
done
done
sed -i '/root\|flume\|name\|done\|exit\|logout\|Last\|echo\|do/d' ssh-rm-conf.log 
exit
