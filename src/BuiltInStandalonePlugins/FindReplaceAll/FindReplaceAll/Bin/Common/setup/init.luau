local l_script_FirstAncestor_0 = script:FindFirstAncestor("FindReplaceAll");
local v1 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v4 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
return function(v5, v6) --[[ Line: 15 ]] --[[ Name: setup ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), l_LocalizedStrings_0 (copy), l_SourceStrings_0 (copy), v4 (copy), v1 (copy)
    v5.Name = l_script_FirstAncestor_0.Name;
    local v13 = {
        getName = function(v7, v8, v9) --[[ Line: 20 ]] --[[ Name: getName ]]
            return v7(v8, v9, "Plugin", "Button");
        end, 
        getDescription = function(v10, v11, v12) --[[ Line: 27 ]] --[[ Name: getDescription ]]
            return v10(v11, v12, "Plugin", "Description");
        end, 
        icon = "rbxlocaltheme://GameSettings", 
        enabled = false
    };
    local v17 = {
        plugin = v5, 
        pluginName = "FindReplaceAll", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        getToolbarName = function(v14, v15, v16) --[[ Line: 43 ]] --[[ Name: getToolbarName ]]
            return v14(v15, v16, "Plugin", "Toolbar");
        end, 
        buttonInfo = v13
    };
    local l_RunService_0 = game:GetService("RunService");
    local v19 = v4.get() == v4.Standalone;
    local v20 = l_RunService_0:IsEdit();
    if v19 or v20 then
        v13.enabled = true;
        v17.dockWidgetInfo = {
            id = "FindReplaceAll", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, false, 640, 480, 250, 200), 
            getDockTitle = function(v21, v22, v23) --[[ Line: 68 ]] --[[ Name: getDockTitle ]]
                return v21(v22, v23, "Plugin", "Name");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        };
        local v24 = v1.build(v17);
        if not v24.pluginLoader:waitForUserInteraction() then
            return;
        else
            v6(v5, v24);
            return;
        end;
    else
        v1.build(v17);
        return;
    end;
end;