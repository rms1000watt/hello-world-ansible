# Hello World Ansible

## Introduction

Hello world to ansible

## Contents

- [Installation](#installation)
- [Usage](#usage)

## Installation

```bash
# ansible
brew install ansible

# sshpass
brew create https://sourceforge.net/projects/sshpass/files/sshpass/1.06/sshpass-1.06.tar.gz --force
brew install sshpass
```

## Usage

First time only to update known_hosts:

```bash
grep "ansible_host" inventory.yml | awk '{print $2}' | xargs  ssh-keyscan | grep "nistp256" >> ~/.ssh/known_hosts
```

Hello World playbook:

```bash
ansible-playbook -i inventory.yml hello-world/playbook.yml
```

Swarm playbook:

```bash
ansible-playbook -i inventory.yml swarm/playbook.yml
```
