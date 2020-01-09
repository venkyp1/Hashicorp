
# Simple Terraform config file to create an instance in AWS provider

## Steps:
    *  Write the config file
    *  Validate the config and make sure there are no error
       * terraform validate
    *  Create an execution plan and save that in the name of awsplan
       * terraform plan --out awsplan
    *  If likes to see all the resources and their config details
       * terraform show
    *  To apply the plan to create the infrastructure in AWS. Note: --auto-approve will skip the interactive(y/n?) question.
       * terraform apply --auto-approve plan 
    *  To destroy the infrastructure, run
       * terraform destroy
    

