resource "lab" "main" {
  title       = "Python Flask App Lab"
  description = "Learn how to run a real Flask application directly using Python"
  layout      = resource.layout.two_column

  content {
    chapter "getting_started" {
      title = "Getting Started with Flask on Python"

      page "overview" {
        reference = resource.page.overview
      }

      page "verify_flask" {
        reference = resource.page.verify_docker
      }
    }
  }
}
