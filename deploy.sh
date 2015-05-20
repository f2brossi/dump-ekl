#!/bin/sh
sed -i "s/fqdnOrPublicIp:*/fqdnOrPublicIp: ${OS_FLOATING_IP}/" dump-ekl/roles/ekl/defaults/main.yml
#vagrant up --provider=openstack
sed -i '$ d' dump-ekl/roles/ekl/defaults/main.yml
echo "fqdnOrPublicIp: " >> dump-ekl/roles/ekl/defaults/main.yml
