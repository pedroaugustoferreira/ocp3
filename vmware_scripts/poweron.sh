#!/bin/bash

source ./config

start()
{
set -x
for i in $(echo $NODE_ALL|tr -s ','  '\n');
do
	echo $i
	govc vm.power -on $i &
done

}



start 2>&1 |egrep -v "for|start|grep|env|cut|echo|\+\+"




#govc vm.power -on bootstrap
