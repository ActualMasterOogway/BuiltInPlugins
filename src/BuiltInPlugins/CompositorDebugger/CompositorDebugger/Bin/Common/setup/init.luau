local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
return function(v4, v5) --[[ Line: 13 ]] --[[ Name: setup ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), l_LocalizedStrings_0 (copy), l_SourceStrings_0 (copy), v1 (copy)
    v4.Name = l_script_FirstAncestor_0.Name;
    local v12 = {
        getName = function(_, _, _) --[[ Line: 18 ]] --[[ Name: getName ]]
            return "CompositorDebuggerButton";
        end, 
        getDescription = function(v9, v10, v11) --[[ Line: 25 ]] --[[ Name: getDescription ]]
            return v9(v10, v11, "Plugin", "Description");
        end, 
        icon = "rbxlocaltheme://CompositorDebugger", 
        enabled = true
    };
    local v19 = {
        plugin = v4, 
        pluginName = "CompositorDebugger", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        getToolbarName = function(_, _, _) --[[ Line: 41 ]] --[[ Name: getToolbarName ]]
            return "Animations";
        end, 
        buttonInfo = v12, 
        dockWidgetInfo = {
            id = "CompositorDebugger", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, false, 640, 480, 250, 200), 
            getDockTitle = function(v16, v17, v18) --[[ Line: 60 ]] --[[ Name: getDockTitle ]]
                return v16(v17, v18, "Plugin", "Name");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        }
    };
    local v20 = v1.build(v19);
    if not v20.pluginLoader:waitForUserInteraction() then
        return;
    else
        v5(v4, v20);
        return;
    end;
end;