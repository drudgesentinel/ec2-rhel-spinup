This repo is to allow for creation of EC2 resources to reproduce issues with the Gremlin agent.
It was tested/created with `opentofu` but should also work with Terraform proper.

It creates network configuration according to these docs:

https://www.gremlin.com/docs/getting-started-install-virtual-machine
https://www.gremlin.com/docs/platform-integrations-webhooks

If you choose RHEL 8, it will install extra kernel modules required for gremlin to function, otherwise it installs the listed RPM requirements from the linked docs.

`dnf` is very slow, so completion of the bootstrap script can take a long time after the instance itself is created.
I have configured the user data to print to the system log, you can view results at `/var/log/user-data.log`

The following variables should be provided when creating resources using this repo:

"ticket_num" (to tie resources to a specific ticket)

"aws_region" 

"rhel_version" (from 7-9. Specific point releases don't work. Eventually will add other operating systems as I get a feel for what is practical)

"instance_type" (optional, defaults to t3a.medium)

"keypair_name" (ssh keypair for accessing the created instance)

Potential TODO items:

Create a way to find more specific point releases and spin them up (at present, this grabs latest major version. Amazon doesn't own older versions so it might take some work to do this)

Add distributions (probably best accomplished by packaging up network/data sources as modules, and then using main to spin up the desired specific distro.)