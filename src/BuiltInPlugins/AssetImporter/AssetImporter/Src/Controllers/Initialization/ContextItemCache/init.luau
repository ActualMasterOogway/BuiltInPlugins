local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
local l_ContextServices_0 = v1.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Store_0 = l_ContextServices_0.Store;
local l_Focus_0 = l_ContextServices_0.Focus;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Controllers_0 = l_script_FirstAncestor_0.Src.Controllers;
local v10 = require(l_Controllers_0.CalloutController);
local v11 = require(l_Controllers_0.PresetController);
local v12 = require(l_Controllers_0.FileController);
local v13 = require(l_Controllers_0.QueueController);
local v14 = require(l_Controllers_0.Networking);
local v15 = require(l_script_FirstAncestor_0.Src.Resources.createAnalyticsHandlers);
local v16 = require(l_script_FirstAncestor_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixGroupFetch);
local v21 = {};
v21.__index = v21;
v21.new = function(v22) --[[ Line: 69 ]] --[[ Name: new ]]
    -- upvalues: l_Localization_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v11 (copy), l_ContextServices_0 (copy), l_Analytics_0 (copy), v15 (copy), l_Focus_0 (copy), l_Mouse_0 (copy), l_Store_0 (copy), v16 (copy), v10 (copy), v12 (copy), v14 (copy), v19 (copy), v13 (copy), v20 (copy), v21 (copy)
    local l_store_0 = v22.store;
    local v24 = v22.environment == "Production";
    local l_plugin_0 = v22.plugin;
    local v26 = if v24 then l_Localization_0.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AssetImporter"
    }) else l_Localization_0.mock();
    local v27 = if v24 then v11.new(l_plugin_0, l_store_0, v26) else v11.mock(l_store_0);
    local v28 = {
        Plugin = l_ContextServices_0.Plugin.new(l_plugin_0), 
        PluginLoaderContextItem = v22.loader, 
        Analytics = if v24 then l_Analytics_0.new(v15) else l_Analytics_0.mock(), 
        Focus = l_Focus_0.new(Instance.new("ScreenGui")), 
        Localization = v26, 
        Mouse = l_Mouse_0.new(l_plugin_0:GetMouse()), 
        Store = l_Store_0.new(l_store_0), 
        Theme = v16(not v24), 
        CalloutController = if v24 then v10.new() else nil, 
        FileController = if v24 then v12.new(l_store_0, v27) else v12.mock(l_store_0, v27), 
        PresetController = v27, 
        Networking = v14.new(l_store_0, not v24)
    };
    if v19() then
        v28.QueueController = if v24 then v13.new(l_store_0) else v13.mock(l_store_0);
    end;
    if v20() then
        v28.Networking = v14.new(l_store_0, not v24);
    end;
    return (setmetatable(v28, v21));
end;
v21.getItemsAsList = function(v29) --[[ Line: 116 ]] --[[ Name: getItemsAsList ]]
    return {
        v29.Plugin, 
        v29.PluginLoaderContextItem, 
        v29.Analytics, 
        v29.Localization, 
        v29.Mouse, 
        v29.Focus, 
        v29.Store, 
        v29.Theme, 
        v29.CalloutController, 
        v29.FileController, 
        v29.PresetController, 
        v29.QueueController, 
        v29.Networking
    };
end;
v21.destroy = function(v30) --[[ Line: 134 ]] --[[ Name: destroy ]]
    if v30.Analytics then
        v30.Analytics:destroy();
    end;
    if v30.Localization then
        v30.Localization:destroy();
    end;
    if v30.Store then
        v30.Store:destroy();
    end;
    if v30.CalloutController then
        v30.CalloutController:destroy();
    end;
    if v30.FileController then
        v30.FileController:destroy();
    end;
    if v30.PresetController then
        v30.PresetController:destroy();
    end;
    if v30.QueueController then
        v30.QueueController:destroy();
    end;
end;
return v21;