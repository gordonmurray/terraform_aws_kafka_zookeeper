#!/bin/bash
hostname -s | sed "s/.*\([^0-9]\)//g" | sudo -u zookeeper tee /opt/zookeeper/zookeeper/data/myid