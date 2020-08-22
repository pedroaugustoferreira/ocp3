#!/bin/bash

source ./config

start()
{
set -x
for i in $(echo $NODE_ALL|tr -s ','  '\n');
do
	govc vm.power -off $i
done

for i in $(echo $NODE_ALL|tr -s ','  '\n');
do
        govc vm.destroy $i
done
}

start 2>&1 |egrep -v "for|start|grep|env|cut|echo|\+\+|sed"

