resource "aws_vpc" "terraformvpc" {
    cidr_block                                = var.cidr
    instance_tenancy                          = "${lookup(var.vpc, "tenancy")}"
    assign_generated_ipv6_cidr_block          = "${lookup(var.vpc, "generated_ipv6_cidr_block")}"
    enable_classiclink                        = "${lookup(var.vpc, "classiclink")}"
    enable_classiclink_dns_support            = "${lookup(var.vpc, "classiclink_dns_support")}"
    enable_dns_hostnames                      = "${lookup(var.vpc, "dns_hostnames")}"
    enable_dns_support                        = "${lookup(var.vpc, "dns_support")}"
  tags = var.default_tags
}

resource "aws_default_security_group" "default" {
    vpc_id                              = "${aws_vpc.terraformvpc.id}"
    tags                                = "${var.default_tags}"
}

resource "aws_default_route_table" "default" {
    default_route_table_id              = "${aws_vpc.terraformvpc.default_route_table_id}"
    tags                                = "${var.default_tags}"
}

resource "aws_default_network_acl" "default" {
    default_network_acl_id              = "${aws_vpc.terraformvpc.default_network_acl_id}"
    tags                                = "${var.default_tags}"
}