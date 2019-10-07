provider "aws" {
    region = "${lookup(var.vpc, "region")}"
    profile = "pankaj"
}