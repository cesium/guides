#!/bin/bash -i

# The -i is there because the script needs to run in an interactive shell so that the
# source ~/.bashrc command is effective. Otherwise we cannot add plugins in ASDF

append_if_exists () {
    if [ -f "$2" ]; then
        printf "$1" >> "$2"
    fi
}

install_deps_arch () {
    sudo pacman -Syyy curl git
}

install_deps_ubuntu () {
    sudo apt-get install -y curl git
}

install_deps_ubuntu () {
    sudo apt-get install -y curl git
}

install_deps_fedora() {
    sudo dnf -y install curl git
}

docker_no_sudo() {
    # In order to run docker command without sudo
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
}

# https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies
install_asdf () {
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.2

    # Add ASDF to your shells
    append_if_exists ". \"$HOME/.asdf/asdf.sh\"\n" ~/.bashrc
    append_if_exists ". \"$HOME/.asdf/completions/asdf.bash\"\n" ~/.bashrc
    append_if_exists ". \"$HOME/.asdf/asdf.sh\"\n" ~/.zshrc

    # Apply the changes so that ASDF in in $PATH
    source ~/.bashrc

    asdf plugin add elixir
    asdf plugin add erlang
    asdf plugin add nodejs
}

# https://docs.docker.com/engine/install/ubuntu/
install_docker_ubuntu() {
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt-get update

    sudo apt-get install -y ca-certificates curl gnupg lsb-release
    sudo mkdir -m 0755 -p /etc/apt/keyrings

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


    docker_no_sudo
}

install_docker_arch() {
    sudo pacman -Syyy docker docker-compose

    sudo systemctl start docker.service
    sudo systemctl enable docker.service

    docker_no_sudo
}

# https://docs.docker.com/engine/install/fedora/
install_docker_fedora() {

    sudo dnf -y install dnf-plugins-core

    sudo dnf -y config-manager \
        --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo

    sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    sudo systemctl start docker

    docker_no_sudo
}

install_ubuntu() {
    install_deps_ubuntu
    install_asdf
    install_docker_ubuntu
}

install_arch() {
    install_deps_arch
    install_asdf
    install_docker_arch
}

install_fedora() {
    install_deps_fedora
    install_asdf
    install_docker_fedora
}


if command -v apt-get > /dev/null; then
    install_ubuntu
elif command -v pacman > /dev/null; then
    install_arch
elif command -v dnf > /dev/null; then
    install_fedora
else
    echo "Could not detect package manaager"
fi