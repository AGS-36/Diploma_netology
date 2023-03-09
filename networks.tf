resource "yandex_vpc_network" "my_network" {
    name = "my_network"
}

resource "yandex_vpc_subnet" "my_subnet_a" {
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.my_network.id}"
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_subnet" "my_subnet_b" {
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.my_network.id}"
  v4_cidr_blocks = ["10.0.2.0/24"]
}

resource "yandex_vpc_subnet" "my_subnet_c" {
  zone           = "ru-central1-c"
  network_id     = "${yandex_vpc_network.my_network.id}"
  v4_cidr_blocks = ["10.0.3.0/24"]
}
