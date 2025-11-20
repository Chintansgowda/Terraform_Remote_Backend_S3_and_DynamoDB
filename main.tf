resource "aws_default_vpc" "eg-vpc" {
  
}

resource "aws_default_security_group" "eg-sg" {
    vpc_id = aws_default_vpc.eg-vpc.id
  
}

data "aws_ami" "eg-ubuntu" {
    most_recent = true
    owners      = ["099720109477"] # Canonical

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
  
}

resource "aws_instance" "eg-web" {
    ami           = data.aws_ami.eg-ubuntu.id
    instance_type = var.inst_type
    security_groups = [aws_default_security_group.eg-sg.id]
    

    tags = {
        Name = "eg-web-server"
        node = "tf-node"
    }
  
}