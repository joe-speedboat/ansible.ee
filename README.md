# Ansible Execution Environment Adventures
Due a retake of RH294, I stumbeled over ansible-navigator.   
So for Day2 ops, you will need to create your custom environment.   
Since I am a fan of open OpenSource, I tried to get a running ee with Rocky9.   
Below you can find my notes about how to find the holy grail :-)   

As when I started with ansible ... years ago, it was not ready for enterprise, navigator is a great step forward, but not the end, just a beginning   
EEs have to become handsome before a RHCE will really be able to use it, I guess its just a selling issue, that Red Hat pushes RHCEs into Ansible Navigator.   
It would be better to teach the basics, so new admins understand what and why they do.   

my 5 cents

Enjoy Chris

## Links
* https://github.com/ansible/awx-ee/tree/devel
* https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.1/html/ansible_navigator_creator_guide/index
* https://docs.ansible.com/ansible/devel/getting_started_ee/build_execution_environment.html
* https://ansible.readthedocs.io/projects/navigator/
* https://ansible.readthedocs.io/projects/builder/en/latest/
* https://ansible.readthedocs.io/projects/navigator/faq/#what-is-an-execution-environment

## Install Prerequisites
* Starting point is a Rocky 9 minimal
```
dnf update -y
dnf install -y podman git curl
dnf install -y python3 python3-pip

echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc

pip3 install --user ansible-navigator
ansible-navigator --version
```

## Preparing template to create your own custom EE
```
pip3 install --user ansible-builder
mkdir /srv/git
chmod 700 /srv/git
cd /srv/git
git clone https://github.com/joe-speedboat/ansible.ee.git
cd ansible.ee
ls -l
```

## Build the custom EE
* If you plan to upload docker image, ensure you have logged into registry, forex with: `podman login docker.io`
* once you have modifed all the more or less self-explaining files to your needs, just run
`build.sh`

## Configure and test in ansible-navigator for user
```
test -f ~/.ansible-navigator.yml
if [ $? -eq 0 ]
then
  echo NAVIGATOR CONFIG IS PRESENT, I DO NOT TOUCH
  echo COMPARE ~/.ansible-navigator.yml AND ansible-navigator.yml
else
  cat ansible-navigator.yml > ~/.ansible-navigator.yml
  echo NAVIGATOR CONFIG CREATED AT ~/.ansible-navigator.yml
fi

ansible-navigator images
```
* Now you can use the `ansible-navigator` with every user, the image is online and navigator is in userspace
* Of course its nicer to have `ansible-navigator` installed with `rpm`. 
  But enterprise is taking, opensource is making :-)

## pre define Ansible Navigator config system wide
```
sudo su -
test -d /etc/ansible || mkdir /etc/ansible
test -f /etc/ansible/ansible-navigator.yml
if [ $? -ne 0 ] ; then
  cp -av ansible-navigator.yml /etc/ansible/ansible-navigator.yml
  chown root.root /etc/ansible/ansible-navigator.yml
  chmod 644 /etc/ansible/ansible-navigator.yml
  echo "export ANSIBLE_NAVIGATOR_CONFIG=/etc/ansible/ansible-navigator.yml" >> /etc/environment
fi
source /etc/environment
```




