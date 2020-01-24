
# Simple Terraform config file to create an instance in AWS provider

## Steps:
    *  Write the config file with extension .tf 
    *  Validate the config and make sure there are no error
          Run: terraform validate
    *  Create an execution plan and save that in the name of awsplan
          Run: terraform plan --out awsplan
    *  If likes to see all the resources and their config details
          Run: terraform show awsplan
    *  To apply the plan to create the infrastructure in AWS. Note: --auto-approve will skip the interactive(y/n?) question.
          Run: terraform apply --auto-approve plan 
    *  To destroy the infrastructure
          Run: terraform destroy

## Additional configuration details

```

One can also define separate configuration files to create AWS infrastructure.

Instances.tf - Instance specific details
Provider.tf  - AWS provider access details (Keys, region)
Variables.tf - Variables to be passed later
terraform.tfvars - To specify persistent variables

One can also use environment variable(s) which starts with TF_VAR_name
  For example, TF_VAR_instance_count corresponds to the variable instance_count

```

## Graphical View of the plan
![Infrastructure View](https://github.com/venkyp1/Hashicorp/blob/master/graph.svg)

## Execution details:

#### Version 
venky-MacPro> terraform version
```
Terraform v0.12.18
+ provider.aws v2.43.0
venky-MacPro>
```

#### Check the configuration
venky-MacPro> terraform validate
```
Success! The configuration is valid.
```

venky-MacPro>

#### Create a plan

#### venky-MacPro> terraform plan --out awsplan
```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

<SNIP>
------------------------------------------------------------------------

This plan was saved to: awsplan

To perform exactly these actions, run the following command to apply:
    terraform apply "awsplan"

venky-MacPro>
```

#### Verify all config detail

#### venky-MacPro> terraform show awsplan
```
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_egress_only_internet_gateway.egress_gw will be created
  + resource "aws_egress_only_internet_gateway" "egress_gw" {
      + id     = (known after apply)
      + vpc_id = (known after apply)
    }

  # aws_instance.test will be created
  + resource "aws_instance" "test" {
      + ami                          = "ami-0dd655843c87b6930"
      + arn                          = (known after apply)
      + associate_public_ip_address  = true
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = "venky-keypair"
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_internet_gateway.mygw will be created
  + resource "aws_internet_gateway" "mygw" {
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "venky_igw"
        }
      + vpc_id   = (known after apply)
    }

  # aws_network_acl.acl will be created
  + resource "aws_network_acl" "acl" {
      + egress     = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 80
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "tcp"
              + rule_no         = 200
              + to_port         = 80
            },
        ]
      + id         = (known after apply)
      + ingress    = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 22
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "tcp"
              + rule_no         = 100
              + to_port         = 22
            },
        ]
      + owner_id   = (known after apply)
      + subnet_ids = (known after apply)
      + vpc_id     = (known after apply)
    }

  # aws_route.rt will be created
  + resource "aws_route" "rt" {
      + destination_prefix_list_id = (known after apply)
      + egress_only_gateway_id     = (known after apply)
      + gateway_id                 = (known after apply)
      + id                         = (known after apply)
      + instance_id                = (known after apply)
      + instance_owner_id          = (known after apply)
      + nat_gateway_id             = (known after apply)
      + network_interface_id       = (known after apply)
      + origin                     = (known after apply)
      + route_table_id             = (known after apply)
      + state                      = (known after apply)
    }

  # aws_route_table.rtbl will be created
  + resource "aws_route_table" "rtbl" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + tags             = {
          + "Name" = "rtbl"
        }
      + vpc_id           = (known after apply)
    }

  # aws_security_group.sg will be created
  + resource "aws_security_group" "sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "sg"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "sg"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.venky_subnet1 will be created
  + resource "aws_subnet" "venky_subnet1" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = (known after apply)
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.0.0/25"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name" = "venky_subnet1"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.venky_vpc will be created
  + resource "aws_vpc" "venky_vpc" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.0.0.0/24"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = (known after apply)
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Name" = "venky_vpc"
        }
    }

Plan: 9 to add, 0 to change, 0 to destroy.
venky-MacPro>

#### Create the infrastructure

venky-MacPro> terraform apply awsplan
```


#### Destroy the infrastructure

venky-MacPro> terraform destroy
```
aws_vpc.venky_vpc: Refreshing state... [id=vpc-0871b761782add56f]
aws_egress_only_internet_gateway.egress_gw: Refreshing state... [id=eigw-09c408950a581d6e6]
aws_internet_gateway.mygw: Refreshing state... [id=igw-0bf00f49f141b32d2]
aws_subnet.venky_subnet1: Refreshing state... [id=subnet-0b1d613a6acd01f4b]
aws_security_group.sg: Refreshing state... [id=sg-08cdfd3802fa72e56]
aws_network_acl.acl: Refreshing state... [id=acl-0712a373193c19073]
aws_route_table.rtbl: Refreshing state... [id=rtb-0010822a701b42522]
aws_instance.test: Refreshing state... [id=i-078ebdb120c935a24]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

<SNIP>
   
   
Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_egress_only_internet_gateway.egress_gw: Destroying... [id=eigw-09c408950a581d6e6]
aws_route_table.rtbl: Destroying... [id=rtb-0010822a701b42522]
aws_network_acl.acl: Destroying... [id=acl-0712a373193c19073]
aws_instance.test: Destroying... [id=i-078ebdb120c935a24]
aws_egress_only_internet_gateway.egress_gw: Destruction complete after 0s
aws_network_acl.acl: Destruction complete after 0s
aws_route_table.rtbl: Destruction complete after 0s
aws_internet_gateway.mygw: Destroying... [id=igw-0bf00f49f141b32d2]
aws_instance.test: Still destroying... [id=i-078ebdb120c935a24, 10s elapsed]
aws_internet_gateway.mygw: Still destroying... [id=igw-0bf00f49f141b32d2, 10s elapsed]
aws_instance.test: Still destroying... [id=i-078ebdb120c935a24, 20s elapsed]
aws_internet_gateway.mygw: Still destroying... [id=igw-0bf00f49f141b32d2, 20s elapsed]
aws_instance.test: Still destroying... [id=i-078ebdb120c935a24, 30s elapsed]
aws_internet_gateway.mygw: Still destroying... [id=igw-0bf00f49f141b32d2, 30s elapsed]
aws_instance.test: Still destroying... [id=i-078ebdb120c935a24, 40s elapsed]
aws_internet_gateway.mygw: Still destroying... [id=igw-0bf00f49f141b32d2, 40s elapsed]
aws_internet_gateway.mygw: Destruction complete after 47s
aws_instance.test: Still destroying... [id=i-078ebdb120c935a24, 50s elapsed]
aws_instance.test: Destruction complete after 50s
aws_subnet.venky_subnet1: Destroying... [id=subnet-0b1d613a6acd01f4b]
aws_security_group.sg: Destroying... [id=sg-08cdfd3802fa72e56]
aws_subnet.venky_subnet1: Destruction complete after 1s
aws_security_group.sg: Destruction complete after 1s
aws_vpc.venky_vpc: Destroying... [id=vpc-0871b761782add56f]
aws_vpc.venky_vpc: Destruction complete after 0s

Destroy complete! Resources: 8 destroyed.
venky-MacPro>
```
