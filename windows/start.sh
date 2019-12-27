#!/bin/bash
net start MongoNode1
net start MongoNode2
net start MongoNode3
net start MongoArb1
net start MongoArb2

sc query MongoNode1
sc query MongoNode2
sc query MongoNode3
sc query MongoArb1
sc query MongoArb2
