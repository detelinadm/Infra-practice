variable "vpc_id" {
   type = string
 }
 
 variable "public_subnet1_id" {
   type = string
 }

 variable "public_subnet2_id" {
   type = string
 }
 
 variable "target_instance_ids" {
   type = map(string)
 }