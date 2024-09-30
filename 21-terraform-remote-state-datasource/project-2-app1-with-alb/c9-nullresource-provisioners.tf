resource "null_resource" "name" {
    depends_on = [ module.ec2_public ]

    connection {
      type         = "ssh"
      user         = "ec2-user"
      private_key  = file("private-key/k8sprod2023.pem")
      host         =   aws_eip.bastion_ip.public_ip
    }
  
  provisioner "file" {
    source = "private-key/k8sprod2023.pem"
    destination = "/tmp/k8sprod2023.pem"
    
  }
  provisioner "remote-exec" {
    inline = [ 
        "sudo chmod 400 /tmp/k8sprod2023.pem"
     ]
    
  }
  provisioner "local-exec" {
    command = "echo vpc created on `date` and VPC ID: ${data.terraform_remote_state.vpc.outputs.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
  }

#   provisioner "local-exec" {
#     command = "echo destroy time prov 'date' >> destroy-time-prov.txt"
#     working_dir = "local-exec-output-files/"
#     when = destroy
#   }
}