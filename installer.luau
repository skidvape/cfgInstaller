local cloneref = cloneref or function(v) return v end
local cfg = shared.cfg -- returns the option you picked
local url = 'https://api.github.com/repos/skidvape/cfgInstaller/contents/'..cfg

for _, folder in {'newvape', 'newvape/games', 'newvape/profiles', 'newvape/assets', 'newvape/libraries', 'newvape/guis'} do
	if not isfolder(folder) then
		makefolder(folder) -- required if you don't have the folders
	end
end

local suc, res = pcall(function()
    local cfgurl = game:HttpGet(url)
    local cfgfiles = game:GetService('HttpService'):JSONDecode(cfgurl)
    
    for i,v in ipairs(cfgfiles) do
        if not isfile('newvape/profiles/'..v.name) then
            writefile('newvape/profiles/'..v.name, game:HttpGet(v.download_url)) -- downloads
        else
            delfile('newvape/profiles/'..v.name) -- deletes the profiles if you have them already
            writefile('newvape/profiles/'..v.name, game:HttpGet(v.download_url)) -- downloads
        end
    end
end)

if res and not suc then return warn(res) end