import("publish")

local description = [[
	fitofisionomias
]]

Application{
	key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "fitofisionomias.tview",
	description = description,
	base = "roadmap",
	zoom = 6.5,
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
		description = "Pontos sobrevoados por drones",
		select = "Ponto",
		icon = "forest",
		label = "ponto sobrevoado",

		report = function(cell)
			local mreport = Report{
				title = "Fitofisionomias",  -- "name" is an attribute of object
				author = "NEXUS"
			}

			local text = ""
			if cell.Ponto == 1 then
				text = "Projeto Nexus - <b>Voo 01 Veredas e Pântano Galeria Florestas</b><br/>"	
				mreport:addVideo{
			   width = 500,
			   heigh = 315,
			   url = "https://www.youtube.com/watch?v=oTVE3Fw6xaY",
			}
			else
				text = "Projeto Nexus - <b>Voo 02 Floresta Tropical Arbórea Sazonalmente Seca</b><br/>"
				mreport:addVideo{
			   width = 500,
			   heigh = 315,
			   url = "https://www.youtube.com/watch?v=143IxB0-roU",
			}
			end
						
		
		mreport:addText(text)
		

			return mreport
		end
	}
}

