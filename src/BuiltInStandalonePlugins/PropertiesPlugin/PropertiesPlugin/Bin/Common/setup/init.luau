local l_script_FirstAncestor_0 = script:FindFirstAncestor("PropertiesPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
return function(v4, v5) --[[ Line: 17 ]] --[[ Name: setup ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), l_LocalizedStrings_0 (copy), l_SourceStrings_0 (copy), v1 (copy)
    v4.Name = l_script_FirstAncestor_0.Name;
    local v12 = {
        getName = function(_, _, _) --[[ Line: 22 ]] --[[ Name: getName ]]
            return "PropertiesPluginButton";
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
        pluginName = "PropertiesPlugin", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        getToolbarName = function(_, _, _) --[[ Line: 46 ]] --[[ Name: getToolbarName ]]
            return "PropertiesPluginToolbar";
        end, 
        buttonInfo = v12
    };
    v12.enabled = true;
    v16.dockWidgetInfo = {
        id = "PropertiesPlugin", 
        dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Right, false, false, 640, 480, 250, 200), 
        getDockTitle = function(v17, v18, v19) --[[ Line: 64 ]] --[[ Name: getDockTitle ]]
            return v17(v18, v19, "Plugin", "Name");
        end, 
        zIndexBehavior = Enum.ZIndexBehavior.Sibling
    };
    local v20 = v1.build(v16);
    if not v20.pluginLoader:waitForUserInteraction() then
        return;
    else
        v5(v4, v20);
        return;
    end;
end;