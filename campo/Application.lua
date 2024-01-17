import("gis")
import("publish")


description = [[
  input text here!
]]

Project {
  title = "CAMPO",
  author = "NEXUS",
  file = "campo.tview",
  clean = true,
  Points = "campo.shp",
}

Application {
  key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
  project = "campo.tview",
  base = "roadmap",
  description = description,
  output = "/opt/lampp/htdocs/new-webmapping/campo/sitecampo",
  order = { "Points" },
  template = { navbar = "darkblue", title = "white" },
  display = false,

  Points = View {
    description = "Coberturas",
    select = "Local",
    icon = "flag",
    label = "locais",

    report = function(cell)
      local report = Report {
        title = cell.titulo,
      }

      Descricao = [[<h3>Descrição:</h3> input description here!]]

      local text = "Local: " ..cell.Local.."."

      report:addText(text)
      report:addImage("photos/"..cell.Image..".jpg")


      return report
    end
  }
}
