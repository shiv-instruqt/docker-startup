resource "lab" "main" {
  title       = "Python Flask App Lab"
  description = "Learn how to run a real Flask application directly using Python"
  layout      = resource.layout.two_column

  content {
    chapter "getting_started" {
      title = "Getting Started with Flask on Python"


      page "instructions" {
        title     = "Instructions"
        reference = resource.page.instructions
      }
    }
  }
}
