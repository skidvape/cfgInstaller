local scriptapi = {}
local cfg = getgenv().cfg
local scripts = {
    night = 'Night',
    moon = 'Moon'
}

scriptapi.identifyscript = function()
    for i,v in pairs(scripts) do
        if string.find(cfg, v) then
            return i
        end
    end
end

return scriptapi