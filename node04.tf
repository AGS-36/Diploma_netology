resource "yandex_compute_instance" "node04" {
  name                      = "node04"
  zone                      = "ru-central1-a"
  hostname                  = "node04"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "fd8emvfmfoaordspe1jr"
      name        = "node04"
      size        = "15"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.my_subnet_a.id}"
    nat        = true
  }

  metadata = {
    ssh-keys = var.pub_key
  }
}
