terraform {

  cloud {
    organization = "hard-drive-holdings"

    workspaces {
      name = "gooddaygreatday-infra"
    }
  }
}
