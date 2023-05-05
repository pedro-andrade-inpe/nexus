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
				text = "Projeto Nexus - <b>A SDTF Caatinga Serra da Meruoca</b><br/>"	
				mreport:addVideo{
			   width = 560,
			   heigh = 315,
			   url = "https://www.youtube.com/embed/dm5HyXIg40I",
			}
			elseif cell.Ponto == 2 then
				text = "Projeto Nexus - <b>HAB Caatina Morro do Chapéu BA</b><br/>"
				mreport:addVideo{
			   width = 560,
			   heigh = 315,
			   url = "https://www.youtube.com/embed/YKd8ipcRB1U",
			}
			else
				text = "Projeto Nexus - <b>A TF Brejo de Altitude Serra da Ibiapaba</b><br/>"
				mreport:addVideo{
			   width = 560,
			   heigh = 315,
			   url = "https://www.youtube.com/embed/dwJIpPqFFXw",
			}
			end	
		
		mreport:addText(text)
		

			return mreport
		end
	}
}

