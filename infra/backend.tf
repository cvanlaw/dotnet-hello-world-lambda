terraform {
  cloud {
    organization = "vanlaw_dev"
    hostname     = "app.terraform.io"

    workspaces {
      name = "dotnet-hello-world-lambda"
    }
  }
}
