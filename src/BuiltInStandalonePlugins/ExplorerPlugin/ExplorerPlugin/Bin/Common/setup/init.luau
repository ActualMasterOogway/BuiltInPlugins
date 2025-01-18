local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
return function(v4, v5) --[[ Line: 17 ]] --[[ Name: setup ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), l_LocalizedStrings_0 (copy), l_SourceStrings_0 (copy), v1 (copy)
    v4.Name = l_script_FirstAncestor_0.Name;
    local v12 = {
        getName = function(_, _, _) --[[ Line: 22 ]] --[[ Name: getName ]]
            return "ExplorerPluginButton";
        end, 
        getDescription = function(v9, v10, v11) --[[ Line: 29 ]] --[[ Name: getDescription ]]
            return v9(v10, v11, "Plugin", "Description");
        end, 
        icon = "", 
        enabled = false, 
        clickableWhenViewportHidden = true
    };
    local v16 = {
        plugin = v4, 
        pluginName = "ExplorerPlugin", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        getToolbarName = function(_, _, _) --[[ Line: 46 ]] --[[ Name: getToolbarName ]]
            return "ExplorerPluginToolbar";
        end, 
        buttonInfo = v12
    };
    v12.enabled = true;
    v16.dockWidgetInfo = {
        id = "ExplorerPlugin", 
        dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Right, true, false, 640, 480, 250, 200), 
        getDockTitle = function(v17, v18, v19) --[[ Line: 64 ]] --[[ Name: getDockTitle ]]
            return v17(v18, v19, "Plugin", "Title");
        end, 
        zIndexBehavior = Enum.ZIndexBehavior.Sibling
    };
    local v20 = nil;
    local function v22() --[[ Line: 72 ]] --[[ Name: load ]]
        -- upvalues: v1 (ref), v16 (copy), v20 (ref), v5 (copy), v4 (copy)
        local v21 = v1.build(v16);
        if not v21.pluginLoader:waitForUserInteraction() then
            return;
        else
            v20:Disconnect();
            v5(v4, v21);
            return;
        end;
    end;
    local l_v4_PluginComponent_0 = v4:GetPluginComponent("PlaceManager");
    v20 = l_v4_PluginComponent_0.PlaceDocPanelShown:Connect(v22);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 86 ]]
        -- upvalues: l_v4_PluginComponent_0 (copy)
        return l_v4_PluginComponent_0:IsPlaceDocumentOpen();
    end);
    if l_status_0 and l_result_0 then
        local v26 = v1.build(v16);
        if v26.pluginLoader:waitForUserInteraction() then
            v20:Disconnect();
            v5(v4, v26);
        end;
    end;
end;