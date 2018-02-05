# Swarm

## Introduction

This is the hello world ish playbook for docker swarm

## Contents

- [Setup VMs](#setup-vms)

## Setup VMs

Follow steps at [Local Hashicorp Stack](https://github.com/rms1000watt/local-hashicorp-stack) to create a packer image. Then deploy VMs via steps below:

```bash
cd terraform
go get github.com/pyToshka/terraform-provider-virtualbox

terraform init
terraform apply
cd ..
```