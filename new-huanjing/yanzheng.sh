for line in `cat ip.txt`
do
  ssh -p52222   root@$line 'useradd hadoop'
  ssh -p52222   root@$line ls '/opt/'
  echo $line
done
