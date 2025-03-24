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
    for _,v in path do
        return v
    end
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

scriptapi.getfolder = function()
    if scriptapi.identifyscript() ~= ('newvape' or 'Aurora' or scriptapi.grabscripts(scriptapi.vapecustoms)) then
        return scriptapi.identifyscript()..'/Configs/'
    end
    if customcfg then
        if string.find('Lunar Vape', scriptapi.grabscripts(scriptapi.vapecustoms)) then
            return scriptapi.identifyscript()..'/Profiles/'
        elseif string.find('Aurora', scriptapi.grabscripts(scriptapi.scripts)) then
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