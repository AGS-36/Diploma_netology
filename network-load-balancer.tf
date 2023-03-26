resource "yandex_lb_network_load_balancer" "my_load_balancer" {
  name = "my-lb"

  listener {
    name = "my-listener"
    port = 6443
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.my_k8s.id

    healthcheck {
      name = "http"
      http_options {
        port = 6443
        path = "/"
      }
    }
  }
}

resource "yandex_lb_target_group" "my_k8s" {
  name = "my-k8s"

  target {
    subnet_id = yandex_vpc_subnet.my_subnet_a.id
    address   = yandex_compute_instance.node01.network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.my_subnet_b.id
    address   = yandex_compute_instance.node02.network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.my_subnet_c.id
    address   = yandex_compute_instance.node03.network_interface.0.ip_address
  }
}
