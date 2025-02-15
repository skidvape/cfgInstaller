local cfg = 'Sunlight'; -- Sunlight is the only option now lolz
local url = 'https://github.com/sstvskids/configInstaller/tree/main/Sunlight';

for _, folder in {'newvape', 'newvape/games', 'newvape/profiles', 'newvape/assets', 'newvape/libraries', 'newvape/guis'} do
	if not isfolder(folder) then
		makefolder(folder); -- required if you don't have the folders
	end;
end;

local suc, res = pcall(function()
    for i,v in pairs(url) do
        print(v);
    end
end);