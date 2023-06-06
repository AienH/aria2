#!/bin/bash

# 安装并检查 screen 是否安装
if ! command -v screen &>/dev/null; then
  read -p "screen is not installed. Do you want to install it? (type 'yes' or 'no'): " answer
  case "${answer}" in 
    yes)
      if command -v apt-get &>/dev/null; then
        sudo apt-get -qq install -y screen &>/dev/null || { echo "Failed to install screen via apt-get"; exit 1; }
      elif command -v yum &>/dev/null; then
        sudo yum -q install -y screen &>/dev/null || { echo "Failed to install screen via yum"; exit 1; }
      else
        echo "Could not determine the package manager on your system. Screen is required for this script to run. Quitting..."
        exit 1
      fi
      ;;
    *)
      echo "Screen is required for this script to run. Quitting..."
      exit 1
      ;;
  esac
fi

conf_path=$(conf_path=$(find $HOME -name "aria2.conf" 2>/dev/null))
# 启动 aria2
screen -S aria2 -d -m bash -c "aria2c --conf-path="${conf_path}"; exec bash" || { echo "Failed to start Aria2"; exit 1; }
echo "Minecraft server started successfully"

# 命令行交互
while true; do
  read -p "Do you want to enter the Aria2 console? (yes/no): " answer
  case "${answer}" in 
    yes)
      screen -r aria2
      ;;
    no)
      echo "Exiting..."
      break
      ;;
    *)
      echo "Invalid input, please enter 'yes' or 'no'"
      ;;
  esac
done

exit 0
