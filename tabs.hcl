resource "terminal" "shell" {
  target = resource.vm.ubuntu
  shell  = "/bin/bash"
}

resource "service" "flask_app" {
  target = resource.vm.ubuntu
  port   = 5000
  scheme = "http"
}
