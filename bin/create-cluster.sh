#!/bin/bash

name_prompt() {
	echo -n "Enter the cluster's name : "
	read clusterName
}

while true; do
	name_prompt

	if [[ $clusterName  ]]
	then
		break;
	fi
done


curl -H 'content-type: application/json' -X POST -u `cat ../config/creds` "https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters" -d '{"cluster_name": "'"${clusterName}"'" }' > ../config/${clusterName}_cluster.config

echo 'copying solr config to ../lib'
cp -r ../lib/solr_config ../lib/${clusterName}_solr_config

