
# Simple Terraform config file to create an instance in AWS provider

## Steps:
    *  Write the config file with extension .tf 
    *  Validate the config and make sure there are no error
          Run: terraform validate
    *  Create an execution plan and save that in the name of awsplan
          Run: terraform plan --out awsplan
    *  If likes to see all the resources and their config details
          Run: terraform show
    *  To apply the plan to create the infrastructure in AWS. Note: --auto-approve will skip the interactive(y/n?) question.
          Run: terraform apply --auto-approve plan 
    *  To destroy the infrastructure
          Run: terraform destroy
    

## Graphical View of the plan
![Infrastructure View](https://github.com/venkyp1/Hashicorp/blob/master/graph.svg)
