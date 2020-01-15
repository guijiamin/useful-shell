#!/bin/bash
key=test_key
value=test_value

if [ $1 ]; then
  key=$1
else
  echo "Please input key"
  # exit -1
fi

if [ $2 ]; then
  value=$2
else
  echo "Please input value"
  # exit -1
fi

ip=(www.baidu.com www.taobao.com)
env=0
if ping -c 2 ${ip[${env}]} >/dev/null 2>&1
    then
      echo "Ping ${ip[${env}]} is success" 
    else
      echo "Ping ${ip[${env}]} is failure"
      exit -1
fi

count=1
for((i=0;i<count;i++))
do
  str=${key}"@"${value}
  echo ${str}
  echo ${str} | /usr/local/kafka_2.11-1.0.1/bin/kafka-console-producer.sh --broker-list localhost:9092 --property parse.key=true --property key.separator=@ --topic test
done

