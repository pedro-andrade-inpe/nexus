import("gis")
import("publish")


description = [[
  O projeto NEXUS prevê a adoção de um processo em multi-escala. Além da escala regional (Cerrado, Caatinga e Bacias do São Francisco e Paranaiba), foram selecionadas 3 escalas locais. Foi realizado um processo quantitativo, baseado em indicadores e viagens de campo exploratórias no qual um conjunto inicial de municípios foi selecionado. Estes municípios se caracterizam por apresentarem uma problemática relacionada ao tema central do projeto: Nexus água-agricultura-energia.<br>

  <p>O processo de preparação para as oficinas locais (incluindo o mapeamento e seleção de participantes para as oficinas) foi realizada através da adaptação da ferramenta chamada  <b>Net-Map</b> <b>(SATTLER; 2022)</b><br></p>
  <p>O <b>Net-Map</b>, em Inglês ou Mapa de Rede, em Português, é uma ferramenta de mapeamento baseada em entrevistas que ajuda as pessoas a entenderem, visualizarem e discutirem situações em que muitos atores diferentes influenciam o sistema em questão. Ao criar um Mapa de Rede de Influência, indivíduos e grupos podem esclarecer suas próprias visões sobre uma situação, promover discussões e desenvolver uma abordagem estratégica para suas atividades de rede.<br></p> Mais especificamente, o Mapa de Rede ajuda os participantes a determinar:<br>
  • quais atores estão envolvidos em uma determinada rede;<br>
  • como eles estão vinculados;<br>
  • quão influentes eles são.<br><br>


  <b>REFERÊNCIA:</b><br>
  <b>SATTLER</b>, Claudia. Using Process Net-Map to analyze governance innovations in the forestry sector. Ecosystem Services, v. 55, p. 101433, 2022.
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
  order = { "Points" },
  template = { navbar = "darkblue", title = "white" },
  display = false,



  Points = View {
    description = "Oficinas participativas",
    select = "Local",
    icon = "flag",
    label = "locais",

    report = function(cell)
      local report = Report {
        title = cell.Descricao,
      }

      text = "Esta oficina ocorreu de " ..
          cell.F12 ..
          " até " ..
          cell.F3 ..
          " de 2022.<br> Um total de " ..
          cell.Par .. " colaboradores participaram do evento, que abrangeu " .. cell.QMun .. " municípios."

      Descricao = [[<h3>Descrição:</h3>
      Setor Privado - Empresas, consultorias, Associações representando setor privado<br>
      Governo - Executivo, Legislativo ou Judiciário<br>
      Sociedade Civil - ONGs, Movimentos sociais, Associações, etc.<br>
      Academia - Institutos de Pesquisa Públicas/Privadas e universidades<br>]]

      Interesse = {
        class = "bar",
        id = "1",
        columns = {
          "Setor Privado",
          "Participantes do Governo",
          "Sociedade Civil",
          "Academia"
        },
        
        values = {
          {
            "Atores convidados",
            cell.SPri,
            cell.Gov,
            cell.SCivil,
            cell.Aca,
            0,
            10
          }
        }
      }

      if cell.Local == "Campina-Grande" then
        report:addText
          "Campina Grande-PB e municípios ao entorno, foram escolhidos por fazerem parte da área de transposição do Rio São Francisco na região mais seca do semiárido."
        report:addText(text)
        report:addGraphic(Interesse)
        report:addText(Descricao)
        report:addSeparator()
        report:addImage("CampinaGrande1.jpg")
        report:addImage("CampinaGrande2.jpg")
      elseif cell.Local == "Barreiras" then
        report:addText
          "Barreiras e municípios vizinhos, localizados no Oeste da Bahia e parte da região MATOPIBA,foram escolhidos por fazerem parte de uma região crítica no contexto da produção de commodities agrícolas e irrigação em larga escala."
          report:addText(text)
        report:addGraphic(Interesse)
        report:addText(Descricao)
        report:addSeparator()
        report:addImage("Barreiras1.jpg")
        report:addImage("Barreiras2.jpg")
        report:addImage("Barreiras3.jpg")
      else
        report:addText
        "Petrolina/Juazeiro e municípios ao entorno por estarem ligados ao pólo de produção de frutas irrigadas as margens do Rio São Francisco, onde também estão localizadas hidrelétricas de grande porte."
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
