#!/bin/bash

. ./common.sh
getClusterName

curl -X POST -u `cat ../config/creds` https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters/${clusterID}/solr/admin/collections -d 'action=CREATE&name='${clusterName}'_collection&collection.configName='${clusterName}'-config'
