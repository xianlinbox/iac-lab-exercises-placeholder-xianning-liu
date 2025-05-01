resource "aws_ecr_repository" "api" {
  name         = "${var.prefix}-ecr-repo"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.prefix}-ecr-repo"
  }
}