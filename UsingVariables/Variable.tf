# variable "userName" {
# }

variable "userName" {
    type = string
  default = "World"
}

variable "age" {
    type = number
  default = 20
}

variable "users" {
  type= list(string)
  default = [ "Niku", "Niki","Pipi", "Pinku" ]
}

variable UsersAge{
    type=map
    default={
        Niku=37
        Niki=36
        Pipi=32
        Pinku=28
    }
}