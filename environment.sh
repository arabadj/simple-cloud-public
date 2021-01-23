#!/bin/bash

#===========================================================================================================================
#===========================================================================================================================
export PROJECT="simple"
export PROJECT_ROOT="~/work/cloud/simple-cloud"
export DEPLOYER="simplename"
export REGION="eu-central-1"
#---------------------------------------------------------------------------------------------------------------------------
export PROJECT_ENV="$PROJECT_ROOT/environment.sh"
#---------------------------------------------------------------------------------------------------------------------------
export TF_VAR_deployer=$DEPLOYER
#---------------------------------------------------------------------------------------------------------------------------
export ANSIBLE_INVENTORY="$PROJECT_ROOT/inventory.ini"
export ANSIBLE_REMOTE_USER=$DEPLOYER
export ANSIBLE_REMOTE_PORT="22"
export ANSIBLE_SSH_ARGS="-C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no"
export ANSIBLE_ACTION_WARNINGS="False"
export ANSIBLE_STDOUT_CALLBACK="yaml"
export ANSIBLE_LOAD_CALLBACK_PLUGINS="True"
export ANSIBLE_SSH_PIPELINING="True"
#===========================================================================================================================
