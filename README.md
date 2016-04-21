# mesos-on-docker

Simple fast execution for testing.

See: https://github.com/sekka1/mesosphere-docker#multi-node-setup

## One - node (at least 4GB of RAM for basic testing)

Variable HOST_IP should be setup before (with the local IP of the docker server).

export HOST_IP=10.2.103.73

Creates: Zookeper, master, marathon, slave1 and slave2

Starting (make sure everything is stopped and cleaned before, see below): 
```
curl -fsSL https://raw.githubusercontent.com/alberto-grande/mesos-on-docker/master/one-node.sh | sh
```

Access to mesos
http://PUBLIC_IP:5050

Access to marathon
http://PUBLIC_IP:8080

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




## Two - nodes (at least 4GB of RAM each for basic testing)

Variables HOST_IP_1 and HOST_IP_2 should be setup before (with the local IP of the docker servers).
export HOST_IP_1=10.2.103.73
export HOST_IP_2=10.11.33.193

Creates: Zookeper, master, marathon, slave on each node

Starting (make sure everything is stopped and cleaned before, see below): 
```
curl -fsSL https://raw.githubusercontent.com/alberto-grande/mesos-on-docker/master/two-nodes-1.sh | sh
curl -fsSL https://raw.githubusercontent.com/alberto-grande/mesos-on-docker/master/two-nodes-2.sh | sh
```

Stop (on each node):
```
docker stop mesos_slave mesos-marathon mesos-master zookeeper 
```

Clean (on each node):
```
docker rm mesos_slave mesos-marathon mesos-master zookeeper 
```
