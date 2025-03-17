output "Web-1-IP-adress" {
    description = "IP Adress for Web-1"
    value = "aws_instance.web1.public_ip"
}

output "Web-2-IP-adress" {
    description = "IP Adress for Web-2"
    value = "aws_instance.web2.public_ip"
}

output "Web-3-IP-adress"{
    description = "Private IP Adress for Web-3"
    value = "aws_instance.web3.private_ip"
}