terraform {
  required_providers {
    yandex = {
     source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
    backend "s3" {
     endpoint   = "storage.yandexcloud.net"
     bucket     = "s3terraform"
     region     = "ru-central1"
     key        = "stage.tfstate"

     skip_region_validation      = true
     skip_credentials_validation = true
  }
}
