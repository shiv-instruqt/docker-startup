resource "page" "overview" {
  title = "What's Happening in This Lab"
  file  = "instructions/overview.md"
}

resource "page" "verify_docker" {
  title = "Verify the Flask App"
  file  = "instructions/verify_docker.md"

  activities = {
    check_docker = resource.task.check_docker
  }
}
