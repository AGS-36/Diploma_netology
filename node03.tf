resource "yandex_compute_instance" "node03" {
  name                      = "node03"
  zone                      = "ru-central1-c"
  hostname                  = "node03.netology.yc"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "fd8emvfmfoaordspe1jr"
      name        = "node03"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.my_subnet_c.id}"
    nat        = true
  }

  metadata = {
    ssh-keys = vat.pub_key
  }
}
