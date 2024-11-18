#!/bin/bash
#
#
############################
#Author: Shiva
#date:14-11-2024
#version: v1
#This script will report the aws resource usage
#################################
#
##########
set -x
#AWS S3
#AWS EC2
#AWS LAMBDA
#AWS IAM USERS
#########
#
#list s3 buckets
echo "print list of s3 buckets"
aws s3 ls >> resource_tracker #filename for use of cronjob
#list ec2 instances
echo "print list of ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[]["Instance id"]' >> resource_tracker 
#list lambda 
echo "print list of lambda"
aws lambda list-functions >> resource_tracker
#list iam users
echo "print list of iam users"
aws iam list-users >> resource_tracker

