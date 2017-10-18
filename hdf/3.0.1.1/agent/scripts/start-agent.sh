#!/bin/bash

ambari-agent start

while true; do
  #start SERVICES
  sleep 3
  tail -f /var/log/ambari-agent/ambari-agent.log
done
