#!/bin/bash

source ./config

start()
{
set -x
for i in $(echo $NODE_ALL|tr -s ','  '\n');
do
	echo $vm
	govc vm.info $i
done
}

start 2>&1 |egrep -v "for|start|grep|env|cut|echo|\+\+|sed"

