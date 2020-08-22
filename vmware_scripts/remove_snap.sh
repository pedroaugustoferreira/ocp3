#!/bin/bash

source ./config

start()
{
set -x
for i in $(echo $NODE_ALL|tr -s ','  '\n');
do
	echo $vm
	govc snapshot.remove -vm $i '*'
done
}

start 2>&1 |egrep -v "for|start|grep|env|cut|echo|\+\+|sed"


exit 1
NAME can be the snapshot name, tree path, moid or '*' to remove all snapshots.

Examples:
  govc snapshot.remove -vm my-vm happy-vm-state
