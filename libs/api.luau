local scriptapi = {}
local cfg = getgenv().cfg
scriptapi.scripts = {
    night = 'Night',
    moon = 'Moon'
}
scriptapi.vapetypes = {
    oldvape = 'vape',
    'newvape'
}

scriptapi.identifyscript = function()
    for i,v in pairs(scriptapi.scripts) do
        if string.find(cfg, tostring(i)) then
            return v
        end
    end
    for i, v in pairs(scriptapi.vapetypes) do
        if string.find(cfg, tostring(i)) then
            return v or v[1]
        end
    end
end

scriptapi.getfolder = function()
    for i,v in pairs(scriptapi.scripts) do
        if string.find(cfg, tostring(i)) then
            return v..'/Configs/'
        end
    end
    for i, v in pairs(scriptapi.vapetypes) do
        if string.find(cfg, tostring(i)) then
            return v..'/profiles/' or v[1]..'/profiles/'
        end
    end
end

return scriptapi