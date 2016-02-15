# rr-bash-tools

A collection of BASH tools that make working with the Retrieve and Rank Watson Service on Bluemix a little easier.

## Tutorial


### Create a Retrieve and Rank service
First create a Retrieve and Rank service on Bluemix using the following Cloud Foundry commands.

Create the service
```
cf create-service retrieve_and_rank ecosystem nimhRR
```

Add a set of service credentials
```
cf create-service-key nimhRR nimhkey
cf service-key nimhRR nimhkey
```

Create a 'creds' file in the config directory in the form:

```
uid:pwd
```

### Use the tools

Create a cluster and check on its status. The status of READY indicates the service is ready for use.

```
cd bin
./create-cluster.sh
./check-cluster.sh
```

While waiting on the READY state, edit your SOLR configuration. For purposes of this tutorial, use the base_config in the samples directory.

```
# assuming you are bin directory
cp -r ../samples/base_config ../config/solr_config
```

Once your cluster is READY, then load your configuration and create a collection:
```
./load-config.sh
./create-collection.sh
```

Now we need to load your data! This tutorial will use the x2js utility.

```
# assuming you are in bin directory
# convert excel spreadsheet to JSON
x2sj -i ../samples/nimh.xlsx -o ../output/nimh.json
#load documents into SOLR
./load-collection.sh
```

Then you may query!

```
./ask.sh
```
