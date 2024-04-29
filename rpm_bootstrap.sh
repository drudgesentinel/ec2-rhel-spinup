#rpm based distro requirements: https://www.gremlin.com/docs/getting-started-install-virtual-machine#/rpm-packages

# Install dependencies
sudo yum install -y iproute-tc

# Add the Gremlin repo
sudo curl https://rpm.gremlin.com/gremlin.repo -o /etc/yum.repos.d/gremlin.repo

# Install Gremlin
sudo yum install -y gremlin gremlind