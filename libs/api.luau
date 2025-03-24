local scriptapi = {}
local cfg = getgenv().cfg
local customcfg = getgenv().customvape
local url = 'https://api.github.com/repos/skidvape/cfgInstaller/contents/cfgs/'..cfg
scriptapi.scripts = {
    night = 'Night',
    moon = 'Moon',
    aurora = 'Aurora',
    flux = 'Flux'
}
scriptapi.vapecustoms = {
    oldvape = 'vape',
    skid = 'skid',
    lunar = 'Lunar Vape'
}

scriptapi.grabscripts = function(path: table)
    local val = {}
    for i,v in pairs(path) do
        table.insert(val, v)
    end
    return val
end

scriptapi.identifyscript = function()
    for i,v in scriptapi.scripts do
        if string.find(cfg, tostring(i)) then
            return v
        end
    end
    if customcfg then
        for i,v in scriptapi.vapecustoms do
            if string.find(customcfg, tostring(i)) then
                return v
            end
        end
    end
    return 'newvape'
end

scriptapi.excludedscripts = function()
    local excluded = {'newvape', 'Aurora'}
    return table.concat(excluded, ',')..','..table.concat(scriptapi.grabscripts(scriptapi.vapecustoms), ',')
end

scriptapi.getfolder = function()
    if not string.find(scriptapi.excludedscripts(), scriptapi.identifyscript()) then
        return scriptapi.identifyscript()..'/Configs/'
    end
    if customcfg then
        if string.find('Lunar Vape', scriptapi.identifyscript()) then
            return scriptapi.identifyscript()..'/Profiles/'
        elseif string.find('Aurora', scriptapi.identifyscript()) then
            return scriptapi.identifyscript()
        end
    end
    return scriptapi.identifyscript()..'/profiles/'
end

scriptapi.getscript = function()
    local cfgurl = game:HttpGet(url)
    local cfgfiles = game:GetService('HttpService'):JSONDecode(cfgurl)
    local script = {}
    for _, v in ipairs(cfgfiles) do
        local scriptpath = scriptapi.getfolder()..v.name
        if string.find(cfg, 'alsploit') then
            scriptpath = v.name
        end
        table.insert(script, {name = scriptpath, url = v.download_url})
    end
    return script
end

return scriptapi