import("publish")

local description = [[
	Petrolina
]]

Application{
	project = "petrolina.tview",
	description = "Small application with some data related to Petrolina.",
	base = "roadmap",
	zoom = 7,
	template = {navbar = "darkblue", title = "white"},
	display = false,

	trajectory = View{
		description = "trajetos Petrolina, from Comunicação",
		width = 2,
		border = "blue",
		icon = {
			time = 100
		}
	},
	
	points = View{
		description = "descrição a ser inserida aqui.",
		select = "Ponto",
		icon = "flag",
		label = "ponto de coleta",

		report = function(cell)
			local mreport = Report{
				title = cell.Nome,  -- "name" is an attribute of object
				author = "NEXUS"
			}

				mreport:addImage("photos/"..cell.Fotografia..".jpg")

			return mreport
		end
	}
}

