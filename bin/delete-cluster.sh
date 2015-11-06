#!/bin/bash

. ./common.sh

getClusterName

clusterID=`cat ../config/${clusterName}_cluster.config | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["solr_cluster_id"]'`


curl -i -X DELETE -u `cat ../config/creds` https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters/$clusterID 


echo 'removing cluster information'
rm ../config/${clusterName}_cluster.config

echo 'removing cluster config in ../lib'

rm -rf ../lib/${clusterName}_solr_config

