#!/bin/bash

source ./config

start()
{
set -x
for i in $(echo $NODE_ALL|tr -s ','  '\n');
do
	govc vm.clone -ds "$DS" -net "$NET" -folder "$FOLDER" -on=false -host "$ESXI_HOST" -vm "$TEMPLATE" $i
done
}

start 2>&1 |egrep -v "for|start|grep|env|cut|echo|\+\+|sed"


