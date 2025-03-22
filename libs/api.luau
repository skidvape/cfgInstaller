local scriptapi = {}
local cfg = getgenv().cfg
local url = 'https://api.github.com/repos/skidvape/cfgInstaller/contents/cfgs/'..cfg
scriptapi.scripts = {
    night = 'Night',
    moon = 'Moon',
    --aurora = 'Aurora',
    flux = 'Flux'
}

scriptapi.identifyscript = function()
    for i,v in scriptapi.scripts do
        if string.find(cfg, tostring(i)) then
            return v
        end
    end
    if getgenv().customvape == true then return 'Lunar Vape' end
    return 'newvape'
end

scriptapi.getfolder = function()
    if scriptapi.identifyscript() ~= ('newvape' or 'Lunar Vape') then
        return scriptapi.identifyscript()..'/Configs/'
    end
    if getgenv().customvape == true then return 'Lunar Vape/Profiles' end
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