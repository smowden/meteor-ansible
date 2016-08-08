# ansible-logdna

[Logdna](https://logdna.com/) - The easiest cloud log management system you will ever use.

[![Build Status](https://travis-ci.org/telusdigital/ansible-logdna.svg?branch=master)](https://travis-ci.org/telusdigital/ansible-logdna)
[![Platforms](https://img.shields.io/badge/platform-ubuntu,redhat-lightgrey.svg?style=flat)](#)

Tunables
--------
* `logdna_logging_directory` (string) - The directory logdna should monitor for logs.
* `logdna_secret_key` (string) - The key associated with your logdna account.

Dependencies
------------
None

Example Playbook
----------------
    - hosts: servers
      roles:
         - role: telusdigital.logdna
           logdna_logging_directory: /data/log

License
-------
[MIT](https://tldrlegal.com/license/mit-license)

Contributors
------------
* [Ben Visser](https://github.com/noqcks)

