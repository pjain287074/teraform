variable "cidr" {
  type = string
  default = "172.0.0.0/16"
}

variable "vpc" {
    type = "map" 
    default = { 
        region                    = "ap-southeast-1"
        tenancy                   = "dedicated"
        classiclink               = "false"
        classiclink_dns_support   = "false"
        dns_hostnames             = "false"
        dns_support               = "true"
        generated_ipv6_cidr_block = "false"
  }
}
variable "default_tags" { 
    type = "map" 
    default = { 
        Name = "terraformvpc"
        project = "learning"
        Owner = "pankaj"
        resourcetype = "vpc"
  }
}