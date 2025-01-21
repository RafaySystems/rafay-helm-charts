## Overview

This chart allows Rafay’s Kubernetes Operation platform operator to be installed on any K8s cluster.

## Usage

- First create an imported type cluster in Rafay console and download the bootstrap yaml.

```bash
helm repo add rafay-helm-charts https://rafaysystems.github.io/rafay-helm-charts/

helm repo update

helm search repo rafay-helm-charts

export BOOTSTRAP_FILE=<location of the downloaded bootstrap file>

TOKEN=`cat $BOOTSTRAP_FILE |yq '.data.token | select(document_index == 19)'`
API_ADDR=`cat $BOOTSTRAP_FILE |yq '.data.apiAddr | select(document_index == 19)'`
CONTROL_ADDR=`cat $BOOTSTRAP_FILE |yq '.data.controlAddr| select(document_index == 19)'`
CLUSTER_ID=`cat $BOOTSTRAP_FILE |yq '.data.clusterID| select(document_index == 14)'`
RELAYS=`cat $BOOTSTRAP_FILE |yq '.data.relays| select(document_index == 14)'| sed 's/,/\\\\,/g'`

helm install v2-infra  rafay-helm-charts/v2-infra --set token=$TOKEN --set api_addr=$API_ADDR --set control_addr=$CONTROL_ADDR --set cluster_id=$CLUSTER_ID --set relays=$RELAYS -n rafay-system --create-namespace

```

Note: Release name should be v2-infra so that Rafay can take over of managing the release.
