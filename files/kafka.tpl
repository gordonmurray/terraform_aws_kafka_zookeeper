#!/bin/bash
sed -i "s/=localhost/=${zookeeper_address}/" /home/kafka/kafka/config/server.properties
sed -i "s/broker_id/`hostname -s | sed "s/.*\([^0-9]\)//g"`/" /home/kafka/kafka/config/server.properties