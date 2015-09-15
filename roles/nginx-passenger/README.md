InnoHub Ansible : nginx-passenger
=================================

Installs *binary* passenger and nginx from Phusion repository.

Source: [Phusion
Passenger Debian/Ubuntu Installation](https://www.phusionpassenger.com/documentation/Users%20guide%20Nginx.html#install_on_debian_ubuntu)

Requirements
------------

Tested with Ubuntu 14.04 Trusty.

Role Variables
--------------
passenger_max_pool_size: Set the max number of instances

Dependencies
------------

None

Example Playbook
----------------

Example Playbook:

    - hosts: servers
      roles:
         - { role: innohub-ansible.nginx-passenger, x: 42 }

License
-------

MIT

Author Information
------------------

Andrew Angelo Ang @ InnoHub, Inc.
