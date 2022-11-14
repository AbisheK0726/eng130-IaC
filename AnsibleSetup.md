# Provisioning Vagrant

## Controller Provisioning

### Install Ansible

```bash
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update
sudo apt-get install ansible
ansible --version

sudo apt install tree
```

### Connect to Web from Controller

```bash
sudo ssh vagrant@192.168.33.10 # Web IP
password: vagrant
sudo apt update
```

### Connect to DB from Controller

```bash
sudo ssh vagrant@192.168.33.11 # DB IP
password: vagrant
sudo apt update
```

### Add Hosts to Controller

```bash
sudo nano /etc/hosts
```

Give IP and Hostname
Provide the default password for vagrant user `vagrant`

```bash
[web]
192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant

[db]
192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
```
