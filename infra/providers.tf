provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Owner      = "cvanlaw/dotnet-hello-world-lambda"
      Repository = "https://github.com/cvanlaw/dotnet-hello-world-lambda"
    }
  }
}
