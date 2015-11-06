#!/bin/bash

. ./common.sh
getClusterName

curl -H 'content-type: application/json' -X POST -u `cat ../config/creds` "https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters" -d '{"cluster_name": "'"${clusterName}"'" }' > ../config/cluster.config

echo 'copying solr config to ../lib'
tar xvzf  ../lib/solr_config.tar.gz -C ../config/

