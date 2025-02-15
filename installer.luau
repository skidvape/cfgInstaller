local cloneref = cloneref or function(v) return v; end;
local cfg = 'Sunlight'; -- Sunlight is the only option now lolz
local url = 'https://api.github.com/repos/skidvape/configInstaller/contents/Sunlight';

for _, folder in {'newvape', 'newvape/games', 'newvape/profiles', 'newvape/assets', 'newvape/libraries', 'newvape/guis'} do
	if not isfolder(folder) then
		makefolder(folder); -- required if you don't have the folders
	end;
end;

local suc, res = pcall(function()
    local cfgfiles = game:GetService('HttpService'):JSONDecode(url);
    for i,v in ipairs(cfgfiles) do
        writefile(v);
    end;
end);

if res and not suc then return warn(res); end;