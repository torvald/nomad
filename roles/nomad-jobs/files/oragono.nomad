job "oragono" {
  region = "global"
  datacenters = [
    "ams",
  ]
  type = "service"

  group "svc" {
    count = 1
    network {
      port "irc" {
        static = 6697
      }
    }
    task "app" {
      driver = "docker"
      config {
        image                  = "oragono/oragono:latest"
        advertise_ipv6_address = true
        ports                  = ["irc"]
        mounts = [
          {
            type     = "bind"
            target   = "/ircd"
            source   = "/opt/nomad/data/oragono/data"
            readonly = false
          }
        ]
      }
      env = {
        "TZ" = "Europe/Oslo"
      }
      resources {
        cpu    = 100
        memory = 128
      }

      service {
        name = "oragono"
        port = "irc"
      }
    }
  }
}
