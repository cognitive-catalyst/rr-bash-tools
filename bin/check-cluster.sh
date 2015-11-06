#!/bin/bash

. ./common.sh
getClusterName

curl  -u `cat ../config/creds` https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters/$clusterID

echo ''

