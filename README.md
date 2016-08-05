An Ansible Playbook for deploying Meteorapps

* Requirement: Ansible > 2.0.0

This Ansible playbook will allow you to deploy Meteor apps of all sizes to your own servers/VMs.
It handles setups of varying complexity. From a single small VM that serves your app to a load balanced
setup with multiple servers.

# Features:
- Deploying multiple apps to a single server
- Setup and configure a MongoDB server with authentification and oplog enabled
- Scale vertically by spawning multiple processes of your app.
  Passenger will handle loadbalancing requests across those processes
- Scale horizontally across multiple servers with HaProxy
- Configure SSL support either for a single node or HaProxy

## Inventory:
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

## Tests:
To run tests run run_tests.sh <test name>
Three Tests are included and also serve as examples:
- single_node: Launch a MongoDB server and a appserver with an instance of Telescope
- two_node_multisite:
  Launch a dedicated MongoDB server, and configure passenger on one to serve both Spacetalk (with SSL) and Telescope from the same server
  Note: you can use the same pattern to seperate your staging and production environment
- load_balanced_spacetalk: Launch and configure: A MongoDB server, two appservers (with two instances per server) and a loadbalancer for Spacetalk


### Possible group variables (incomplete, todo extend, for now check tests directory):
all.yml
these are the users that will be created in case you choose your own mongodb server
- mongodb_root_user:
    - the root user, which will be created to enable the creation of the other users
    - username
    - password
- mongodb_meteor_user
  - the user and database which will have access to the database that will be used by meteor
  - username
  - password
  - database
- mongodb_oplog_user
  - username
  - password
- app_bundle_dir: path to where app will be bundled
- app_git_checkout: branch, tag or commit to build
- app_git_repo: ssh path to repo
- app_mobile_server: meteor mobile server param
- app_root_dir: path where git repo will be cloned to
- git_deploy_private_key: git key to use to checkout repo
- meteor_env:
    - HTTP_FORWARDED_COUNT: 1
    - MAIL_URL: ""
    - MONGO_OPLOG_URL: ""
    - MONGO_URL: ""
    - ROOT_URL: ""
    - AUTOUPDATE_VERSION: optional
    - OTHER_ENV_VAR: ""
- meteor_settings_file: path to settings relative to app_root_dir
- nginx_config_file_name: name of the created nginx config file
- nginx_enable_ssl: true
- nginx_server_name: "example.com"
- nginx_force_ssl: false
- nginx_ssl_cert_file_name
- nginx_ssl_key_file_name
- passenger_friendly_error_pages: "off"
- passenger_group: www
- passenger_user: www
- passenger_min_instances: number of app instances on one machine
- passenger_port: 80
- passenger_pre_start: "yes"
- ssl_certificate: if you want to enable ssl eithe on the loadbalancer or on the appserver level, you need to paste your certificates here, use pipe ( | ) for multiline strings (http://stackoverflow.com/a/21699210/404799)
- ssl_key
- app_git_relative_dir: path to app if it resides in a subdirectory of a git repo

Loadbalancer:
- haproxy_config_use_appservers_eth: eth0
- haproxy_enable_ssl: true
- haproxy_enable_stats: true
- haproxy_force_ssl: false
- haproxy_stats_password
- haproxy_stats_port
- haproxy_stats_username
- haproxy_ws_healthcheck_domain: example.com

Appservers:
see roles/meteorapp/README.md

All variables can be combined into all.yml for simpler deployment

Tips:
This article is very good: http://hakunin.com/six-ansible-practices

Todo:
- client_max_body_size

Notes:
ssh agent forwarding is slow when cloning a repo, disable and use git key for faster deploy
