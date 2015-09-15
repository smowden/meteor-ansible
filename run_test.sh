#!/bin/bash

rm ./group_vars || true
rm Vagrantfile || true
rm test_inventory || true
ln -s tests/$@/group_vars ./group_vars
ln -s tests/$@/inventory test_inventory
ln -s tests/$@/Vagrantfile Vagrantfile
ssh-add -k # fix agent forwarding for osx
vagrant up
if [ "$@" = "two_node_multisite" ]; then
    ansible-playbook -i test_inventory/spacetalk -u root site.yml -vvvv
    ansible-playbook -i test_inventory/telescope -u root site.yml -vvvv
else
    ansible-playbook -i test_inventory/hosts -u root site.yml -vvvv
fi
