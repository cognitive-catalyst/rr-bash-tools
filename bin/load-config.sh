#!/bin/bash

. ./common.sh
getClusterName

(
cd ../config/solr_config && zip -r ../../deploy/solr_config.zip *
)

curl -X POST -H "Content-Type: application/zip" -u `cat ../config/creds` https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters/${clusterID}/config/${clusterName}-config --data-binary @../deploy/solr_config.zip


