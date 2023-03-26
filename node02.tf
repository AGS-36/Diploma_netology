resource "yandex_compute_instance" "node02" {
  name                      = "node02"
  zone                      = "ru-central1-b"
  hostname                  = "node02"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.ubuntu_image.id
      name        = "node02"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.my_subnet_b.id}"
    nat        = true
  }

  metadata = {
    user-data = "${file("./meta.yaml")}"
  }
}
