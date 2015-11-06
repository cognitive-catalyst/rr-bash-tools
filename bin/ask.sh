#!/bin/bash

. ./common.sh

question_prompt() {
	echo -n "Ask question : "
	read question
}

while true; do
	question_prompt

	if [[ $question  ]]
	then
		question=`echo $question | sed 's/ /%20/g'`
		break;
	fi
done


curl -u `cat ../config/creds` https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters/${clusterID}/solr/${clusterName}-collection/select?q=${question}
