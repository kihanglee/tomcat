#!/bin/bash
hostname=`hostname`
rst=`jeusadmin -host localhost:9736 -u jeus -p jeus si | grep ${hostname} | grep RUNNING | wc -l`

if [ $rst -ge 1 ]
then
    exit 0;
else
    exit 1;
fi
