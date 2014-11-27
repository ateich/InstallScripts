echo $1

if [[ $1 = "run" ]]
then
  echo "Let's run this command: "
  sudo service openvpn start client
  currentIP=$(ifconfig tun0 | grep "inet addr" | awk -F: '{print $2'} | awk '{print $1}')
  #echo $currentIP > mesosIP.log
  #echo 'Current IP: ' $currentIP
  #echo $2
  #mesos-slave --master=zk://10.9.0.1:2181/var/zookeeper/ --ip=$currentIP --port=5051 --attributes=$2 > mesos.log
  nohup sudo mesos-slave --master=zk://10.9.0.1:2181/var/zookeeper/ --ip=$currentIP --port=505 0<&- &>mesos.log &
else
  echo 'KILL MESOS!'
  $1
fi
