require(script.Parent.defineLuaFlags);
require(script.Parent.runTests)();
if not game:GetFastFlag("EnableStyleEditor") then
    return;
else
    local l_GuiService_0 = game:GetService("GuiService");
    local l_Parent_0 = script.Parent.Parent;
    local v2 = require(script.Parent.main);
    local v3 = game:DefineFastFlag("StyleEditorUITab", false);
    plugin.Name = l_Parent_0.Name;
    local v4 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
    local v13 = {
        getName = function(v7, v8, v9) --[[ Line: 32 ]] --[[ Name: getName ]]
            -- upvalues: v3 (copy)
            if v3 then
                return "StyleEditorToolbarButton";
            else
                return (v7(v8, v9, "Plugin", "Button"));
            end;
        end, 
        getDescription = function(v10, v11, v12) --[[ Line: 37 ]] --[[ Name: getDescription ]]
            return v10(v11, v12, "Plugin", "Description");
        end, 
        icon = "rbxlocaltheme://StyleEditor", 
        enabled = false
    };
    local v17 = {
        plugin = plugin, 
        pluginName = "StyleEditor", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        getToolbarName = function(v14, v15, v16) --[[ Line: 50 ]] --[[ Name: getToolbarName ]]
            -- upvalues: v3 (copy)
            if v3 then
                return "StyleEditor";
            else
                return (v14(v15, v16, "Plugin", "Toolbar"));
            end;
        end, 
        buttonInfo = v13, 
        extraTriggers = {
            ["GuiService.OpenStyleEditor"] = function() --[[ Line: 57 ]]
                -- upvalues: l_GuiService_0 (copy)
                return l_GuiService_0.OpenStyleEditor;
            end
        }
    };
    if game:GetService("RunService"):IsEdit() then
        v13.enabled = true;
        v17.dockWidgetInfo = {
            id = "StyleEditor", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Right, false, false, 580, 500, 250, 200), 
            getDockTitle = function(v18, v19, v20) --[[ Line: 78 ]] --[[ Name: getDockTitle ]]
                return v18(v19, v20, "Plugin", "Name");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        };
        local v21 = v4.build(v17);
        if not v21.pluginLoader:waitForUserInteraction() then
            return;
        else
            v2(plugin, v21);
            return;
        end;
    else
        v4.build(v17);
        return;
    end;
end;