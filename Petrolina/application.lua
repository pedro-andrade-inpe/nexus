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
		select = {"Nome","ponto"},
		icon = {"yellow_home", "green_home"},
		label = {"point1", "point2"},

		report = function(cell)
			local mreport = Report{
				title = cell.name,  -- "name" is an attribute of object
				author = "NEXUS"
			}

				mreport:addImage("photos/"..cell.Nome..".jpg")

			return mreport
		end
	}
}

