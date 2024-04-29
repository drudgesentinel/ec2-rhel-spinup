#rpm based distro requirements: https://www.gremlin.com/docs/getting-started-install-virtual-machine#/rpm-packages

# Install dependencies
sudo yum install -y iproute-tc

# Add the Gremlin repo
sudo curl https://rpm.gremlin.com/gremlin.repo -o /etc/yum.repos.d/gremlin.repo

# Install Gremlin
sudo yum install -y gremlin gremlind

if [${rhel_version} -eq 8]; then
    yum remove gremlin -y
    yum install iproute-tc -y 
    yum install kernel-modules-extra -y 
    yum install kernel-modules-extra-$(uname -r) -y
    yum install gremlin gremlind -y
    modprobe sch_netem
fi

    # RHEL 8 prep per: https://support-site.gremlin.com/support/solutions/articles/151000045247-unhealthy-red-hat-8