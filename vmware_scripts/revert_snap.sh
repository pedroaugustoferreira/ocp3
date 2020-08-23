#!/bin/bash

source ./config

start()
{
set -x
for i in $(echo $NODE_ALL|tr -s ','  '\n');
do
	echo $i
	govc snapshot.revert -vm $i original2 &
done

}



start 2>&1 |egrep -v "for|start|grep|env|cut|echo|\+\+"

#govc snapshot.revert -vm master1 original &
