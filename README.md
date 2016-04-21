# mesos-on-docker

## One - node (at least 8GB of RAM for basic testing)

Simple fast execution for testing. Variable HOST_IP should be setup before (with the local IP of the docker server).

HOST_IP=10.2.103.73

Creates: Zookeper, master, marathon, slave1 and slave2

Starting: 
```
curl -fsSL https://raw.githubusercontent.com/alberto-grande/mesos-on-docker/master/one-node.sh | sh
```

Access to mesos
http://${HOST_IP}:5050

Access to marathon
http://${HOST_IP}:8080

-- Marathong new app (Command):
echo "hola" >> /tmp/output.txt


Stop:
```
docker stop mesos_slave_1 mesos_slave_2 mesos-marathon mesos-master zookeeper 
```

Cleaning:
```
docker rm mesos_slave_1 mesos_slave_2 mesos-marathon mesos-master zookeeper 
```
See: https://github.com/sekka1/mesosphere-docker#multi-node-setup

