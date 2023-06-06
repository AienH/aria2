# Linux上搭建Aria2

Ubuntu/Debian系统

```bash
sudo apt-get install aria2
```

Centos

```bash
sudo yum install aria2
```

下载配置文件

```bash
git clone https://github.com/AienH/aria2.git
```

修改aria2.conf内的：

- dir：通过Aria2下载的文件，存放地址（绝对路径）
- on-download-stop：指向配置文件内`deleteAria2.sh`
- on-download-complete：同样指向配置文件内`deleteAria2.sh`
- dht-file-path：指向配置文件内`dht.dat`
- dht-file-path6：同样指向配置文件内`dht.dat`
- rpc-secret：设置Aria2验证远程码

启动aria2

```bash
sudo sh aria2.sh
```

> 如果不喜欢命令交互（问你是否要进入aria2后台窗口，把启动脚本的整段命令行交互注释掉）

关闭aria2

```bash
sudo sh shutdown_aria2.sh
```

一键脚本安装可参考这个：

- [AutoInstallAria2](https://github.com/Mintimate/AutoInstallAria2)
