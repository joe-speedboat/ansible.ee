# ansible.ee
Ansible Execution Environment testing for AWX integration.   
Here I played around to get my custom needs integrated into AWX.   

## getting started
* RTFM
* look into the files in this repo
```
# setup docker
pip3 install ansible-builder
ansible-builder build --tag ee-idm:0.1

## Use Case
I used this ee, to test freeIPA inventory integraion, which is not native and needs a python script.
With this inventory, I got it running: https://github.com/joe-speedboat/ansible.idm-inventory


## Links
* https://docs.ansible.com/automation-controller/latest/html/userguide/execution_environments.html
* https://weiyentan.github.io/2021/creating-execution-environments/

