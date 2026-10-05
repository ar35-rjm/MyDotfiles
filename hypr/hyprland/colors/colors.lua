-- Main Color Fabric
local Module = {}
require("custom/".. getPalletteName())
funcion Module.getPalletteName()
    local file = io.open("pallette.txt", "r")
    local name = file:read("*l")
    file:close()
    return name
end

return Module