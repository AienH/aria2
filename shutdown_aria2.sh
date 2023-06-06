#!/bin/bash

a=$(screen -ls | grep aria2 | awk '{print $1}')
screen -X -S $a quit
# 检查是否还有aria2的screen会话
if screen -ls | grep -q aria2; then
  # 如果有，输出aria2关闭失败
  echo "Aria2 failed to close"
else
  # 如果没有，输出aria2关闭成功
  echo "Aria2 closed successfully"
fi
# 退出脚本
