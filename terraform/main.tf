resource "aws_instance" "jenkins" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.JenkinsKP.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  user_data = file("../install.sh")

  tags = {
    Name = "jenkins-server"
  }
}
