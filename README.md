# mesos-on-docker

Simple fast execution for testing. Variable HOST_IP should be setup before (with the local IP of the docker server).

HOST_IP=10.2.103.73

Creates: Zookeper, master, marathon, slave1 and slave2

Access to mesos
http://${HOST_IP}:5050

Access to marathon
http://${HOST_IP}:8080

-- Marathong new app (Command):
echo "hola" >> /tmp/output.txt

See: https://github.com/sekka1/mesosphere-docker#multi-node-setup

