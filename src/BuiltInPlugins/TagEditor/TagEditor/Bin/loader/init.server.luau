if not game:GetFastFlag("ImprovePluginSpeed_TagEditor") then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Src.Util.shouldPluginRun);
    require(script.Parent.defineLuaFlags);
    if not v1() then
        return;
    else
        local v2 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
        local v11 = {
            plugin = plugin, 
            pluginName = "TagEditor", 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            getToolbarName = function() --[[ Line: 25 ]] --[[ Name: getToolbarName ]]
                return "tagEditorToolbar";
            end, 
            buttonInfo = {
                getName = function() --[[ Line: 29 ]] --[[ Name: getName ]]
                    return "TagEditor";
                end, 
                getDescription = function(_, _, _) --[[ Line: 32 ]] --[[ Name: getDescription ]]
                    return "";
                end, 
                icon = "", 
                text = nil, 
                ClickableWhenViewportHidden = true
            }, 
            dockWidgetInfo = {
                id = "TagEditor", 
                dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Right, false, false, 300, 200, 200, 250), 
                getDockTitle = function(v8, v9, v10) --[[ Line: 51 ]] --[[ Name: getDockTitle ]]
                    return v8(v9, v10, "Plugin", "Name");
                end, 
                zIndexBehavior = Enum.ZIndexBehavior.Sibling
            }
        };
        local v12 = v2.build(v11);
        if not v12.pluginLoader:waitForUserInteraction() then
            return;
        else
            require(script.Parent.main)(plugin, v12);
            return;
        end;
    end;
end;