resource "aws_ami" "example" {
  name                = "test-ami-us-east-1"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"
  imds_support        = "v2.0" # Enforce usage of IMDSv2. You can safely remove this line if your application explicitly doesn't support it.
  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = "snap-0dc21fd64c96acae0"
    volume_size = 8
  }
}

resource "aws_ami_copy" "example" {
  name              = "terraform-example"
  source_ami_id     = "ami-088b0c3ab952635e3"
  source_ami_region = "us-east-1"

  tags = {
    Name = "HelloWorld"
  }
}



terraform plan | awk '/Error:/ {print $0}'

