### 5 Node Replica Set

* 3 data nodes and 2 arbiter node
* Installs to `C:/db/` directory on a windows machine

### Installation

* Run `/install.sh` script as an admin

* Use `net start MongoNode1` to start the first node. Similarly, start the other nodes and arbiters

* Use `net stop MongoNode1` to stop the first node. Similarly, stop the other nodes and arbiters

* Use `sc.exe delete MongoNode1` to delete the first node service.  Similarly, delete the other nodes and arbiters

* Intialize the replica set
```
var config = {
    _id: "razrnodes", members: [
        { _id: 0, host: "localhost:27717" },
        { _id: 1, host: "localhost:27718" },
        { _id: 2, host: "localhost:27719" }
    ]
}

rs.initiate(config);

rs.addArb('localhost:27720');
rs.addArb('localhost:27721');


var admin = db.getSiblingDB("admin")
admin.createUser(
  {
    user: "rootAdmin",
    pwd: passwordPrompt(), // or cleartext password
    roles: [ { role: "root", db: "admin" } ]
  }
)

var admin = db.getSiblingDB("admin")
admin.createUser(
  {
    user: "userAdmin",
    pwd: passwordPrompt(), // or cleartext password
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)

var admin = db.getSiblingDB("admin")
admin.createUser(
  {
    user: "clusterAdmin",
    pwd: passwordPrompt(), // or cleartext password
    roles: [ { role: "clusterAdmin", db: "admin" } ]
  }
)

```

#### Windows Setup 
 * Please refer to https://stackoverflow.com/questions/17413588/mongodb-as-windows-service-and-setting-up-replicaset for installing as a Window Service