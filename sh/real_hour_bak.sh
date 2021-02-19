#!/bin/bash

dat=`date  +"%Y-%m"`
tim=`date  +"%d"`

#ossdir=/opt/ossbak/hujiao/$dat/$tim/
ossdir=/opt/ossbak/hujiao/2021-02/02/

#dir=/var/spool/asterisk/monitor/mszx/$dat/$tim/
dir=/var/spool/asterisk/monitor/mszx/2021-02/02/
cd $dir

if [ ! -d $ossdir ]
then
    mkdir -p $ossdir
fi
rsync -r -v -a --include "*.mp3" $dir $ossdir &>>/root/rsync.log

