#!/bin/bash

name_prompt() {
	echo -n "Enter the cluster's name : "
	read clusterName
}

collection_prompt() {
	echo -n "Enter the collection's path : "
	read collection
}

while true; do
	name_prompt

	if [[ $clusterName  ]]
	then
		break;
	fi
done

while true; do
	collection_prompt

	if [[ -e $collection  ]]
	then
		break;
	fi
done

clusterID=`cat ../config/${clusterName}_cluster.config | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["solr_cluster_id"]'`


curl -v --data-binary @$collection -X POST -H "Content-Type: application/json" -u `cat ../config/creds` https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters/${clusterID}/solr/${clusterName}-collection/update

