This repo is to allow for creation of EC2 resources to reproduce issues with the Gremlin agent.
It was tested/created with `opentofu` but should also work with Terraform proper.

It creates network configuration according to these docs:

https://www.gremlin.com/docs/getting-started-install-virtual-machine
https://www.gremlin.com/docs/platform-integrations-webhooks

The following values should be provided when creating resources using this repo:

"ticket_num" 

"aws_region" 

"rhel_version" (from 7-9. Eventually will add other operating systems as I get a feel for what is practical)

"instance_type" (optional, defaults to t3a.medium)

"keypair_name" (ssh keypair for accessing the created instance)
