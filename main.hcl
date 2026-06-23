resource "lab" "main" {
  title       = "Python Flask App Lab"
  description = "In this lab, you'll interact with a live Flask web app running on an Ubuntu VM. Enter any year to instantly find the nearest leap year — and learn the calendar rules behind it."
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
  settings {
    timelimit {
      duration = "30m"
    }
  }
}
