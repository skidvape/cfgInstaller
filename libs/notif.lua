if not getgenv().iconval then return nil end
local cloneref = cloneref or function(v) return v end

local suc, res = pcall(function()
    cloneref(game:GetService('StarterGui')):SetCore('SendNotification', {
        Title = 'cfgInstaller',
        Text = getgenv().cfgtext or getgenv().cfg..' has installed successfully!',
        Duration = 20,
        Icon = getgenv().iconval
    })
end)

if res then warn(getgenv().cfgtext or getgenv().cfg..' has installed successfully!', res) end