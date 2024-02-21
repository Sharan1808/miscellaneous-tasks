terraform {
  backend "s3" {
    bucket = "d76s-terraform-state"
    key = "misc/jenkins-ip-update/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_instance" "jenkins" {
  instance_id = "i-0e337a374cc5b276e"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins"
  type    = "A"
  zone_id = "Z08005401DQ0Y8GTTZHAT"
  ttl =10
  records = [data.aws_instance.jenkins.public_ip]
}


data "aws_instance" "artifactory" {
  instance_id = "i-02bfcf2e1e2a07ef3"
}

resource "aws_route53_record" "artifactory" {
  name    = "artifactory"
  type    = "A"
  zone_id = "Z08005401DQ0Y8GTTZHAT"
  ttl =10
  records = [data.aws_instance.artifactory.public_ip]
}
