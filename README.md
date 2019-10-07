# teraform



Edit var.tf file for custom values and naming.
Pass CIDR values from command line if you dont want to update CIDR everty time.


Run as below, to pass CIDR value in command line.

terraform init
terraform plan -var="cidr=10.0.0.0/16"
terraform apply -var="cidr=10.0.0.0/16"

