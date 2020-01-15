#!/bin/bash
# 批量删除匹配key
# redis-cli keys "key*" | xargs redis-cli del
while read line
 do
  echo $line | redis-cli -h 127.0.0.1 -p 6379
  sleep 0.005
done < redis.txt

