import("publish")

local description = [[
	Esta aplicação apresenta um trabalho de campo para coletar amostragens de solos em <b>novembro de 2021</b>. Estas amostrar irão integrar o mapa de isótopos de Nitrogênio 15 (N15) do solo do Brasil.</br> A isoscape de N15 foi publicada por ]]..link("https://doi.org/10.1002/ecs2.3223","Sena-Souza et al. (2019).").. [[</br>Trabalho de campo realizado pelos pesquisadores <b>Marcela Miranda</b> e <b>Felipe Pacheco</b>.
	]]


Application{
	key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "N15.tview",
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
		mreport:addImage("photos/"..cell.img01..".png")
    mreport:addImage("photos/"..cell.img02..".png")

			return mreport
		end
	}
}

