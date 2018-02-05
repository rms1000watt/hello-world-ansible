resource "virtualbox_vm" "server" {
    count = 3
    name = "${format("server-%02d", count.index+1)}"
    image = "~/go/src/github.com/rms1000watt/local-hashicorp-stack/packer/output-virtualbox-iso/ubuntu-16.04-docker.box"
    cpus = 2
    memory = "2048 mb"
    network_adapter {
        type = "bridged"
        host_interface = "en0"
    }
}


resource "null_resource" "server-provisioner" {
    # Run server-provisioner if the mac address changes (if machine is deleted not just turned off)
    triggers {
        mac_addresses = "${join(",", virtualbox_vm.server.*.network_adapter.0.mac_address)}"
    }

    count = "${virtualbox_vm.server.count}"
    connection {
        type     = "ssh"
        host     = "${element(virtualbox_vm.server.*.network_adapter.0.ipv4_address, count.index)}"
        user     = "packer"
        password = "packer"
        timeout  = "1m"
    }

    provisioner "file" {
        source      = "provision.sh"
        destination = "/home/packer/provision.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod a+x /home/packer/provision.sh",
            "sudo /home/packer/provision.sh",
        ]
    }
}

output "Servers" {
    value = ["${virtualbox_vm.server.*.network_adapter.0.ipv4_address}"]
}
