# ansible.ee
Ansible Execution Environment testing for AWX integration.   
Here I payed around to get FreeIPA inventory integrated into AWX.   
Since script inventory get removed, it may be the way to get it integrated properly.

## getting started
* RTFM
* look into the files in this repo
```
# setup docker
pip3 install ansible-builder
ansible-builder build --tag ee-idm:0.1

## Links
* https://docs.ansible.com/automation-controller/latest/html/userguide/execution_environments.html
* https://weiyentan.github.io/2021/creating-execution-environments/

