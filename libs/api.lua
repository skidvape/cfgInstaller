if getgenv().customvape ~= nil and string.find(getgenv().cfg, '-') then return getgenv().customvape == nil end

local scriptapi: table = {}
local cfg: string = getgenv().cfg
local customcfg: string = getgenv().customvape
local url: string = 'https://api.github.com/repos/skidvape/cfgInstaller/contents/cfgs/'..cfg

scriptapi.scripts = {
    night = 'Night',
    moon = 'Moon',
    aurora = 'Aurora',
    flux = 'Flux',
    bruise = 'bruise',
    polarisRewrite = 'polaris',
    polaris = 'Polaris'
}
scriptapi.vapecustoms = {
    oldvape = 'vape',
    skid = 'skid',
    lunar = 'Lunar Vape',
    vpp = 'vwpacket', -- voidpastepacket
    rise = 'rise',
    cat = 'newcatvape'
}

scriptapi.grabscripts = function(path: table)
    local val: table = {}
    task.spawn(function()
        for _,v in path do
            table.insert(val, v)
        end
    end)
    return val
end

scriptapi.excludedscripts = function()
    return table.concat({'newvape', 'Aurora', 'Night', 'bruise', 'polaris', 'Polaris'}, ',')..','..table.concat(scriptapi.grabscripts(scriptapi.vapecustoms), ',')
end

scriptapi.identifyscript = function()
    task.spawn(function()
        for i,v in pairs(scriptapi.scripts) do
            if string.find(cfg, tostring(i)) then return v end
        end
        for i,v in pairs(scriptapi.vapecustoms) do
            if customcfg and string.find(customcfg, tostring(i)) then return v end
        end
    end)
    return 'newvape'
end

scriptapi.getfolder = function()
    if not string.find(scriptapi.excludedscripts(), scriptapi.identifyscript()) then
        return scriptapi.identifyscript()..'/Configs/'
    end
    local paths: table = {
        ['Lunar Vape'] = scriptapi.identifyscript()..'/Profiles/',
        ['Aurora'] = scriptapi.identifyscript(),
        ['Polaris'] = scriptapi.identifyscript(),
        ['Night'] = scriptapi.identifyscript()..'/Config/',
        ['bruise'] = scriptapi.identifyscript()..'/core/configs/',
        ['polaris'] = scriptapi.identifyscript()..'/configs/',
    }
    return paths[scriptapi.identifyscript()] or scriptapi.identifyscript()..'/profiles/'
end

scriptapi.getscript = function()
    local script: table = {}
    local suc, res = pcall(function()
        return cloneref(game:GetService('HttpService')):JSONDecode(game:HttpGet(url))
    end)
    if suc then
        for _, v in pairs(res) do
            local scriptpath: string = (string.find(cfg, 'alsploit') and v.name) or scriptapi.getfolder()..v.name
            table.insert(script, {name = scriptpath, url = v.download_url})
        end
    else
        return warn('failed to get url!')
    end
    return script
end

return scriptapi