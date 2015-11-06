#!/bin/bash

. ./common.sh

getClusterName


clusterID=`cat ../config/${clusterName}_cluster.config | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["solr_cluster_id"]'`

curl  -u `cat ../config/creds` https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters/$clusterID

echo ''

