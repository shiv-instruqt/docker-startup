resource "layout" "two_column" {
  column {
    width = "50"
    instructions {
    }
  }

  column {
    width = "50"

    tab "terminal" {
      target = resource.terminal.shell
    }

    tab "flask_app" {
      target = resource.service.flask_app
    }
  }
}
