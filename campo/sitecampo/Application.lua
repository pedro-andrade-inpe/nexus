import("publish")
import("gis")

Project {
  title = "Coleta de amostras de solo, planta e água para análise isotópica de água e análise granulométrica do solo nos biomas Caatinga / Cerrado.",
  author = "NEXUS",
  file = "campo001.tview",
  clean = true,
  points = "campo_001.shp",
}


description = [[
  Este trabalho de campo foi realizado pelo pesquisador <b>Rafael Costa Pinheiro</b>, bolsista de pós-doutorado da Fundação de Amparo à Pesquisa do Estado de São Paulo <b>(FAPESP - Processo #2020/14046-6)</b>, sob supervisão da pesquisadora <b>Laura De Simone Borma</b>, do INPE, no contexto do Projeto Temático <b>Nexus (FAPESP - Processo #2017/22269-2)</b>. Pesquisadores, alunos de pós-graduação e colaboradores de campo do INSA, além de um docente da UFCG, em Campina Grande, e docentes e alunos do curso de biologia da UFOB, em Barreiras,  auxiliaram na seleção das áreas de estudo, na procura e na seleção das espécies amostradas e também na coleta dos dados em campo.<br>
]]

Application {
  key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
  project = "campo001.tview",
  base = "roadmap",
  description = description,
  output = "/home/luis/Ti/Inpe/new-webmapping/campo/sitecampo",
  template = { navbar = "darkblue", title = "white" },
  display = false,

  points = View {
    missing = 1,
    description = "Localidades visitadas",
    select = "Ponto",
    icon = "flag",
    label = "ponto de coleta",

    report = function(cell)
      local report = Report {
        title = "Coleta de amostras de solo, planta e água para análise isotópica de água e análise granulométrica do solo", -- "name" is an attribute of object
        author = "NEXUS"
      }
      
      if cell.fid == 0 then

      title =
        [[Dois trabalhos de campo, realizados entre os dias 28 e 29/04/2022 (estação úmida), e 29/11 e 04/12/2022 (estação seca), na Estação Experimental Miguel Arraes - Instituto Nacional do Semiárido (INSA), no município de Campina Grande-PB, representam o bioma Caatinga.
      Foram realizadas coletas de amostras de solo, planta e água (corpos hídricos da área e chuva), com o objetivo de caracterizar o estado hídrico e os mecanismos de uso da água pelas plantas por meio do uso de isótopos estáveis da água, a fim de avaliar a variabilidade sazonal (estação chuvosa x estação seca) na separação ecohidrológica nesse bioma, além de realizar a análise granulométrica do solo.</br>
        Onze (11) espécies de plantas lenhosas comuns e representativas da região foram selecionadas para o estudo. Foram amostrados três indivíduos de cada uma das espécies em cada uma das estações do ano, totalizando 66 árvores amostradas. O diâmetro à altura do peito (DAP) de todas as plantas amostradas foi medido. Nas proximidades da área onde as amostras de plantas foram coletadas, cavas de solo foram abertas em três localidades (para efeito de triplicata), em cada uma das campanhas de campo. Nessas cavas, amostras de solo foram coletadas a cada 10 cm, até uma profundidade de 100 cm (ou até a profundidade máxima atingida no local).</br>]]

      else

        title =
        [[Dois trabalhos de campo realizados entre os dias 21 e 27/07/2022 (estação seca) e 06 e 11/02/2023 (estação úmida), no campus da Universidade Federal do Oeste da Bahia (UFOB), no município de Barreiras-BA, representam o bioma Cerrado.
        Foram realizadas coletas de amostras de solo, planta e água (corpos hídricos da área e chuva), com o objetivo de caracterizar o estado hídrico e os mecanismos de uso da água pelas plantas por meio do uso de isótopos estáveis da água, a fim de avaliar a variabilidade sazonal (estação chuvosa x estação seca) na separação ecohidrológica nesse bioma, além de realizar a análise granulométrica do solo.</br>
        Dez (10) espécies de plantas lenhosas comuns e representativas da região foram selecionadas para o estudo. Foram amostrados três indivíduos de cada uma das espécies em cada uma das estações do ano, totalizando 60 árvores amostradas. O diâmetro à altura do peito (DAP) de todas as plantas amostradas foi mensurado. Nas proximidades da área onde as amostras de plantas foram coletadas, cavas de solo foram abertas em três localidades (para efeito de triplicata), em cada uma das campanhas de campo. Nessas cavas, amostras de solo foram coletadas a cada 10 cm, até uma profundidade de 100 cm (ou até a profundidade máxima atingida no local).</br>]]
      end

      local text = "Local: <b>" .. cell.Local .. "</b><br>Tipo de bioma:<b> " .. cell.Tbio .. "</b>"
      report:addText(title)
      report:addText(text)
      report:addSeparator()
      report:addImage("photos/" .. cell.Foto01 .. ".png")
      report:addImage("photos/" .. cell.Foto02 .. ".png")
      report:addImage("photos/" .. cell.Foto03 .. ".png")


      return report
    end
  }
}
