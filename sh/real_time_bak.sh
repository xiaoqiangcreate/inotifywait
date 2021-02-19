#!/bin/bash

dat=`date  +"%Y-%m"`
tim=`date  +"%d"`

ossdir=/opt/ossbak/hujiao/$dat/$tim/

dir=/var/spool/asterisk/monitor/mszx/$dat/$tim/
cd $dir
#inotifywait -mrq --format  '%Xe %w%f' --exclude ^.+\.[^mp3]$ -e modify,create,attrib,close_write,move ./ | while read file
inotifywait -mrq --format  '%Xe %w%f' --exclude ^.+\.[^mp3]$ -e create ./ | while read file
do
        INO_EVENT=$(echo $file | awk '{print $1}')      # 把inotify输出切割 把事件类型部分赋值给INO_EVENT
        INO_FILE=$(echo $file | awk '{print $2}')       # 把inotify输出切割 把文件路径部分赋值给INO_FILE

        #if [[ $INO_EVENT == 'CREATE' ]] || [[ $INO_EVENT == 'MODIFY' ]] || [[ $INO_EVENT == 'CLOSE_WRITE' ]] || [[ $INO_EVENT == 'MOVED_TO' ]]         # 判断事件类型
        if [[ $INO_EVENT == 'CREATE' ]]         # 判断事件类型
        then
                if [ ! -d $ossdir ]
                then
                        mkdir -p $ossdir
                fi

                #rsync -r -v -a $INO_FILE $ossdir &>>/root/rsync.loga
		ossutil64 cp $INO_FILE oss://hujiao-minshi/hujiao/$dat/$tim/ &>>/root/bak.log
        fi
done
