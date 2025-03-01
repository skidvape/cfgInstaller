if not getgenv().cfg then return nil end

local cfg = getgenv().cfg -- returns the option you picked
local url = 'https://api.github.com/repos/skidvape/cfgInstaller/contents/cfgs/'..cfg
local scriptapi = loadstring(game:HttpGet('https://raw.githubusercontent.com/skidvape/cfgInstaller/refs/heads/main/libs/api.luau'))()
local script = scriptapi.identifyscript()
local getfolder = scriptapi.getfolder()
local getscript = scriptapi.getscript()

if string.find(cfg, 'alsploit') then
    if isfile('AlSploitConfiguration.json') then delfile('AlSploitConfiguration.json') end
else
    for _, v in {script, getfolder} do
        if not isfolder(v) then
            makefolder(v)
        elseif isfolder(getfolder) then
            delfolder(getfolder)
            makefolder(getfolder)
        end
    end
end

local suc, res = pcall(function()
    for _, v in ipairs(getscript) do
        if not isfile(v.name) then
            writefile(v.name, game:HttpGet(v.url)) -- downloads
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