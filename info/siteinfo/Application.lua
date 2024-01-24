import("publish")
import("gis")

Project {
  title = "site-info",
  author = "NEXUS",
  file = "info.tview",
  clean = true,
  points = "info.shp",
}

description = [[
  descrição do site info!!
]]

Application {
  key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
  project = "info.tview",
  base = "roadmap",
  description = description,
  output = "/home/luis/Ti/Inpe/new-webmapping/info/siteinfo",
  template = { navbar = "darkblue", title = "white" },
  display = false,

  points = View {
    missing =1,
    description = "Localidades visitadas",
    select = "Ponto",
    icon = "flag",
    label = "ponto de coleta",

    report = function(cell)
      local report = Report {
        title = "Ponto de Coleta de Solo e Vegetação",
        author = "NEXUS"
      }

      local text = "Local: <b>" .. cell.Local .. "</b><br>Tipo: <b>" .. cell.Cobertura .. "</b><br>Id:<b> " .. cell.Ponto .."</b>"

      report:addText(text)
      report:addImage("photos/"..cell.Fotografia..".jpg")


      return report
    end
  }
}
