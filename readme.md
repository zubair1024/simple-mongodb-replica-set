### 5 Node Replica Set

* 3 data nodes and 2 arbiter nodes
* Installs to `C:/db/` directory on a windows machine

### Installation

* Run `/install.sh` script as an admin

* Use `net start MongoNode1` to start the first node. Similarly, start the other nodes and arbiters

* Use `net stop MongoNode1` to stop the first node. Similarly, stop the other nodes and arbiters

* Use `sc.exe delete MongoNode1` to delete the first node service.  Similarly, delete the other nodes and arbiters

#### Windows Setup 
 * Please refer to https://stackoverflow.com/questions/17413588/mongodb-as-windows-service-and-setting-up-replicaset for installing as a Window Service