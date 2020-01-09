# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "us-west-1"
  shared_credentials_file = "/Users/venky/.aws/credentials"
}

# Create a VPC
resource "aws_vpc" "venky_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "venky_vpc"
  }
}

resource "aws_subnet" "venky_subnet1" {
  vpc_id = "${aws_vpc.venky_vpc.id}"
  cidr_block = "10.0.0.0/25"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "venky_subnet1"
  }
}

# Security Group acts as a firewall for instances

resource "aws_security_group"  "sg" {
  vpc_id = "${aws_vpc.venky_vpc.id}"
  name = "sg"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

 egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
   }
 tags = {
    Name = "sg"
  }
}

# ACL acts as a firewall for subnets

resource "aws_network_acl" "acl" {
  vpc_id = "${aws_vpc.venky_vpc.id}"

# Outgoing connections
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

# Incoming connections
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
}

resource "aws_internet_gateway" "mygw" {
  vpc_id = "${aws_vpc.venky_vpc.id}"

  tags = {
    Name = "venky_igw"
  }
}


resource "aws_egress_only_internet_gateway" "egress_gw" {
  vpc_id = "${aws_vpc.venky_vpc.id}"
}

resource "aws_route_table" "rtbl" {
  vpc_id = "${aws_vpc.venky_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.mygw.id}"
  }

  tags = {
    Name = "rtbl"
  }
}


resource "aws_route" "rt" {
  destination_cidr_block    = "10.0.0.0/24"
  route_table_id = "${aws_route_table.rtbl.id}"
  gateway_id = "${aws_internet_gateway.mygw.id}"
}

resource "aws_instance" "test" {
  ami = "ami-0dd655843c87b6930"
  associate_public_ip_address = true
  instance_type = "t2.micro"
  key_name = "venky-keypair"
  subnet_id = "${aws_subnet.venky_subnet1.id}"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
}


