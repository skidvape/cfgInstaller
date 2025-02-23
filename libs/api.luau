local scriptapi = {}
local cfg = getgenv().cfg
scriptapi.scripts = {
    night = 'Night',
    moon = 'Moon'
}

scriptapi.identifyscript = function()
    for i,v in pairs(scriptapi.scripts) do
        if string.find(cfg, tostring(i)) then
            return v
        end
    end
    return 'newvape'
end

scriptapi.getfolder = function()
    for i,v in pairs(scriptapi.scripts) do
        if string.find(cfg, tostring(i)) then
            return v..'/Configs/'
        end
    end
    return 'newvape/profiles/'
end

return scriptapi