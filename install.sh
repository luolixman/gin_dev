#!/bin/bash
dName="weilev"
version="weilev:latest"
docker stop $dName
docker rm $dName
docker rmi $version
cd /root
dir="/opt/weilev/config"
if [ ! -d "$tempPath" ]; then
    mkdir -p $dir
fi
cd /opt/weilev/config
tempPath="/opt/weilev/config/config.yml"
if [ ! -f "$tempPath" ]; then
    downConfig=`wget https://raw.luolix.top/luolixman/gin_dev/main/config.yml`
fi
cd /opt/$dName
rm -f *
downDockerfile=`wget https://raw.luolix.top/luolixman/gin_dev/main/Dockerfile`
get_arch=`arch`
if [[ $get_arch =~ "x86_64" ]];then
    echo "install amd64>>>>>>>>>>>"
    downFlie=`wget https://git.luolix.top/luolixman/gin_dev/releases/download/gin_first-v1.0.0/main_amd64`
    mv main_amd64 main
elif [[ $get_arch =~ "aarch64" ]];then
    echo "install arm64>>>>>>>>>>>"
    downFlie=`wget https://git.luolix.top/luolixman/gin_dev/releases/download/gin_first-v1.0.0/main_arm64`
    mv main_arm64 main
elif [[ $get_arch =~ "mips64" ]];then
    echo "this is mips64"
else
    echo "未知系统，无法编译"
fi
chmod 777 /opt/$dName/main
buildDocker=`docker build -t $version .`
runDocker=`docker run -d -p 8088:8088 --name $dName -it -v /opt/$dName:/opt/gin $version`
