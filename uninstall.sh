#!/bin/bash
net stop MongoNode1
net stop MongoNode2
net stop MongoNode3
net stop MongoArb1
net stop MongoArb2

sc delete MongoNode1
sc delete MongoNode2
sc delete MongoNode3
sc delete MongoArb1
sc delete MongoArb2