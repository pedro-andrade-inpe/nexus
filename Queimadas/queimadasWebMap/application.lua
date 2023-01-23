import("publish")

local description = [[
	Esta aplicação descreve o trabalho de campo que ocorreu entre <b>28/04/22</b> e <b>03/05/2022</b> nos municípios de <b>Queimadas/PB, Campina Grande/PB</b> e municípios próximos, com objetivo de coletar amostras de solos e índice de área foliar em áreas degradadas e não degradadas. Esses dados foram usados para análise química de carbono e nitrogênio, bem como cobertura foliar, buscando analisar o nível de degradação da terra da região e comparar os resultados com o uso da terra e indicadores socioambientais. Foram coletadas 51 amostras de solo em diferentes tipos de solo da região. As medições de índice de área foliar foram realizadas nos mesmos locais da coleta de solos, sempre que possível. Associados as coletas, foram feitos registros fotográficos e marcação de coordenadas dos pontos visitados. Em alguns pontos não foi possível realizar a coleta de amostras de solo por estarem em locais inacessíveis. Nesses casos, foram feitos apenas registros fotográficos para interpretação da paisagem (no total foram feitos 63 registros e 51 coletas de solo).<br><br> Este trabalho de campo foi realizado pelo pesquisador <b>Gustavo Felipe Balué Arcoverde</b> e a pesquisadora bolsista PCI <b>Jocilene Dantas Barros</b>, com apoio de pesquisadores do <b>IFSertãoPE</b> e <b>EMBRAPA</b>. Tanto esta aplicação quanto o trabalho de campo foram realizados no contexto do projeto <b>Nexus</b>, fomentado pela <b>FAPESP</b>, processo <b>#2017/22269-2.</b>
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
    project = "queimadas.tview",
    description = description,
	base = "roadmap",
    zoom = 10.3,
	template = {navbar = "darkblue", title = "white"},
    display = false,

    trajectory = View{
        description = "Trajeto percorrido de carro durante o trabalho de campo",
        width = 2,
        border = "blue",
        icon = {
            time = 100
            }
    },

    points = View{
        missing = 1,
        description = "Localidades visitadas",
        select = "Ponto",
        icon = "flag",
        label = "ponto de coleta",

        report = function(cell)
            local mreport = Report{
                title = cell.Nome,  -- "name" is an attribute of object
                author = "NEXUS"
            }
                
            local text = "Ponto: <b>"..cell.Ponto.."</b><br><br>Tipo de solo: <b>"..cell.Tipo_solo.."</b>, <br>Coleta do solo: <b>"..cell.Coleta_Sol.."</b>,<br>Degradado: <b>"..cell.Degradado.."</b>."		
		
		mreport:addText(text)
		mreport:addImage("photos/"..cell.Fotografia..".jpg")

            return mreport
        end
    }
}