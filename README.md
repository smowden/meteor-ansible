An Ansible Playbook for deploying Meteorapps

This Ansible playbook will allow you to deploy Meteor apps of all sizes to your own servers/VMs.
It handles setups of varying complexity. From a single small VM that serves your app to a load balanced
setup with multiple servers.

Features:
- Deploying multiple apps to a single server
- Setup and configure a MongoDB server with authentification and oplog enabled
- Scale vertically by spawning multiple processes of your app.
  Passenger will handle loadbalancing requests across those processes
- Scale horizontally across multiple servers with HaProxy
- Configure SSL support either for a single node or HaProxy

Inventory:
This playbook covers three types of groups in your inventory:
- appservers
- mongoservers
- loadbalancers



For a minimal setup (with hosted MongoDB servers with a service like compose)
you only need to provide a single IP in the appservers section

SSH Agent forwarding:
This playbook instructs ansible to forward your ssh agent, which means that
git and mrt will have access to the same repositories that your ssh key has.
Note: you need to run ssh-add -k on OSX once per sessions to add your keys
to the ssh agent

Tests:
To run tests run run_tests.sh <test name>
Three Tests are included and also serve as examples:
- single_node: Launch a MongoDB server and a appserver with an instance of Telescope
- two_node_multisite:
  Launch a dedicated MongoDB server, and configure passenger on one to serve both Spacetalk (with SSL) and Telescope from the same server
  Note: you can use the same pattern to seperate your staging and production environment
- load_balanced_spacetalk: Launch and configure: A MongoDB server, two appservers (with two instances per server) and a loadbalancer for Spacetalk


Possible group variables:
all.yml
# these are the users that will be created in case you choose your own mongodb server
- mongodb_root_user:
  # the root user, which will be created to enable the creation of the other users
    - username
    - password
  # the user and database which will have access to the database that will be used by meteor
- mongodb_meteor_user
  - username
  - password
  - database
- mongodb_oplog_user
  - username
  - password
# if you want to enable ssl eithe on the loadbalancer or on the appserver level,
# you need to paste your certificates here
# use pipe ( | ) for multiline strings (http://stackoverflow.com/a/21699210/404799)
- ssl_certificate
- ssl_key

Appservers:
see roles/meteorapp/README.md

Tips:
This article is very good: http://hakunin.com/six-ansible-practices

Todo:
- client_max_body_size