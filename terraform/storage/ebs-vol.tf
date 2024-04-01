

resource "aws_ebs_volume" "pf-oportun-volume-ebs" {
    availability_zone = "us-east-1"
    type="standard"
    size=1
    tags = {
        Name="pf-oportun-volume-ebs"
        Env="Dev"
    }
  
}