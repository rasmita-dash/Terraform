output "HelloUser" {
    value = "Hello ${var.userName} Age: ${var.age}"
  
}

output "PrintFirstFromList" {
    value = "Users are ${join(",  ", var.users)}.     First element is : ${upper(var.users[0])}.  Second element is : ${title(var.users[0])}"
}

#terraform plan -var "userName=Rasmita" -var "age=32"

output "UsersAge"{
    value = "Age of ${var.userName} is: ${lookup(var.UsersAge, var.userName)}"
}