resource "null_resource" "cluster" {
  count = 1

  provisioner "file" {
    source      = "${path.module}/user-data.sh"
    destination = "/tmp/user-data.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.root}/kops-key.pem")
      host        = data.aws_instance.web_details.public_ip
      timeout     = "2m"
    }
  }


  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/user-data.sh",
      "sudo /tmp/user-data.sh",
      "sudo apt update",
      "sudo apt install jq unzip -y",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.root}/kops-key.pem")
      host        = data.aws_instance.web_details.public_ip
      timeout     = "2m"
    }
  }

  triggers = {
    instance_id = data.aws_instance.web_details.id
  }

  depends_on = [
    aws_autoscaling_group.web,
    data.aws_instances.web_instances,
    data.aws_instance.web_details
  ]
}
