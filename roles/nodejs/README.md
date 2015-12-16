Nodejs
========

This role is based on the setup from
https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager

Requirements
------------

Ubuntu or Debian.
Gathering facts cannot be turned off.

Role Variables
--------------

No role variables are being used.
The distro information is retrieved from gathering facts.


Example Playbook
-------------------------

    - hosts: servers
      roles:
         - bulv1ne.nodejs

License
-------

MIT
