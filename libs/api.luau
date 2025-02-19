local scriptapi = {}
local cfg = getgenv().cfg
local scripts = {
    night = 'Night',
    moon = 'Moon'
}

scriptapi.identifyscript = function()
    for i,v in pairs(scripts) do
        if string.find(cfg, tostring(i)) then
            return v
        end
    end
end

return scriptapi