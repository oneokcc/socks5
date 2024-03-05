#!/bin/bash
#获取本机非127.0.0的ip个数

v=`ip addr|grep -o -e 'inet [0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}'|grep -v "127.0.0"|awk '{print $2}'| wc -l`
num=`cat /proc/sys/net/ipv6/conf/all/disable_ipv6`

if [[ "$num" -eq "0" ]];then
cat >>/etc/sysctl.conf <<END
#disable ipv6
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1
END
fi



echo 正在处理，请耐心等待
rpm -qa|grep "wget" &> /dev/null
if [ $? == 0 ]; then
    echo 环境监测通过
else
    yum -y install wget
fi


echo "runing pelase waiting"
   echo 正在处理，请耐心等待
   echo;rm -fr /tmp/cut&&touch /tmp/cut
   read -p "请在30秒内输入端口否则使用随机端口："  -t 30  port
   if [ $port -gt 1999 -a $port -lt 60000 ] 2>/dev/null ;then
   echo -e "\033[33m您输入的端口为：$port\033[0m";echo "port=$port">>/tmp/cut
   else
   echo -e "\033[33m您输入的端口错误，将使用随机端口！\033[0m" 
   fi
   read -p "请在30秒内输入密码否则使用随机密码："  -t 30  pass
   if [ ! -n "$pass" ]; then
   echo -e "\033[33m您输入的密码为空，将使用随机密码！\033[0m" 
   else
   echo -e "\033[33m您输入的密码为：$pass\033[0m";echo "pass=$pass">>/tmp/cut
   fi
   echo
   echo -e "\033[35m".........请耐心等待正在安装中........."\033[0m"
   echo 
   bash <(curl -s -L https://raw.githubusercontent.com/oneokcc/socks5/main/newsocks5.sh)  t.txt >/dev/null 2>&1
   PIDS=`ps -ef|grep gost|grep -v grep`
   if [ "$PIDS" != "" ]; then
      s=`ps -ef|grep gost|grep -v grep|awk '{print $2}'| wc -l`
      echo -e "\033[35m一共生成$s条，格式 IP--端口--用户名--密码\033[0m"
      cat /tmp/s5
      
     # echo -e "\033[33m 是否需要导出所有的配置数据到电脑上？需要请输入 1 ,文件名是 s5 t.txt \033[0m"&&read value
      if [ $value -eq 1 ]; then
           # yum -y install lrzsz
            #echo -e "\033[41m" 开始导出，请注意文件名是s5 t.txt "\033[0m"
            #sz /tmp/s5
            #echo -e "\033[41m" 请注意，文件名是 s5 t.txt "\033[0m"
      fi
      
      
      echo -e "\033[33m  安装完成 \033[0m"&&read -s -n1
      history -c&&echo > ./.bash_history
   else
      echo -e "\033[41m安装失败!!! \033[0m"
   fi
else 
   echo 
   echo -e "\033[41m" 模式错误。该工具仅限学习使用不得用在其他用途 "\033[0m"
   echo 

#fi
