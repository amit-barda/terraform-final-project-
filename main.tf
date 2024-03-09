resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
   tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_cidr_blocks
  availability_zone = var.availability_zone_a
    tags = {
    Name = "private-subnet"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_cidr_blocks
  availability_zone = var.availability_zone_b
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_internet_gateway" "vpc-igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "vpc-IGW"
    }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "public-route-table"
  }
}
resource "aws_route" "public-route" {
  route_table_id         = aws_route_table.public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-igw.id
}

resource "aws_route_table_association" "public-subnet-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-route-table.id
}


resource "aws_eip" "nat-eip" {
  vpc = true
   tags = {
      Name = "nat-eip"
      }
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public-subnet.id
  tags = {
      Name = "nat-gateway"
      }
}
resource "aws_security_group" "web-sg" {
  vpc_id = aws_vpc.my_vpc.id
  name   = "web-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_security_group" "db-sg" {
  vpc_id = aws_vpc.my_vpc.id
  name   = "db-sg"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]  
    # Allow traffic from private subnets
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-sg"
  }
}
