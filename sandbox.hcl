resource "network" "main" {
  subnet = "10.0.200.0/24"
}

resource "vm" "ubuntu" {
  image {
    name = "ubuntu:22.04"
  }

  resources {
    cpu    = 2
    memory = 4096
  }

  environment = {
    DEBIAN_FRONTEND = "noninteractive"
  }

  startup_script = <<-EOF
    #!/bin/bash
    export DEBIAN_FRONTEND=noninteractive

    apt-get update -y
    apt-get install -y ca-certificates curl gnupg lsb-release

    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
      gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null

    apt-get update -y
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    nohup dockerd > /var/log/dockerd.log 2>&1 &

    WAIT=0
    until docker info > /dev/null 2>&1; do
        sleep 3
        WAIT=$((WAIT+3))
        if [ $WAIT -ge 120 ]; then
            echo "Docker daemon did not start in time"
            exit 1
        fi
    done

    docker pull shivtushal/git-lab:python-app-1.0

    docker run -d \
      --name flask-app \
      --restart unless-stopped \
      -p 5000:5000 \
      shivtushal/git-lab:python-app-1.0

    exit 0
  EOF

  port {
    local = 5000
  }

  network {
    id = resource.network.main.meta.id
  }

  health_check {
    timeout = "600s"

    tcp {
      address = "localhost:5000"
    }
  }
}
