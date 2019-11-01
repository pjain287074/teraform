variable "aws_region" {
	default =  "ap-southeast-1"
}

variable "vpc_cidr" {
	default = "10.20.0.0/16"
}

variable "env" {
  type = "string"
  default = "dev"
}

variable "Public_subnets_cidr" {
	type = "list"
	default = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
}
variable "Private_subnets_cidr" {
	type = "list"
	default = ["10.20.4.0/24", "10.20.5.0/24", "10.20.6.0/24"]
}

variable "avalabilityZones" {
	type = "list"
	default = ["ap-southeast-1c", "ap-southeast-1b", "ap-southeast-1a"]
}
 
variable "Public_tags" {
	type = "map"
      default= {
            Name = "Public resaource managed by terraform"
      }
}
variable "Private_tags" {
	type = "map"
      default= {
            Name = " private resaource managed by terraform"
      }
}

