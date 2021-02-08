#!/bin/bash

output() {
    echo "- $1"
}

cmd() {
    output "run [$1]"
    $1
}

sudo_cmd() {
    output "sudo run [$1]"
    sudo $1
}

cmd "brew update"
cmd "brew upgrade"
sudo_cmd "dnf upgrade -y"
sudo_cmd "systemctl poweroff"
