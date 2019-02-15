# photoai-api

## name:
  photoai-api

## repo_url:
  https://chug.git.beanstalkapp.com/photoai-api.git

## description:
  desc goes here

## Contributors: 
| Name | Email |
| ---- | ---- |
|Aqeel Abbas|aabbas@lotlinx.com|
|David Wroblewski|dwroblewski@lotlinx.com|
|Kevin Hildebrand|khildebrand@lotlinx.com|
|Ian Mcphillips|imcphillips@lotlinx.com|


## chef_runlist: 
- role[base] 
- role[aws-node] 
- role[icinga-monitored] 
- role[icinga-localhost-8080-healthcheck] 
- role[icinga-single-lotbot-java-proc] 

## terraform: 
## us-east-1: 
## prd: 
    node_count: 1 
    node_type: t2.medium
## us_west-1: 
## prd: 
    node_count: 2 
    node_type: t2.small
## stg: 
    cluster_habitation_override: ec2prdhwatever
