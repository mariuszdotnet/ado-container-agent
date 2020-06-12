#!/bin/bash
set -e

# Full list and details can be found here: https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops#environment-variables

#Image name
IMAGE_NAME="ado-docker-agent:latest"
#The URL of the Azure DevOps or Azure DevOps Server instance
AZP_URL=""
#Personal Access Token (PAT) with Agent Pools (read, manage) scope, created by a user that has permission to configure agents, at AZP_URL
AZP_TOKEN=""
#Agent name (default value: the container hostname)
AZP_AGENT_NAME="ado-agent-03"
#Agent pool name (default value: Default)
AZP_POOL="ado-container-pool"
#	Work directory (default value: _work)
AZP_WORK=""

# Build the docker image
docker build -t $IMAGE_NAME .

docker images

docker run -e AZP_URL=$AZP_URL -e AZP_TOKEN=$AZP_TOKEN -e AZP_AGENT_NAME=$AZP_AGENT_NAME -e AZP_POOL=$AZP_POOL $IMAGE_NAME