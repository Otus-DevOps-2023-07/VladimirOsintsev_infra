resource "yandex_lb_target_group" "redditappgrp" {
  name = "group-redditapp"

  dynamic "target" {
    for_each = yandex_compute_instance.app[*].network_interface[0].ip_address
    content {
      subnet_id = var.subnet_id
      address   = target.value
    }
  }
}

resource "yandex_lb_network_load_balancer" "redditapplb" {
  name                = "redditapplb"
#  deletion_protection = "false"
  listener {
    name        = "reddit-listener"
    port        = 9292
    target_port = 9292
    protocol    = "tcp"
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = yandex_lb_target_group.redditappgrp.id
    healthcheck {
      name                = "http"
      interval            = 2
      timeout             = 1
      unhealthy_threshold = 2
      healthy_threshold   = 2
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
}
