# Setup MongoDB Replica set on Ubuntu

- Update repo

`sudo apt-get update`

- Install MongoDB

`sudo apt-get install mongodb`

- Make directories for data and logs

`mkdir -p /srv/mongodb/node1 /srv/mongodb/node2 /srv/mongodb/arb1`

`mkdir -p /var/log/mongodb/node1 /var/log/mongodb/node2 /var/log/mongodb/arb1`

- Install OpenSSL key and give necessary permissions:

`openssl rand -base64 741 > /srv/mongodb/mongo-key`

`sudo chmod mongodb /srv/mongodb/mongo-key`

`chmod 400 /srv/mongodb/mongo-key`

- Copy and paste the `.conf` files into `/etc/`

- Enable permission for the data folders and log folders

`chmod 777 -R /var/log/mongodb/`

`chmod 777 -R /srv/mongodb/node1/`

`chmod 777 -R /srv/mongodb/node2/`

`chmod 777 -R /srv/mongodb/arb1/`

- Connect to primary and init a replica set

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
```

- Create necessary users

```
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

- Now enable authorization and you're done!