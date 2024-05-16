resource "aws_instance" "db" {

    ami = var.ami_id
    instance_type = var.instance_name == "db" ? "t3.micro" : "t3.small"

}