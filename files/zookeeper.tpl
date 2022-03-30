#!/bin/bash

# Set current server myid for zookeeper
echo ${id} > /opt/zookeeper/zookeeper/data/myid

# Replace the DNS name with 0.0.0.0 or zookeeper won't start
# https://stackoverflow.com/questions/30940981/zookeeper-error-cannot-open-channel-to-x-at-election-address
if [[ "${id}" -eq 1 ]]; then
    sed -i "s/zookeeper1.${domain_name}/0.0.0.0/" /opt/zookeeper/zookeeper/conf/zoo.cfg
fi

if [[ "${id}" -eq 2 ]]; then
    sed -i "s/zookeeper2.${domain_name}/0.0.0.0/" /opt/zookeeper/zookeeper/conf/zoo.cfg
fi

if [[ "${id}" -eq 3 ]]; then
    sed -i "s/zookeeper3.${domain_name}/0.0.0.0/" /opt/zookeeper/zookeeper/conf/zoo.cfg
fi

# restart
sudo service zookeeper restart