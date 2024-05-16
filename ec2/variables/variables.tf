variable "ami_id" {
    type = string
    default = "ami-090252cbe067a9e58"
    description = "RHEL-9"
}

variable "instance_type"{
    type = string
    default = "t3.micro"
}

variable "tags" {
    default = {
    Project = "Expense"
    Environment = "Dev"
    terraform = true
    Name = "db"
    Module = "db"
    }
}

variable "cdir" {
    type = list(string)
    default = ["0.0.0.0/0"]
}