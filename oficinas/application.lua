import("gis")
import("publish")


local description = [[
  O projeto NEXUS prevê a adoção de um processo em multi-escala. Além da escala regional (Cerrado, Caatinga e Bacias do São Francisco e Paranaiba), foram selecionadas 3 escalas locais. Foi realizado um processo quantitativo, baseado em indicadores e viagens de campo exploratórias no qual um conjunto inicial de municípios foi selecionado. Estes municípios se caracterizam por apresentarem uma problemática relacionada ao tema central do projeto: Nexus água-agricultura-energia.
]]

Project {
  title = "Oficinas NEXUS – Escala local",
  author = "NEXUS",
  file = "project.tview",
  clean = true,
  Points = "pontos-001.shp",
}

Application {
  -- key = "",
  project = "project.tview",
  base = "roadmap",
  description = description,
  output = "/opt/lampp/htdocs/nexus/oficinas",
  order = {"Points"},
  template = { navbar = "darkblue", title = "white" },
  display = false,



  Points = View {
    description = "inserir descrição",
    select = "Local",
    icon = "flag",
    label = "locais",

    report = function(cell)
      local report = Report{
        title = "teste",
      }

      
      if cell.Local == "Campina-Grande" then
        report:addText("Campina Grande-PB e municípios ao entorno")
        report:addSeparator()
        report:addImage("CampinaGrande1.jpg")
        report:addImage("CampinaGrande2.jpg")
      elseif cell.Local == "Barreiras" then
        report:addText("Barreiras e municípios vizinhos")
        report:addSeparator()
        report:addImage("Barreiras1.jpg")
        report:addImage("Barreiras2.jpg")
        report:addImage("Barreiras3.jpg")
      else
        report:addText("Petrolina/Juazeiro e municípios ao entorno ")
        report:addSeparator()
        report:addImage("Petrolina.jpg")
        report:addImage("Petrolina4.jpg")
      end

      
      return report
    end
  }
}
