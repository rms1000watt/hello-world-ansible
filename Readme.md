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

```bash
ansible-playbook -i inventory.yml hello-world/playbook.yml
```