if not getgenv().cfg then return nil end

local scriptapi: string = loadstring(game:HttpGet('https://raw.githubusercontent.com/skidvape/cfgInstaller/refs/heads/main/libs/api.luau'))()
local script: scriptapi = scriptapi.identifyscript()
local getfolder: scriptapi = scriptapi.getfolder()
local getscript: scriptapi = scriptapi.getscript()

if string.find(getgenv().cfg, 'alsploit') then
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
    task.spawn(function()
        for _, v in getscript do
            if not isfile(v.name) then
                writefile(v.name, game:HttpGet(v.url))
            end
        end
    end)
end)
   
if suc then
    getgenv().iconval = 'rbxassetid://10723415903'
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/skidvape/cfgInstaller/refs/heads/main/libs/notif.luau'))()
elseif res and not suc then
    getgenv().iconval = 'rbxassetid://10734951173'
    getgenv().cfgtext = 'Config: '..getgenv().cfg..'\nError: '..res
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/skidvape/cfgInstaller/refs/heads/main/libs/notif.luau'))()
end