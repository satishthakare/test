#!/bin/sh
/usr/local/sbin/oc login -u system -p admin --server=https://10.20.14.183:8443 --insecure-skip-tls-verify
/usr/local/sbin/oc project xoriant-cicd

#/usr/local/sbin/oc delete all --selector app=eureka-server
/usr/local/sbin/oc delete all --selector app=microservice
/usr/local/sbin/oc delete all --selector app=microservice2
/usr/local/sbin/oc delete all --selector app=forex-service
#/usr/local/sbin/oc delete all --selector app=api-gateway
/usr/local/sbin/oc delete all --selector app=currency-conversion


#cd /disk2/softwares/openshift_training/docker/eureka-server
#/usr/local/sbin/oc new-app . --name=eureka-server --strategy=docker
#/usr/local/sbin/oc start-build eureka-server --from-dir .

cd /disk2/softwares/openshift_training/docker/Microservice
/usr/local/sbin/oc new-app . --name=microservice --strategy=docker
/usr/local/sbin/oc start-build microservice --from-dir .

cd /disk2/softwares/openshift_training/docker/microservice2
/usr/local/sbin/oc new-app . --name=microservice2 --strategy=docker
/usr/local/sbin/oc start-build microservice2 --from-dir .

cd /disk2/softwares/openshift_training/docker/forex-service
/usr/local/sbin/oc new-app . --name=forex-service --strategy=docker
/usr/local/sbin/oc start-build forex-service --from-dir .

#cd /disk2/softwares/openshift_training/docker/api-gateway
#/usr/local/sbin/oc new-app . --name=api-gateway --strategy=docker
#/usr/local/sbin/oc start-build api-gateway --from-dir .

cd /disk2/softwares/openshift_training/docker/currency-conversion
/usr/local/sbin/oc new-app . --name=currency-conversion --strategy=docker
/usr/local/sbin/oc start-build currency-conversion --from-dir .
