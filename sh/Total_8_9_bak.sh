#!/bin/bash

#dat=`date -d "1 day ago" +"%Y-%m"`
#tim=`date -d "1 day ago" +"%d"`

#dir=/var/spool/asterisk/monitor/mszx/$dat/
dir=/var/spool/asterisk/monitor/mszx/2020-08/
#ossdir=/opt/ossbak/hujiao/$dat
ossdir=/opt/ossbak/hujiao/2020-08/

cd $dir

if [ ! -d $ossdir ]
then
        mkdir -p $ossdir
fi

/usr/bin/rsync -r -v -a $tim $ossdir/ >>/root/rsync.log 2>&1

