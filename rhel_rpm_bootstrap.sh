#!/usr/bin/env bash
#rpm based distro requirements: https://www.gremlin.com/docs/getting-started-install-virtual-machine#/rpm-packages

#Send all output of userdata script to /var/log/user-data.log and the console
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

yum upgrade -y

# Install dependencies
yum install -y iproute-tc vim yum-utils

# Add the Gremlin repo
curl https://rpm.gremlin.com/gremlin.repo -o /etc/yum.repos.d/gremlin.repo

# Check for RHEL 8 or RHEL 9 and act accordingly
if [ "${rhel_version}" -eq "8" ] || [ "${rhel_version}" -eq "9" ]; then
    echo "RHEL 8/9 detected. Installing additional requirements"
    yum install iproute-tc kernel-modules-extra -y 
    yum install kernel-modules-extra-$(uname -r) -y
    modprobe sch_netem
fi

sleep 20

# Install Gremlin
yum install -y gremlin gremlind
modprobe sch_netem


    # RHEL 8 prep per: https://support-site.gremlin.com/support/solutions/articles/151000045247-unhealthy-red-hat-8
