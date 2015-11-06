#!/bin/bash

if [[ -e ../config/cluster.config ]]
then
	clusterID=`cat ../config/cluster.config | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["solr_cluster_id"]'`
	clusterName=`cat ../config/cluster.config | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["cluster_name"]'`
fi

name_prompt() {
	echo -n "Enter the cluster's name : "
	read clusterName
}

getClusterName() { 

	if [[ ${clusterName} ]]
	then
		return;
	fi

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

getCollectionPath() {
	while true; do
		collection_prompt

		if [[ -e $collection  ]]
		then
			break;
		fi
	done
}
