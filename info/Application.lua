import("gis")
import("publish")


description = [[
  input text here!
]]

Project {
  title = "INFO",
  author = "NEXUS",
  file = "info.tview",
  clean = true,
  Points = "info.shp",
}

Application {
  key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
  project = "info.tview",
  base = "roadmap",
  description = description,
  output = "/opt/lampp/htdocs/new-webmapping/info/siteinfo",
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

      local text = "Local: " .. cell.Local .. "<br>tipo: " .. cell.Cobertura .. "."

      report:addText(text)
      -- report:addImage("photos/"..cell.Fotografia..".jpg")


      return report
    end
  }
}
