#!/bin/bash

current="$(pwd)"
cd c:
mkdir db
mkdir db/logs
mkdir db/node1 db/node2 db/node3 db/arb1 db/arb2

echo $current
mongod -f $current/node1.conf --serviceName MongoNode1 --serviceDisplayName MongoNode1 --install
mongod -f $current/node2.conf --serviceName MongoNode2 --serviceDisplayName MongoNode2 --install
mongod -f $current/node3.conf --serviceName MongoNode3 --serviceDisplayName MongoNode3 --install
mongod -f $current/arb1.conf --serviceName MongoArb1 --serviceDisplayName MongoArb1 --install
mongod -f $current/arb2.conf --serviceName MongoArb2 --serviceDisplayName MongoArb2 --install