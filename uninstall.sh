#!/bin/bash
docker-compose -f docker-compose.yml stop && docker-compose -f docker-compose.yml rm -vf
rm -rf zookeeper/{data,logs} && mkdir -p zookeeper/{data,logs}
