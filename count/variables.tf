variable "ami_id" {
    type = string
    default = "ami-090252cbe067a9e58"
    description = "RHEL-9"
}



variable "common-tags" {
    default = {
    Project = "Expense"
    Environment = "Dev"
    terraform = true
    }
}

variable "cdir" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "instance_name"{
    default = ["db", "backend", "frontend"]
}