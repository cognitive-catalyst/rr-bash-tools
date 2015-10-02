#!/bin/bash

name_prompt() {
	echo -n "Enter the cluster's name : "
	read clusterName
}

question_prompt() {
	echo -n "Ask question : "
	read question
}

while true; do
	name_prompt

	if [[ $clusterName  ]]
	then
		break;
	fi
done

while true; do
	question_prompt

	if [[ $question  ]]
	then
		question=`echo $question | sed 's/ /%20/g'`
		break;
	fi
done

clusterID=`cat ../config/${clusterName}_cluster.config | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["solr_cluster_id"]'`


curl -u `cat ../config/creds` https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters/${clusterID}/solr/${clusterName}-collection/select?q=${question}
