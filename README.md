# Custm Execution Environment for Ansible AWX
You can find information about how to build a custom EE for AWX in my GitHub Repo of this image:    
[joe-speedboat/ansible.ee](https://github.com/joe-speedboat/ansible.ee)

## Integrated Python modules ```execution-environment.yml```
* python_freeipa

## Integrated Ansible Collections ```requirements.yml```
* awx.awx
* azure.azcollection
* amazon.aws
* theforeman.foreman
* google.cloud
* openstack.cloud
* community.vmware
* ovirt.ovirt
* kubernetes.core
* ansible.posix
* ansible.windows
* redhat_cop.tower_configuration
* community.general
* community.network
* ansible.posix
* fortinet.fortimanager
* fortinet.fortios 
    version: 1.1.7


## getting started
* RTFM
* look into the files in this repo
```
# setup docker
V=0.2
pip3 install ansible-builder
ansible-builder build --tag christian773/ee-idm:$V
docker push christian773/ee-idm:$V


## Use Case
I used this ee, to test freeIPA inventory integraion, which is not native and needs a python script.
With this inventory, I got it running: https://github.com/joe-speedboat/ansible.idm-inventory


## Links
* https://docs.ansible.com/automation-controller/latest/html/userguide/execution_environments.html
* https://weiyentan.github.io/2021/creating-execution-environments/

