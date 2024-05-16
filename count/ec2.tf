resource "aws_instance" "db" {
    count = length(var.instance_name)
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    # instance_type = var.instance_name == "db" ? "t3.large" : "t3.micro"
    instance_type = var.instance_name[count.index] == "db" ? "t3.micro" : "t3.small"

    tags = merge(
        var.common-tags, 
        {
        Name = var.instance_name[count.index]
        })
    }


resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = var.cdir
    }

    egress {
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "Siva"
    }
}