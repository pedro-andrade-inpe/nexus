import("publish")

local description = [[
	Trabalho de campo feito pelo <b>Museu Nacional</b>.<br>
	Tanto esta aplicação quanto o trabalho de campo foram realizados no contexto do projeto <b>Nexus</b>, fomentado pela <b>FAPESP</b>, processo <b>#2017/22269-2</b>
]]

Application{
	key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "fitofisionomias.tview",
	description = description,
	base = "roadmap",
	zoom = 5,
	template = {navbar = "darkblue", title = "white"},
	display = false,

	trajectory = View{
		description = "Trajeto percorrido de carro durante o trabalho de campo",
		width = 2,
		border = "blue",
		icon = {
			time = 60
		}
	},
	
	points = View{
		description = "Pontos sobrevoados por drone",
		select = "Ponto",
		icon = "flag",
		label = "ponto sobrevoado",

		report = function(cell)
			local mreport = Report{
				title = "Fitofisionomias",  -- "name" is an attribute of object
				author = "NEXUS"
			}

			local text = ""
	if cell.Ponto == 1 then
				text = "Projeto Nexus - <b>A Tropical Forests Serra da Ibiapaba Brejo de Altitute</b><br/>"	
				mreport:addVideo{
			   width = 560,
			   heigh = 315,
			   url = "https://www.youtube.com/embed/dwJIpPqFFXw",
			}
			elseif cell.Ponto == 2 then
				text = "Projeto Nexus - <b>A SDTF Caatinga Serra da Meruoca</b><br/>"
				mreport:addVideo{
			   width = 560,
			   heigh = 315,
			   url = "https://www.youtube.com/embed/dm5HyXIg40I",
			}
			elseif cell.Ponto == 3 then
				text = "Projeto Nexus - <b>A SDTF Cerradão</b><br/>"
				mreport:addVideo{
			   width = 560,
			   heigh = 315,
			   url = "https://www.youtube.com/embed/na_A4iJzVyc",
			}
			elseif cell.Ponto == 4 then
				text = "Projeto Nexus - <b>HAB Caatina Morro do Chapéu BA</b><br/>"
				mreport:addVideo{
			   width = 560,
			   heigh = 315,
			   url = "https://www.youtube.com/embed/YKd8ipcRB1U",
			}
			elseif cell.Ponto == 5 then
				text = "Projeto Nexus - <b>A SDTLF Oeste Baiano</b><br/>"
				mreport:addVideo{
			   width = 560,
			   heigh = 315,
			   url = "https://www.youtube.com/embed/ioIOUwTWBEw",
			}
			elseif cell.Ponto == 6 then
				text = "Projeto Nexus - <b>A SDTF MS</b><br/>"
				mreport:addVideo{
			   width = 560,
			   heigh = 315,
			   url = "https://www.youtube.com/embed/m1khJbZnbxE",
			}
			elseif cell.Ponto == 7 then
				text = "Projeto Nexus - <b>Voo 01 Veredas and Swamp Gallery Forests</b><br/>"
				mreport:addVideo{
			   width = 560,
			   heigh = 315,
			   url = "https://www.youtube.com/embed/oTVE3Fw6xaY",
			}
			else
				text = "Projeto Nexus - <b>Voo 02 Arboreal Seasonally Dry Tropical Forest</b><br/>"
				mreport:addVideo{
			   width = 560,
			   heigh = 315,
			   url = "https://www.youtube.com/embed/143IxB0-roU",
			}
			end	
		
		mreport:addText(text)
		

			return mreport
		end
	}
}

