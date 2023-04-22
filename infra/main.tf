resource "aws_ecr_repository" "this" {
  name                 = "dotnet-hello-world-lambda"
  image_tag_mutability = "MUTABLE"
}
