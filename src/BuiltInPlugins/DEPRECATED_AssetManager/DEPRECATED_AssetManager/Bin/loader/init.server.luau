if not game:GetFastFlag("ImprovePluginSpeed_AssetManager") then
    return;
else
    require(script.Parent.defineLuaFlags);
    local l_EnableAssetManagerSortButton_0 = game:GetFastFlag("EnableAssetManagerSortButton");
    local l_StudioAssetManagerAddRecentlyImportedView_0 = game:GetFastFlag("StudioAssetManagerAddRecentlyImportedView");
    local l_Parent_0 = script.Parent.Parent;
    local v3 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_AssetManagerService_0 = game:GetService("AssetManagerService");
    local l_BulkImportService_0 = game:GetService("BulkImportService");
    local l_StudioPublishService_0 = game:GetService("StudioPublishService");
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
    local v21 = {
        plugin = plugin, 
        pluginName = "AssetManager", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function() --[[ Line: 32 ]] --[[ Name: getToolbarName ]]
            return "assetManagerToolbar";
        end, 
        buttonInfo = {
            getName = function() --[[ Line: 36 ]] --[[ Name: getName ]]
                return "assetManagerToolButton";
            end, 
            getDescription = function(v9, v10, v11) --[[ Line: 39 ]] --[[ Name: getDescription ]]
                return v9(v10, v11, "Main", "Tooltip");
            end, 
            icon = "rbxlocaltheme://AssetManager", 
            text = function(v12, v13, v14) --[[ Line: 43 ]] --[[ Name: text ]]
                return v12(v13, v14, "Main", "ToolbarButton");
            end, 
            clickableWhenViewportHidden = true
        }, 
        dockWidgetInfo = {
            id = "AssetManager_PluginGui", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, l_EnableAssetManagerSortButton_0 and 350 or 300, 600, l_EnableAssetManagerSortButton_0 and 350 or 270, 256), 
            getDockTitle = function(v15, v16, v17) --[[ Line: 60 ]] --[[ Name: getDockTitle ]]
                return v15(v16, v17, "Main", "Title");
            end, 
            name = function(v18, v19, v20) --[[ Line: 63 ]] --[[ Name: name ]]
                return v18(v19, v20, "Meta", "PluginName");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, 
        extraTriggers = {
            ["BulkImportService.BulkImportStarted"] = function() --[[ Line: 69 ]]
                -- upvalues: l_BulkImportService_0 (copy)
                return l_BulkImportService_0.BulkImportStarted;
            end, 
            ["BulkImportService.BulkImportFinished"] = function() --[[ Line: 72 ]]
                -- upvalues: l_BulkImportService_0 (copy)
                return l_BulkImportService_0.BulkImportFinished;
            end, 
            ["BulkImportService.AssetImported"] = l_StudioAssetManagerAddRecentlyImportedView_0 and function() --[[ Line: 76 ]]
                -- upvalues: l_BulkImportService_0 (copy)
                return l_BulkImportService_0.AssetImported;
            end or nil, 
            ["StudioPublishService.GameNameUpdated"] = function() --[[ Line: 80 ]]
                -- upvalues: l_StudioPublishService_0 (copy)
                return l_StudioPublishService_0.GameNameUpdated;
            end, 
            ["AssetManagerService.AssetImportedSignal"] = function() --[[ Line: 83 ]]
                -- upvalues: l_AssetManagerService_0 (copy)
                return l_AssetManagerService_0.AssetImportedSignal;
            end, 
            ["AssetManagerService.ImportSessionStarted"] = function() --[[ Line: 86 ]]
                -- upvalues: l_AssetManagerService_0 (copy)
                return l_AssetManagerService_0.ImportSessionStarted;
            end, 
            ["AssetManagerService.ImportSessionFinished"] = function() --[[ Line: 89 ]]
                -- upvalues: l_AssetManagerService_0 (copy)
                return l_AssetManagerService_0.ImportSessionFinished;
            end
        }
    };
    local v22 = v3.build(v21);
    if not v22.pluginLoader:waitForUserInteraction() then
        return;
    else
        require(script.Parent.main)(plugin, v22);
        return;
    end;
end;