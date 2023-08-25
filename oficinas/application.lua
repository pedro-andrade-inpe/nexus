import("gis")
import("publish")


local description = [[
  O projeto NEXUS prevê a adoção de um processo em multi-escala. Além da escala regional (Cerrado, Caatinga e Bacias do São Francisco e Paranaiba), foram selecionadas 3 escalas locais. Foi realizado um processo quantitativo, baseado em indicadores e viagens de campo exploratórias no qual um conjunto inicial de municípios foi selecionado. Estes municípios se caracterizam por apresentarem uma problemática relacionada ao tema central do projeto: Nexus água-agricultura-energia.
]]

Project {
  title = "Oficinas Participativas do Projeto Nexus",
  author = "NEXUS",
  file = "project.tview",
  clean = true,
  Points = "pontos-001.shp",
}

Application {
  key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
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
        title = cell.Descricao,
      }

      text = "Esta oficina ocorreu de "..cell.F12.." até "..cell.F3.." de 2022.<br> Um total de "..cell.Par.." colaboradores participaram do evento, que abrangeu "..cell.QMun.. " municípios."
     
        Descricao = [[<h3>Descrição:</h3>
      Setor Privado - <b>(Empresas, consultorias, Associações representando setor privado)</b><br>
      Governo - <b>(Executivo, Legislativo ou Judiciário)</b><br>
      Sociedade Civil - <b>(ONGs, Movimentos sociais, Associações, etc.)</b><br>
      Academia - <b>(Institutos de Pesquisa Públicas/Privadas e universidades)</b><br>]]

      Interesse = {
        class = "bar",
        id = "1",
        titile = [[Atores por setor de interesse na Escala local]],
        columns = {
          "Setor Privado",
          "Governo.",
          "Sociedade Civil",
          "Academia"
        },
        values = {
          {
            "Atores convidados",
            cell.SPri,
            cell.Gov,
            cell.SCivil,
            cell.Aca
          }
        }
      }

      if cell.Local == "Campina-Grande" then
        report:addText(text)
        report:addGraphic(Interesse)
        report:addText(Descricao)
        report:addSeparator()
        report:addImage("CampinaGrande1.jpg")
        report:addImage("CampinaGrande2.jpg")
      elseif cell.Local == "Barreiras" then
        report:addText(text)
        report:addGraphic(Interesse)
        report:addText(Descricao)
        report:addSeparator()
        report:addImage("Barreiras1.jpg")
        report:addImage("Barreiras2.jpg")
        report:addImage("Barreiras3.jpg")
      else
        report:addText(text)
        report:addGraphic(Interesse)
        report:addText(Descricao)
        report:addSeparator()
        report:addImage("Petrolina.jpg")
        report:addImage("Petrolina4.jpg")
      end

      
      return report
    end
  }
}
