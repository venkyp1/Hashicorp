## USING TERRAFORM VARIABLES

### Variables for credentials
```
 When comes to resource access, often some form of credentials are needed. So when running terraform as part 
of CI/CD, the security credentials should be available as part of automatic pipeline process. Hardcoding these 
secrets can get them exposed as part of log files and so is a security violation.

 Terraform allows these data be stored in a separate files and the values can be read at run time. This 
avoids the credentials getting exposed in the log files. Here is a sample file which defines the credentials needed 
for AWS access and how they can be read during run time.

  It also shows how more sensitive or dynamic data can be retrieved just before terraform apply'. For example, 
an admin who is trying to make the update should be asked to provide his/her employee ID and logged.
```

### variables.tf
```
# AWS Access Credentials
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "us-east-2"
  }

variable "accountId" {
   default = "WhoCares"
}

provider "aws" {
   access_key = "var.access_key"
   secret_key = "var.secret_key"
   region = "var.region"
  }


# User to provide data
variable "server_hostname" {
  description = "Enter Server Hostname: "
  type        = string
}

variable "admin_empid" {
  description = "Enter Employee ID: "
  type        = string
}

# OUTPUT THE DATA

output "aws_access_key" {
  value       = var.aws_access_key
  description = "TYour AWS Access Key"
}

output "aws_secret_key" {
  value       = var.aws_secret_key
  description = "Your AWS Secret Key"
}
output "server_hostname" {
  value       = var.server_hostname
  description = "Server Hostname"
}

output "admin_empid" {
  value       = var.admin_empid
  description = "Employee ID"
}

```

### terraform.tfvars

```
aws_access_key = "AWSAccessKey"
aws_secret_key = "AWSSecretKey"
accountId = "AWSAccountID"
aws_region = "us-west-2"
```

### Running terraform

```
Venky> terraform init
Initializing the backend...

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 2.46"

Terraform has been successfully initialized!

Venky> terraform apply
var.admin_empid
  Enter Employee ID:

  Enter a value: 1997

var.server_hostname
  Enter Server Hostname:

  Enter a value: localhost


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

admin_empid = 1997
aws_access_key = AWSAccessKey
aws_region = us-west-2
aws_secret_key = AWSSecretKey
server_hostname = localhost
```


