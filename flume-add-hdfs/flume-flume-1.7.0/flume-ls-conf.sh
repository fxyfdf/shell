i=0
for line in `cat ip.txt`
do
for conf_name in `cat conf_name.txt`
do
i=$((i+1))
echo "##########$i########$line##############"
echo ${conf_name}
ssh -p59522 root@${line} " ls /opt/elk/flume-1.7.0/conf/${conf_name}.conf "
done
done

