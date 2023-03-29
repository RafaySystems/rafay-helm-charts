## Overview

This chart allows Rafay’s Kubernetes Operation platform operator to be installed on a Openshift cluster.

## Usage

- First create an imported type cluster in Rafay console and download the bootstrap yaml.

```bash
helm repo add rafay-helm-charts https://rafaysystems.github.io/rafay-helm-charts/

helm repo update

helm search repo rafay-helm-charts

# Apply the CRDs
kubectl apply -f https://raw.githubusercontent.com/RafaySystems/rafay-helm-charts/main/charts/rafay-operator-redhat/crds-backup/crds.yaml

export BOOTSTRAP_FILE=<location of the downloaded bootstrap file>

TOKEN=`cat $BOOTSTRAP_FILE |yq '.data.token | select(document_index == 15)'`
API_ADDR=`cat $BOOTSTRAP_FILE |yq '.data.apiAddr | select(document_index == 15)'`
CONTROL_ADDR=`cat $BOOTSTRAP_FILE |yq '.data.controlAddr| select(document_index == 15)'`

helm install v2-infra  rafay-helm-charts/rafay-operator-redhat --set token=$TOKEN --set api_addr=$API_ADDR --set control_addr=$CONTROL_ADDR -n rafay-system --create-namespace

```

Note: Release name should be v2-infra so that Rafay can take over of managing the release.