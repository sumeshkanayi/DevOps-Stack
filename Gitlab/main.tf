#Chef recipe for installing Gitlab 
#aws instance Ubuntu 16.04 t2.medium

resource aws_instance 'gitlab'{
  ami="ami-ee7bca8d"
  instance_type = "t2.medium"
  tags {
    Name = "Gitlab"
  }
  security_groups=["sg-191c707e"]
  key_name="siamol"
  
  provisioner "file" {
    content     = "bin/setup.sh"
    destination = "/tmp/Gitlabsetup.sh"
  }
  
  provisioner "remote-exec" {
    inline = [
      "sh /tmp/Gitlabsetup.sh"
    ]
  }
  
  }
