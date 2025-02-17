if not getgenv().iconval then return nil end

local cloneref = cloneref or function(v) return v end
local StarterGui = cloneref(game:GetService('StarterGui'))

StarterGui:SetCore('SendNotification', {
    Title = 'cfgInstaller',
    Text = getgenv().cfgtext or getgenv().cfg..' has installed successfully!',
    Duration = 4,
    Icon = getgenv().iconval
})