#!/bin/bash
. ./common.sh
getClusterName
getCollectionPath

curl -v --data-binary @$collection -X POST -H "Content-Type: application/json" -u `cat ../config/creds` https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters/${clusterID}/solr/${clusterName}-collection/update

