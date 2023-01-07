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
        select = {"nome", "ponto"},
        icon = {"yellow_home", "green_home"},
        label = {"point1", "point2"},

        report = function(cell)
            local mreport = Report{
                title = cell.name,  -- "name" is an attribute of object
                author = "NEXUS"
            }
                
                mreport:addImage("photos/"..cell.name..".jpg")

            return mreport
        end
    }
}