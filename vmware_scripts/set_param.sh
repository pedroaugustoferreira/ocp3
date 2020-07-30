#!/bin/bash

source ./config

start()
{
set -x
for i in $(echo $NODE_ALL|tr -s ','  '\n');
do
	echo $i
	govc vm.change -c=6 -m=24576 -e=sched.cpu.latencySensitivity=high -e=disk.enableUUID=1 -vm=$i
done

}



start 2>&1 |egrep -v "for|start|grep|env|cut|echo|\+\+"

#govc snapshot.revert -vm master1 original &
