#!/bin/bash

. ./common.sh

curl -i -X DELETE -u `cat ../config/creds` https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters/$clusterID 

echo 'removing cluster information'
rm ../config/cluster.config

echo 'removing cluster config'
rm -rf ../config/solr_config

echo 'removing cluster config zip file'
rm -rf ../deploy/solr_config.zip
