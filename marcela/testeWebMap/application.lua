import("publish")

local description = [[
	teste
]]

Application{
	key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "teste.tview",
	description = description,
	base = "roadmap",
	zoom = 8.3,
	template = {navbar = "darkblue", title = "white"},
	display = false,

	-- trajectory = View{
	-- 	description = "Trajeto percorrido de carro durante o trabalho de campo",
	-- 	width = 2,
	-- 	border = "blue",
	-- 	icon = {
	-- 		time = 100
	-- 	}
	-- },
	
	points = View{
		description = "Localidades visitadas",
		select = "Nome",
		icon = "flag",
		label = "ponto de coleta",

		report = function(cell)
			local mreport = Report{
				title = cell.Nome,  -- "name" is an attribute of object
				author = "NEXUS"
			}

		-- 	local text = ""
		-- 	if cell.fid == 52 then
		-- 		text = "<b/>"..cell.Ponto.."."	
		-- 	else
		-- 		text = "Ponto: <b>"..cell.Ponto.."</b><br><br>Tipo de solo: <b>"..cell.Tipo_solo.."</b><br>Coleta do solo: <b>"..cell.Coleta_Sol.."</b><br>Degradado: <b>"..cell.Degradado.."</b>"
		-- 	end
						
		
		-- mreport:addText(text)
		mreport:addImage("photos/"..cell.img01..".jpg")
    mreport:addImage("photos/"..cell.img02..".jpg")

			return mreport
		end
	}
}

