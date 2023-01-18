--[[
	Aplicação utilizando as regições de estudo do Projeto Nexus
]]--

dofile("Report_Projeto.lua")

import("gis")
import("publish")


Project{
	file = "Projeto.tview",
	clean = true,
	Municipios = "municipios_2021.shp",
	Biomas = "biomas_nexus.shp",
	Bacias = "bacias.shp",
}


Application{
	key = "",
	project = "Projeto.tview",
	base = "roadmap",
	title = "Nexus - Caminhos para a sustentabilidade",
	order = {"Municipios", "Bacias", "Biomas"}, -- PEDRO
	description = Projeto.Descricao,
    output	= "/Applications/MAMP/htdocs/Aplication/07-Nexus",



	Municipios = View{
        color = "Set2",
		select = "Munics_esc",
        description = "Municípios selecionados para trabalho de campo.", -- PEDRO
		report = function(cell)
			local report = Report{
				title = cell.Munics_esc .." (" ..cell.UF.. ")",
				author = "Fontes: IBGE, Projeto Nexus, Wikipedia, Prefeitura Municipal de " ..cell.Munics_esc.. " e Google Maps",
			}

				-- identifica a layer a aplica o content

				-- Januaria --
				if cell.Munics_esc == 'Januaria' then
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
					report:addText("<b>Fontes:</b> IBGE, Projeto Nexus, Wikipedia, Prefeitura Municipal de " ..cell.Munics_esc.. ", Portal Ambiente Brasil e Google Maps")


				-- Paulistana --
				elseif cell.Munics_esc == 'Riachao das Neves' then
					dofile("Report_Riachao_das_neves.lua")
					report:addImage("Bandeiras/Bandeira_de_Riachao_das_Neves.png")


					report:addMatrix(Caracteristicas)

					report:addGraphic(IDHM)
					report:addGraphic(Mortalidade)

					report:addSeparator()

					report:addText(Riachao_das_neves.historia)
					report:addHeading("<center>Fotos</center>")
					report:addImage("Imagens/riachao01.jpg")
					report:addImage("Imagens/riachao02.jpg")

					report:addHeading("<center>Localização</center>")
					report:addText(Riachao_das_neves.mapa)

					report:addSeparator()
					report:addText("<b>Fontes:</b> IBGE, Projeto Nexus, Wikipedia, Prefeitura Municipal de " ..cell.Munics_esc.. " e Google Maps")

				-- Petrolina --
				elseif cell.Munics_esc == 'Petrolina' then
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
					report:addText("<b>Fontes:</b> IBGE, Projeto Nexus, Wikipedia, Prefeitura Municipal de " ..cell.Munics_esc.. " e Google Maps")

				-- Queimadas --
				elseif cell.Munics_esc == 'Queimadas' then
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
					report:addText("<b>Fontes:</b> IBGE, Projeto Nexus, Wikipedia, Prefeitura Municipal de " ..cell.Munics_esc.. " e Google Maps")

				end -- fecha IF

			return report
		end
	}, -- fecha Municipios


	Biomas = View{
		select = "name",
		color = {"#047a2d", "#059939"},
		description = "Biomas estudados no Projeto Nexus.", -- PEDRO
		report = function(cell)
			local report = Report{
				title = cell.name,
				author = "Fonte: MMA" -- PEDRO
			}

				if cell.name == 'Caatinga' then
					dofile("Report_Caatinga.lua")
					report:addHeading("<h2>Conheça o Bioma</h2>")
					report:addText(Caatinga.A)
					report:addText(Caatinga.B)

					report:addSeparator()
					report:addHeading("<center><h2>Conheça as Belezas da Caatinga</h2></center>")
					report:addText(Caatinga.Video)

					report:addSeparator()
					report:addText(Caatinga.C)

				else
					dofile("Report_Cerrado.lua")
					report:addHeading("<h2>Conheça o Bioma</h2>")
					report:addText(Cerrado.A)
					report:addSeparator()

					report:addHeading("<center><h2>Conheça as Belezas do Cerrado</h2></center>")
					report:addText(Cerrado.Video)

					report:addSeparator()
					report:addText(Cerrado.B)

				end -- fecha if

			return report
		end
	}, -- fecha Biomas

	Bacias = View{
		description = "Bacias hidrográficas estudadas no projeto Nexus.", -- PEDRO
		select = "rhi_nm", -- PEDRO
		color = {"#1d2de0", "#1d2de0"},
		report = function(cell)
			local report = Report{
				title = cell.rhi_nm,
				author = "Fonte: Wikipidia",
			}

				-- Parnaiba --
				if cell.rhi_nm == 'PARNAÍBA' then
					dofile("Report_Parnaiba.lua")
					report:addText(Parnaiba.etimologia)
					report:addHeading("<center><h2>Bacía Hidrográfica</h2></center>")
					report:addText(Parnaiba.bacia)

				else
					-- São Francisco --
					dofile("Report_Sao_Francisco.lua")
					report:addText(Sao_Francisco.toponimo)
					report:addHeading("<center><h2>História</h2></center>")
					report:addText(Sao_Francisco.historia)

				end -- fecha if

			return report
		end

	} -- fecha bacias

}
