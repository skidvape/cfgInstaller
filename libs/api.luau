local scriptapi = {}
local cfg = getgenv().cfg
local url = 'https://api.github.com/repos/skidvape/cfgInstaller/contents/cfgs/'..cfg
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

scriptapi.getscript = function()
    local cfgurl = game:HttpGet(url)
    local cfgfiles = game:GetService('HttpService'):JSONDecode(cfgurl)
        
    for _, v in ipairs(cfgfiles) do
        if string.find(cfg, 'alsploit') then
            return v.name
        end
        return scriptapi.getfolder()..v.name
    end
end

return scriptapi