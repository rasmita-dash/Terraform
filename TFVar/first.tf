variable "age" {
  type=number
}

variable "userName" {
  type=string
}
output "TFVarBlock"{
    value="I am ${var.userName} and I am ${var.age} years old"
}

# terraform plan -var-file=development.tfvars