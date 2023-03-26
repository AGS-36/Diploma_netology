resource "yandex_compute_instance" "node06" {
  name                      = "node06"
  zone                      = "ru-central1-c"
  hostname                  = "node06"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.ubuntu_image.id
      name        = "node06"
      size        = "15"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.my_subnet_c.id}"
    nat        = true
  }

  metadata = {
    user-data = "${file("./meta.yaml")}"
  }
}
