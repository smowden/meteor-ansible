Role Name
========

Will install haproxy and configure it.
Forked from https://github.com/Pheromone/ansible-haproxy/ but stripped away everything
but basic install

vars:
haproxy_enable_ssl: no
haproxy_force_ssl: no
haproxy_enable_stats: no
haproxy_stats_username: someuser
haproxy_stats_password: somepassword
haproxy_stats_port: 21212
haproxy_config_use_appservers_eth: eth0
haproxy_ws_healthcheck_domain