resource "task" "check_docker" {
  description     = "Verify Docker and Flask app are running"
  success_message = "Great job! Docker is running and your Flask app is live."

  config {
    target = resource.vm.ubuntu
    user   = "root"
  }

  condition "docker_running" {
    description = "Check that Docker daemon is running"

    check {
      script          = "scripts/task/check_docker/check_docker.sh"
      failure_message = "Docker is not running. Try: docker ps"
    }

    solve {
      script = "scripts/task/check_docker/solve_docker.sh"
    }
  }
}
