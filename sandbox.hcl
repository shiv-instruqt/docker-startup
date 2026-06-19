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
    apt-get install -y python3 python3-pip python3-venv nano
    cd /root
    python3 -m venv .venv
    /root/.venv/bin/pip install flask requests
    cat > /root/app.py << 'PYEOF'
from flask import Flask, jsonify
import socket
import requests

app = Flask(__name__)

def get_private_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
        return ip
    except Exception:
        return "unavailable"

def get_public_ip():
    try:
        return requests.get("https://api.ipify.org", timeout=5).text
    except Exception:
        return "unavailable"

@app.route("/")
def index():
    return f"<h1>Year Converter</h1><p>Private IP: {get_private_ip()}</p>"

@app.route("/api/server-info")
def server_info():
    return jsonify({"private_ip": get_private_ip(), "public_ip": get_public_ip()})

if __name__ == "__main__":
    print(f"[Server] Private IP : {get_private_ip()}")
    print(f"[Server] Public  IP : {get_public_ip()}")
    app.run(host="0.0.0.0", port=5000)
PYEOF
    nohup /root/.venv/bin/python /root/app.py > /var/log/flask-app.log 2>&1 &
    exit 0
  EOF

  port {
    local = 5000
  }

  network {
    id = resource.network.main.meta.id
  }
}
