    #!/usr/bin/env bash
    yum remove gremlin -y
    yum install iproute-tc -y 
    yum install kernel-modules-extra -y 
    yum install kernel-modules-extra-$(uname -r) -y
    yum install gremlin gremlind -y
    modprobe sch_netem

    # RHEL 8 prep per: https://support-site.gremlin.com/support/solutions/articles/151000045247-unhealthy-red-hat-8