i=0
for log_name in `cat log_name.txt`
do
for line in `cat ip.txt`
do

   i=$((i+1))
   echo "-------------------------$i---------$line-------------------------------"
   ssh -p59522 root@$line "ps -ef |grep flume | grep  ${log_name}"
   echo $line
done
done

