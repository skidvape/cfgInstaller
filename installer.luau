if not getgenv().cfg then return nil end

local cfg = getgenv().cfg -- returns the option you picked
local url = 'https://api.github.com/repos/skidvape/cfgInstaller/contents/cfgs/'..cfg
local scriptapi = loadstring(game:HttpGet('https://raw.githubusercontent.com/skidvape/cfgInstaller/refs/heads/main/libs/api.luau'))()
local script = scriptapi.identifyscript()

if string.find(cfg, 'alsploit') then
    if isfile('AlSploitConfiguration.json') then delfile('AlSploitConfiguration.json') end
elseif string.find(cfg, 'moon' or 'night') then
    for _, v in {script, script..'/Configs'} do
        if not isfolder(v) then
            makefolder(v)
        elseif isfolder(script..'/Configs') then
            delfolder(script..'/Configs')
            makefolder(script..'/Configs')
        end
    end
else
    for _, v in {'newvape', 'newvape/profiles'} do
        if not isfolder(v) then
            makefolder(v)
        elseif isfolder('newvape/profiles') then
            delfolder('newvape/profiles')
            makefolder('newvape/profiles')
        end
    end
end

local suc, res = pcall(function()
    local cfgurl = game:HttpGet(url)
    local cfgfiles = game:GetService('HttpService'):JSONDecode(cfgurl)
    
    for _, v in ipairs(cfgfiles) do
        if string.find(cfg, 'alsploit') then
            if not isfile(v.name) then
                writefile(v.name, game:HttpGet(v.download_url)) -- downloads
            end
        elseif string.find(cfg, 'moon' or 'night') then
            if not isfile(script..'/Configs'..v.name) then
                writefile(script..'/Configs'..v.name, game:HttpGet(v.download_url)) -- downloads
            end
        else
            if not isfile('newvape/profiles/'..v.name) then
                writefile('newvape/profiles/'..v.name, game:HttpGet(v.download_url)) -- downloads
            end
        end
    end
end)
   
if suc then
    getgenv().iconval = 'rbxassetid://10723415903'
    loadstring(game:HttpGet('https://raw.githubusercontent.com/skidvape/cfgInstaller/refs/heads/main/libs/notif.luau'))()
elseif res and not suc then
    getgenv().iconval = 'rbxassetid://10734951173'
    getgenv().cfgtext = 'Config: '..cfg..'\nError: '..res
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/skidvape/cfgInstaller/refs/heads/main/libs/notif.luau'))()
end