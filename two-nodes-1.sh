#!/bin/sh
set -e

# Zookeeper
docker run -d \
--name zookeeper \
 --net="host" \
 -e SERVER_ID=1 \
 -e ADDITIONAL_ZOOKEEPER_1=server.1=${HOST_IP_1}:2888:3888 \
 -e ADDITIONAL_ZOOKEEPER_2=server.2=${HOST_IP_2}:2888:3888 \
 garland/zookeeper


sleep 10

# Mesos master
docker run --net="host" \
  --name mesos-master \
  -p 5050:5050 \
  -e "MESOS_HOSTNAME=${HOST_IP_1}" \
  -e "MESOS_IP=${HOST_IP_1}" \
  -e "MESOS_ZK=zk://${HOST_IP_1}:2181,${HOST_IP_2}:2181/mesos" \
  -e "MESOS_PORT=5050" \
  -e "MESOS_LOG_DIR=/var/log/mesos" \
  -e "MESOS_QUORUM=1" \
  -e "MESOS_REGISTRY=in_memory" \
  -e "MESOS_WORK_DIR=/var/lib/mesos" \
  -d \
  garland/mesosphere-docker-mesos-master

sleep 10

# Marathon
 docker run \
 --name mesos-marathon \
 -d \
 -p 8080:8080 \
 garland/mesosphere-docker-marathon --master zk://${HOST_IP_1}:2181,${HOST_IP_2}:2181/mesos --zk zk://${HOST_IP_1}:2181,${HOST_IP_2}:2181/marathon

sleep 10

# Mesos slave
docker run -d \
 --name mesos_slave \
 --entrypoint="mesos-slave" \
 -e "MESOS_MASTER=zk://${HOST_IP_1}:2181,${HOST_IP_2}:2181/mesos" \
 -e "MESOS_LOG_DIR=/var/log/mesos" \
 -e "MESOS_LOGGING_LEVEL=INFO" \
 garland/mesosphere-docker-mesos-master:latest
