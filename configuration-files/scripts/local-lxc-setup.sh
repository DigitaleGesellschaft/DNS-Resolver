#!/bin/bash

readonly container1Name="localdns1"
readonly container2Name="localdns2"
readonly container1IpV4="10.52.7.116"
readonly container2IpV4="10.52.7.117"
readonly container1IpV6="fd42:56b6:246b:67bc::116"
readonly container2IpV6="fd42:56b6:246b:67bc::117"

readonly containerOs="ubuntu:22.04"

# arg $1 containerName
# arg $2 containerIPv4
# arg $3 containerIPv6
# arg $4 username
# arg $5 password
init_container() {
    echo "Create container '$1' of OS '$containerOs'"
    sudo lxc init $containerOs "$1" > /dev/null

    echo "Setup network: $2 / $3"
    sudo lxc network attach lxdbr0 "$1" eth0 eth0 > /dev/null
    sudo lxc config device set "$1" eth0 ipv4.address "$2" > /dev/null
    sudo lxc config device set "$1" eth0 ipv6.address "$3" > /dev/null

    start_container "$1"

    sudo lxc exec "$1" -- adduser --gecos "" --disabled-password "$4" > /dev/null
    sudo lxc exec "$1" -- chpasswd <<<"$4:$5" > /dev/null
    sudo lxc exec "$1" -- usermod -aG sudo "$4" > /dev/null

    echo "Setup SSH access"
    sudo lxc exec "$1" -- apt install ssh -y &> /dev/null

    echo "Temporarily allow SSH password authentication"
    sudo lxc exec "$1" -- sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config > /dev/null
    sudo lxc exec "$1" -- systemctl restart ssh > /dev/null

    echo "Copy public SSH key (~/.ssh/id_rsa) to container '$1'"
    ssh-copy-id -p 22 -i ~/.ssh/id_rsa "$4@$1" > /dev/null

    echo "Disable SSH password authentication"
    sudo lxc exec "$1" -- sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config > /dev/null
    sudo lxc exec "$1" -- sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config > /dev/null
    sudo lxc exec "$1" -- systemctl restart ssh > /dev/null
}

start_container() {
    echo "Start lxc resolver container: $1"
    sudo lxc start "$1" > /dev/null
}

stop_container() {
    echo "Stop lxc resolver container: $1"
    sudo lxc stop "$1" > /dev/null
}

# arg $1 containerName
# arg $2 containerIPv4
destroy_container() {
    echo "Remove SSH known hosts '$2' entry"
    ssh-keygen -f ~/.ssh/known_hosts -R "$2" > /dev/null

    echo "Delete container $1"
    sudo lxc delete "$1" > /dev/null
}

cmd_help() {
    echo "$0 [COMMAND]"
    echo ""
    echo "COMMAND"
    echo "  init     Initialise two new local resolver lxc container"
    echo "  up       Start lxc containers"
    echo "  down     Stop lxc containers"
    echo "  destroy  Delete two resolver lxc containers"
    echo ""
}

cmd_init() {
    echo "Setup SSH system user"
    echo -n "Enter username: "
    read -r username
    echo -n "Enter password: "
    read -s -r password
    echo ""
    init_container $container1Name $container1IpV4 $container1IpV6 "$username" "$password"
    init_container $container2Name $container2IpV4 $container2IpV6 "$username" "$password"
}

cmd_up() {
    start_container $container1Name
    start_container $container2Name
}

cmd_down() {
    stop_container $container1Name
    stop_container $container2Name
}

cmd_destroy() {
    destroy_container $container1Name $container1IpV4 
    destroy_container $container2Name $container2IpV4 
}

if [ $# -eq 0 ]; then
    cmd_help
    exit 1
fi


case "$1" in
  "-h" | "--help")
    cmd_help
    exit 0
    ;;
  "init")
    echo "Initialise two new lxc resolver containers"
    echo ""
    cmd_init
    exit 0
    ;;
  "up")
    cmd_up
    exit 0
    ;;
  "down")
    cmd_down
    exit 0
    ;;
  "destroy")
    echo "Destroy two new lxc resolver containers"
    echo ""
    cmd_down
    cmd_destroy
    exit 0
    ;;
  *)
    echo "Unknown command '$1'"
    echo ""
    cmd_help
    exit 1
    ;;
esac
