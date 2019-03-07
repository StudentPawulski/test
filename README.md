```
This readme is generated from metadata.yaml. Manual changes to this file will be overwritten
```

# sample-api [![Badge](https://img.shields.io/badge/region-us_east_1-blue.svg)]


## repo_url
  https://chug.git.beanstalkapp.com/sample-api.git

## description
  An internal-only dummy API written in Java Vert.X which is used as platform 
for testing infrastructure changes, and as the reference implementation for 
this type of API within the company.

## contributors 
| Name | Email |
| ---- | ---- |
|Ian McPhillips|imcphillips@lotlinx.com|
|Aqeel Abbas|aabbas@lotlinx.com|
|Daniela Alves|dalves@lotlinx.com|
|Douglas Griffith|dgriffith@lotlinx.com|
|Matthew Wawrin|mwawrin@lotlinx.com|
|David Wroblewski|dwroblewski@lotlinx.com|
|Kevin Hildebrand|khildebrand@lotlinx.com|


## chef_runlist 
- role[base] 
- role[aws-node] 
- role[icinga-monitored] 
- role[icinga-localhost-8080-healthcheck] 
- role[icinga-single-lotbot-java-proc] 

## terraform 
```
us-east-1: 
  prd: 
    node_count: 1 
    node_type: t2.small
us-west-1: 
  prd: 
    node_count: 0 
    node_type: t2.small
```

## port
  8080

## deploy_type
  java_jar
