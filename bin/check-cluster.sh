#!/bin/bash

name_prompt() {
	echo -n "Enter the cluster's name : "
	read clusterName
}

while true; do
	if [[ $clusterName  ]]
	then
		break;
	fi

	name_prompt
done

clusterID=`cat ../config/${clusterName}_cluster.config | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["solr_cluster_id"]'`

curl  -u `cat ../config/creds` https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters/$clusterID

echo ''

