
# VPC
resource "aws_vpc" "terra_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "TerraVPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "terra_igw" {
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "${var.Public_tags.Name}"
  }
}

# Subnets : public
resource "aws_subnet" "public" {
  count             = length(var.Public_subnets_cidr)
  vpc_id            = aws_vpc.terra_vpc.id
  cidr_block        = element(var.Public_subnets_cidr, count.index)
  availability_zone = element(var.avalabilityZones, count.index)
  tags = {
    Name = "${var.Public_tags.Name}"
    s_count = "Subnet-${count.index + 1}"

  }
}

# Subnets : private
resource "aws_subnet" "private" {
  count             = length(var.Private_subnets_cidr)
  vpc_id            = aws_vpc.terra_vpc.id
  cidr_block        = element(var.Private_subnets_cidr, count.index)
  availability_zone = element(var.avalabilityZones, count.index)
  tags = {
    Name = "${var.Private_tags.Name}"
    s_count = "Subnet-${count.index + 1}"

  }
}

# Route table: attach Internet Gateway 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_igw.id
  }
  tags = {
    Name = "${var.Public_tags.Name}"
    type = "publicRouteTable"
  }
}

# Route table: attach Internet Gateway 
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "${var.Private_tags.Name}"
    type = "privateRouteTable"
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "public" {
  count          = length(var.Public_subnets_cidr)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id

}

# Route table association with private subnets
resource "aws_route_table_association" "private" {
  count          = length(var.Private_subnets_cidr)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id

}
