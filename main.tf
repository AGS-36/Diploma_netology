terraform {
  required_providers {
    yandex = {
      source = "terraform-registry.storage.yandexcloud.net/yandex-cloud/yandex"
      version = ">= 0.13"
    }
  }
}

provider "yandex" {
  zone      = "ru-central1-a"
}

