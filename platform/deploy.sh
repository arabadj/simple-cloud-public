#!/bin/bash

#===========================================================================================================================
. ../environment.sh
CWD=$PWD
#---------------------------------------------------------------------------------------------------------------------------
export MAIN="main.tf"
echo "#===========================================================================================================================" > ./$MAIN
echo "" >> ./$MAIN
echo "terraform {" >> ./$MAIN
echo "  required_version = \"=0.12.24\"" >> ./$MAIN
echo "  backend \"s3\" {" >> ./$MAIN
echo "    bucket = \"$DEPLOYER-tfstate\"" >> ./$MAIN
echo "    key    = \"$PROJECT.tfstate\"" >> ./$MAIN
echo "    region = \"$REGION\"" >> ./$MAIN
echo "  }" >> ./$MAIN
echo "}" >> ./$MAIN
echo "" >> ./$MAIN
echo "#---------------------------------------------------------------------------------------------------------------------------" >> ./$MAIN
echo "" >> ./$MAIN
echo "provider \"aws\" {" >> ./$MAIN
echo "  version = \"~> 2.69\"" >> ./$MAIN
echo "  region  = local.region" >> ./$MAIN
echo "}" >> ./$MAIN
echo "" >> ./$MAIN
echo "#===========================================================================================================================" >> ./$MAIN
#---------------------------------------------------------------------------------------------------------------------------
# terraform plan
# terraform apply
terraform apply -auto-approve
#===========================================================================================================================
