if string.find(getgenv().cfg, 'alsploit') or not getgenv().cfg then return nil end

local cloneref = cloneref or function(v) return v end
local cfg = getgenv().cfg -- returns the option you picked
local url = 'https://api.github.com/repos/skidvape/cfgInstaller/contents/'..cfg

if string.find(getgenv().cfg, 'alsploit') then
    for _, v in {'AlSploit', 'newvape/profiles'} do
        if not isfolder(v) then
            makefolder(v)
        elseif isfolder('AlSploit/??') then
            delfolder('newvape/profiles')
            makefolder('newvape/profiles')
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
    
    for i,v in ipairs(cfgfiles) do
        if string.find(getgenv().cfg, 'alsploit') then
            if not isfile('newvape/profiles/'..v.name) then
                writefile('newvape/profiles/'..v.name, game:HttpGet(v.download_url)) -- downloads
            end
        else
            if not isfile('newvape/profiles/'..v.name) then
                writefile('newvape/profiles/'..v.name, game:HttpGet(v.download_url)) -- downloads
            end
        end
    end
end)

if res and not suc then return warn('Report any issues to @._stav on discord! '..res) end