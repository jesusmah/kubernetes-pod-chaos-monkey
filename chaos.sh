#!/bin/bash
# Randomly delete pods in a Kubernetes namespace.
set -ex

: ${DELAY:=30}
: ${NAMESPACE:=default}

while true; do
  POD=`kubectl \
    --namespace "${NAMESPACE}" \
    -o 'jsonpath={.items[*].metadata.name}' \
    get pods | \
      tr " " "\n" | \
      shuf | \
      head -n 1`
  echo Deleting Pod $POD...
  kubectl --namespace "${NAMESPACE}" delete pod $POD
  sleep "${DELAY}"
done
