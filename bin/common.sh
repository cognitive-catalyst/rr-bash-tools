#!/bin/bash

name_prompt() {
	echo -n "Enter the cluster's name : "
	read clusterName
}

getClusterName() { 
	
	while  true; do
        	name_prompt

	        if [[ $clusterName  ]]
		then
			break;
		fi
	done
}

collection_prompt() {
	echo -n "Enter the collection's path : "
	read collection
}

getCollctionPath() {
	while true; do
		collection_prompt

		if [[ -e $collection  ]]
		then
			break;
		fi
	done
}
