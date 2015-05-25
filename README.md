# dump-ekl
Provision ekl and restore your dashboard using Ansible, Elasticdump, Nginx and Vagrant OpenStack cloud provider. 

#### Ansible Playbook to automate the setup of an ELK stack 
Centralized logging server with Logstash + logstash-forwarder, Elasticsearch, Kibana 4 behind Nginx with https and simple authentication.

This playbook is intended to be run against a vm that will be used as a central logger.
After the setup of the server, clients need to be configured to redirect all logs to the central location.

**Platform**: Tested on **Ubuntu **

**Prerequisites**: The Vagrantfile assume you have credentials for an Openstack cloud provider. But it can be easily adapt using VirtualBox.


### Preparation

1. Install Ansible and [Vagrant Cloud Provider](https://github.com/ggiamarchi/vagrant-openstack-provider). 

2. Set your .bashrc with the needed Openstack variables OS_USERNAME, OS_PASSWORD, OS_TENANT, OS_FLOATING_IP etc.. used within the Vagrantfile.

### Quick Start

$`./deploy.sh  (set the ip address of the vm and then execute vagrant up )

Take a coffee and after three minutes get your centralized logging server up and running!

Browse **https://@IPOrFqdn** and enter your login/mdp (see nginx-install.yml )!

Hereunder is what the Playbook will do:

1. Setup java8

2. Setup and configure Elasticsearch

3. Setup and configure Nginx with SSL  and simple authentication

4. Setup and configure kibana 4

5. Setup and configure Logstash

6. Setup and configure Elasticdump ( import/ export your visualizations and dashboards - see below )

7. Setup and configure logstash-forwarder for real time logging. Client and server on same vm.

### Why Elasticdump ?

Because Kibana 4, for now, does not allow you to save and load JSON visualizations and dashboard via its interface.

Export your visualizations/dashboards with the following command:

```console
elasticdump \  
    --input=http://localhost:9200/.kibana  \
    --output=$ \
    --type=data \
    --searchBody='{"filter": { "or": [ {"type": {"value": "dashboard"}}, {"type" : {"value":"visualization"}}] }}' \
    > kibana-exported.json
```
    
[Elasticdump import/export] (http://air.ghost.io/kibana-4-export-and-import-visualizations-and-dashboards/)
