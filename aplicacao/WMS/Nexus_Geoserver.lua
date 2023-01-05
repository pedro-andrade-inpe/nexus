--[[
	Aplicação utilizando as regições de estudo do Projeto Nexus
]]--

dofile("Report_Projeto.lua")

import("gis")
import("publish")


p = Project{
	file = "Projeto.tview",
	clean = true,
	Municipios = "municipios.shp",
	--Biomas = "biomas_nexus.shp",
	--Bacias = "bacias.shp",
}

-- Conectando ao GeoServer
service = "http://150.163.239.124:8080/geoserver/Nexus/wms"

Layer{project = p, service = service, name = "bacias", map = "bacias"}
Layer{project = p, service = service, name = "biomas", map = "biomas_nexus"}

Application{
	key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = p,
	base = "roadmap",
	title = "Nexus - Caminhos para a sustentabilidade",
	--order = {"Municipios", "bacias", "Biomas"}, -- PEDRO
	description = Projeto.Descricao,
    output = '/Applications/MAMP/htdocs/Aplication/01-Geoserver',


	Municipios = View{
        color = "Set2",
		select = "Nome_mun_2",
        description = "Municípios selecionados para trabalho de campo.", -- PEDRO
		report = function(cell)
			local report = Report{
				title = cell.Nome_mun_2 .." (" ..cell.UF.. ")",
				author = "Fontes: IBGE, Projeto Nexus, Wikipedia, Prefeitura Municipal de " ..cell.Nome_mun_2.. " e Google Maps",
			}

				-- identifica a layer a aplica o content

				-- Januaria --
				if cell.Nome_mun_2 == 'Januária' then
					dofile("Report_Januaria.lua")
					report:addImage("Bandeiras/Bandeira_januaria.jpeg")

					report:addMatrix(Caracteristicas)

					report:addGraphic(IDHM)
					report:addGraphic(Mortalidade)
					report:addSeparator()

					report:addText(Januaria.historia)
					report:addHeading("<center>Fotos</center>")
					report:addImage("Imagens/Januaria01.png")
					report:addImage("Imagens/Januaria02.jpg")

					report:addHeading("<center>Localização</center>")
					report:addText(Januaria.mapa)

					report:addSeparator()
					report:addText("<b>Fontes:</b> IBGE, Projeto Nexus, Wikipedia, Prefeitura Municipal de " ..cell.Nome_mun_2.. ", Portal Ambiente Brasil e Google Maps")


				-- Paulistana --
				elseif cell.Nome_mun_2 == 'Paulistana' then
					dofile("Report_Paulistana.lua")
					report:addImage("Bandeiras/Bandeira_paulistana.jpg")


					report:addMatrix(Caracteristicas)

					report:addGraphic(IDHM)
					report:addGraphic(Mortalidade)

					report:addSeparator()

					report:addText(Paulistana.historia)
					report:addHeading("<center>Fotos</center>")
					report:addImage("Imagens/Paulistana01.jpg")
					report:addImage("Imagens/Paulistana02.jpg")

					report:addHeading("<center>Localização</center>")
					report:addText(Paulistana.mapa)

					report:addSeparator()
					report:addText("<b>Fontes:</b> IBGE, Projeto Nexus, Wikipedia, Prefeitura Municipal de " ..cell.Nome_mun_2.. " e Google Maps")

				-- Petrolina --
				elseif cell.Nome_mun_2 == 'Petrolina' then
					dofile("Report_Petrolina.lua")
					report:addImage("Bandeiras/Bandeira_petrolina.png")


					report:addMatrix(Caracteristicas)

					report:addGraphic(IDHM)
					report:addGraphic(Mortalidade)

					report:addSeparator()

					report:addText(Petrolina.historia)
					report:addHeading("<center>Fotos</center>")
					report:addImage("Imagens/Petrolina01.jpg")
					report:addImage("Imagens/Petrolina02.jpg")

					report:addHeading("<center>Localização</center>")
					report:addText(Petrolina.mapa)

					report:addSeparator()
					report:addText("<b>Fontes:</b> IBGE, Projeto Nexus, Wikipedia, Prefeitura Municipal de " ..cell.Nome_mun_2.. " e Google Maps")

				-- Queimadas --
				elseif cell.Nome_mun_2 == 'Queimadas' then
					report:addImage("Bandeiras/Bandeira_queimadas.jpg")
					dofile("Report_Queimadas.lua")


					report:addMatrix(Caracteristicas)

					report:addGraphic(IDHM)
					report:addGraphic(Mortalidade)

					report:addSeparator()

					report:addText(Queimadas.historia)
					report:addHeading("<center>Fotos</center>")
					report:addImage("Imagens/Queimadas01.jpg")
					report:addImage("Imagens/Queimadas02.jpg")

					report:addHeading("<center>Localização</center>")
					report:addText(Queimadas.mapa)

					report:addSeparator()
					report:addText("<b>Fontes:</b> IBGE, Projeto Nexus, Wikipedia, Prefeitura Municipal de " ..cell.Nome_mun_2.. " e Google Maps")

				end -- fecha IF

			return report
		end
	}, -- fecha Municipios


	biomas = View{
		select = "name",
		color = {"#bad169", "#92ed68"},
		label = {"Cerrado", "Caatinga"},
		description = "Biomas estudados no Projeto Nexus.",
	}, -- fecha Biomas

	bacias = View{
		select = "rhi_nm",
		color = {"#1d2de0", "#1d2d44"},
		label = {"Parnaíba", "São Francisco"},
		description = "Bacias hidrográficas estudadas no projeto Nexus.",

	} -- fecha bacias

}
