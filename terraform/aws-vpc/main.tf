resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "main-subnet"
  }
}

# Create a Security Group to allow SSH access (port 22)
resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
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
    Name = "allow_ssh"
  }
}

# Create an EC2 instance in the subnet
resource "aws_instance" "linux_vm" {
  ami           = var.ami_id              # The AMI ID of a Linux image
  instance_type = "t2.micro"              # EC2 instance type
  subnet_id     = aws_subnet.main.id      # Place the instance in the created subnet
  security_groups = ["sg-02652e9151a9886ba"] # Attach the security group

  tags = {
    Name = "Linux-VM"
  }

  # Ensure key pair is provided for SSH access
  key_name = var.key_name
}
