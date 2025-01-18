local l_StudioService_0 = game:GetService("StudioService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Parent_0 = script.Parent.Parent;
require(l_Parent_0.Bin.defineLuaFlags);
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Src.Util.getPluginGlobals);
local v5 = require(l_Parent_0.Src.Util.showDialog);
local v6 = require(l_Parent_0.Src.Thunks.InstallPluginFromWeb);
local v7 = require(l_Parent_0.Src.Thunks.RefreshPlugins);
local v8 = require(l_Parent_0.Src.Components.ManagementApp);
local v9 = v4(plugin);
local v10 = {};
local function v12(v11) --[[ Line: 18 ]] --[[ Name: installPlugin ]]
    -- upvalues: v9 (copy), v6 (copy), l_StudioService_0 (copy), v5 (copy)
    v9.store:dispatch(v6(l_StudioService_0, v9.api, v9.analytics, v11));
    v5(v11);
end;
(function() --[[ Line: 27 ]] --[[ Name: main ]]
    -- upvalues: v10 (copy), l_StudioService_0 (copy), v12 (copy), v3 (copy), v9 (copy), v7 (copy), l_MarketplaceService_0 (copy), v8 (copy)
    plugin.Name = "PluginInstallation";
    table.insert(v10, l_StudioService_0.OnPluginInstalledFromWeb:Connect(v12));
    local v13 = nil;
    plugin.Unloading:connect(function() --[[ Line: 36 ]]
        -- upvalues: v10 (ref), v13 (ref), v3 (ref)
        for _, v15 in ipairs(v10) do
            v15:Disconnect();
        end;
        if v13 then
            v3.unmount(v13);
        end;
    end);
    table.insert(v10, l_StudioService_0:GetPropertyChangedSignal("InstalledPluginData"):Connect(function() --[[ Line: 47 ]]
        -- upvalues: v9 (ref), v7 (ref), l_MarketplaceService_0 (ref)
        v9.store:dispatch(v7(v9.api, l_MarketplaceService_0));
    end));
    local v16 = v3.createElement(v8, {
        plugin = plugin, 
        store = v9.store, 
        api = v9.api, 
        analytics = v9.analytics
    });
    v13 = v3.mount(v16);
end)();