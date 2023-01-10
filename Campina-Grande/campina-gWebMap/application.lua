import("publish")

local description = [[
	Campina Grande
]]

Application{
    project = "campina-g.tview",
    description = "Small application with some data related to Campina Grande.",
	base = "roadmap",
    zoom = 7,
	template = {navbar = "darkblue", title = "white"},
    display = false,

    trajectory = View{
        description = "trajetos Campina Grande, from Comunicação",
        width = 2,
        border = "blue",
        icon = {
            time = 100
            }
    },

    points = View{
        missing = 1,
        description = "Campina grande",
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