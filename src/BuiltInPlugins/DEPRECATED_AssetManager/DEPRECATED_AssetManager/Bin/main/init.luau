return function(v0, v1) --[[ Line: 4 ]]
    if not v0 then
        return;
    else
        require(script.Parent.commonInit)();
        local l_ImprovePluginSpeed_AssetManager_0 = game:GetFastFlag("ImprovePluginSpeed_AssetManager");
        if not l_ImprovePluginSpeed_AssetManager_0 then
            require(script.Parent.defineLuaFlags);
        end;
        local l_StudioAssetManagerAddRecentlyImportedView_0 = game:GetFastFlag("StudioAssetManagerAddRecentlyImportedView");
        local l_AssetManagerService_0 = game:GetService("AssetManagerService");
        local l_BulkImportService_0 = game:GetService("BulkImportService");
        local l_StudioPublishService_0 = game:GetService("StudioPublishService");
        local l_Parent_0 = script.Parent.Parent;
        local v8 = require(l_Parent_0.Packages.Roact);
        local v9 = require(l_Parent_0.Packages.Rodux);
        local v10 = require(l_Parent_0.Packages.Cryo);
        local v11 = require(l_Parent_0.Packages.Framework);
        local v12 = require(l_Parent_0.Packages.InsertAsset);
        local l_ContextServices_0 = v11.ContextServices;
        local v14 = require(l_Parent_0.Src.Components.ServiceWrapper);
        local l_InsertAssetContext_0 = v12.Context.InsertAssetContext;
        local v16 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v17 = require(l_Parent_0.Src.Middleware.MainMiddleware);
        local v18 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
        local v21 = require(l_Parent_0.Src.Components.MainView);
        local v22 = require(l_Parent_0.Src.Util.AssetManagerUtilities);
        local l_enableAudioImport_0 = v22.enableAudioImport;
        local l_enableVideoImport_0 = v22.enableVideoImport;
        local l_enableBadgesCallout_0 = v22.enableBadgesCallout;
        local v26 = require(l_Parent_0.Src.Actions.SetBulkImporterRunning);
        local v27 = require(l_Parent_0.Src.Actions.SetRecentAssets);
        local v28 = require(l_Parent_0.Src.Actions.SetRecentViewToggled);
        local v29 = require(l_Parent_0.Src.Actions.SetUniverseName);
        local v30 = v9.Store.new(v16, {}, v17);
        local v31 = require(l_Parent_0.Src.Resources.Theme)();
        local v32 = l_ContextServices_0.Analytics.new(v18);
        local v33 = l_ContextServices_0.Localization.new({
            pluginName = "AssetManager", 
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            libraries = {
                [v11.Resources.LOCALIZATION_PROJECT_NAME] = {
                    stringResourceTable = v11.Resources.SourceStrings, 
                    translationResourceTable = v11.Resources.LocalizedStrings
                }
            }
        });
        local v34 = nil;
        if l_enableBadgesCallout_0() then
            v34 = require(l_Parent_0.Src.Util.CalloutController).new();
            v34:defineCallout("AssetManagerBadgesDevProductCallout", "", v33:getText("Callout", "BadgesDevProductsDescription"), "");
        end;
        local v35 = nil;
        local v36 = nil;
        local v37 = 1;
        local v38 = {};
        local function v40() --[[ Line: 105 ]] --[[ Name: openPluginWindow ]]
            -- upvalues: v35 (ref), v8 (copy), v14 (copy), v0 (copy), v32 (copy), v36 (ref), v33 (copy), v31 (copy), v30 (copy), v34 (ref), l_InsertAssetContext_0 (copy), v21 (copy)
            if v35 then
                warn("Plugin handle already exists");
                return;
            else
                local v39 = v8.createElement(v14, {
                    plugin = v0, 
                    analytics = v32, 
                    focusGui = v36, 
                    localization = v33, 
                    theme = v31, 
                    store = v30, 
                    mouse = v0:getMouse(), 
                    calloutController = v34, 
                    insertAsset = l_InsertAssetContext_0.new(v0, v36)
                }, {
                    MainView = v8.createElement(v21, {})
                });
                v35 = v8.mount(v39, v36);
                return;
            end;
        end;
        local function _() --[[ Line: 130 ]] --[[ Name: closePluginWindow ]]
            -- upvalues: v35 (ref), v8 (copy)
            if v35 then
                v8.unmount(v35);
                v35 = nil;
            end;
        end;
        local function v42() --[[ Line: 137 ]] --[[ Name: toggleWidget ]]
            -- upvalues: v36 (ref)
            v36.Enabled = not v36.Enabled;
        end;
        local function v45() --[[ Line: 141 ]] --[[ Name: onPluginUnloading ]]
            -- upvalues: l_ImprovePluginSpeed_AssetManager_0 (copy), v38 (copy), v35 (ref), v8 (copy)
            if not l_ImprovePluginSpeed_AssetManager_0 then
                for _, v44 in ipairs(v38) do
                    v44:disconnect();
                end;
            end;
            if v35 then
                v8.unmount(v35);
                v35 = nil;
            end;
        end;
        local function v46() --[[ Line: 152 ]] --[[ Name: onImportSessionStarted ]]
            -- upvalues: l_StudioAssetManagerAddRecentlyImportedView_0 (copy), v30 (copy), v27 (copy), v37 (ref)
            if l_StudioAssetManagerAddRecentlyImportedView_0 then
                v30:dispatch(v27({}));
            end;
            v37 = 1;
        end;
        local function v48() --[[ Line: 159 ]] --[[ Name: onImportSessionFinished ]]
            -- upvalues: v30 (copy), v28 (copy)
            local v47 = v30:getState();
            if next(v47.AssetManagerReducer.recentAssets) ~= nil then
                v30:dispatch(v28(true));
            end;
        end;
        local v49 = {
            [Enum.AssetType.Image] = "Images/", 
            [Enum.AssetType.MeshPart] = "Meshes/", 
            [Enum.AssetType.Audio] = "Audio/", 
            [Enum.AssetType.Video] = "Video/", 
            [Enum.AssetType.Model] = "Models/"
        };
        local function _(v50, v51) --[[ Line: 174 ]] --[[ Name: stripNamePrefix ]]
            -- upvalues: v49 (copy)
            return v49[v50] and string.gsub(v51, v49[v50], "") or v51;
        end;
        local function v60(v53, v54, v55) --[[ Line: 178 ]] --[[ Name: addRecentAsset ]]
            -- upvalues: v30 (copy), v49 (copy), v10 (copy), v37 (ref), v27 (copy)
            local v56 = v30:getState();
            local v57 = v49[v53] and string.gsub(v54, v49[v53], "") or v54;
            local v58 = tostring(v55);
            local v59 = v10.Dictionary.join(v56.AssetManagerReducer.recentAssets, {
                [v58] = {
                    key = v37, 
                    assetType = v53, 
                    name = v57, 
                    id = v55
                }
            });
            v37 = v37 + 1;
            v30:dispatch(v27(v59));
        end;
        local function v73() --[[ Line: 196 ]] --[[ Name: connectBulkImporterSignals ]]
            -- upvalues: v30 (copy), v26 (copy), l_StudioAssetManagerAddRecentlyImportedView_0 (copy), v27 (copy), v37 (ref), l_ImprovePluginSpeed_AssetManager_0 (copy), v1 (copy), l_BulkImportService_0 (copy), v28 (copy), l_enableAudioImport_0 (copy), l_enableVideoImport_0 (copy), v10 (copy)
            local function v61() --[[ Line: 197 ]] --[[ Name: onBulkImportStarted ]]
                -- upvalues: v30 (ref), v26 (ref), l_StudioAssetManagerAddRecentlyImportedView_0 (ref), v27 (ref), v37 (ref)
                v30:dispatch(v26(true));
                if l_StudioAssetManagerAddRecentlyImportedView_0 then
                    v30:dispatch(v27({}));
                end;
                v37 = 1;
            end;
            if l_ImprovePluginSpeed_AssetManager_0 then
                v1.signals["BulkImportService.BulkImportStarted"]:Connect(v61);
            else
                l_BulkImportService_0.BulkImportStarted:connect(v61);
            end;
            local function v64(_) --[[ Line: 209 ]] --[[ Name: onBulkImportFinished ]]
                -- upvalues: v30 (ref), v26 (ref), l_StudioAssetManagerAddRecentlyImportedView_0 (ref), v28 (ref)
                v30:dispatch(v26(false));
                if l_StudioAssetManagerAddRecentlyImportedView_0 then
                    local v63 = v30:getState();
                    if next(v63.AssetManagerReducer.recentAssets) ~= nil then
                        v30:dispatch(v28(true));
                    end;
                end;
            end;
            if l_ImprovePluginSpeed_AssetManager_0 then
                v1.signals["BulkImportService.BulkImportFinished"]:Connect(v64);
            else
                l_BulkImportService_0.BulkImportFinished:connect(v64);
            end;
            if l_StudioAssetManagerAddRecentlyImportedView_0 then
                local function v72(v65, v66, v67) --[[ Line: 224 ]] --[[ Name: onAssetImported ]]
                    -- upvalues: v30 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref), v10 (ref), v37 (ref), v27 (ref)
                    local v68 = v30:getState();
                    local v69 = nil;
                    if v65 == Enum.AssetType.Image and string.find(v66, "Images/") then
                        v69 = string.gsub(v66, "Images/", "");
                    elseif v65 == Enum.AssetType.MeshPart and string.find(v66, "Meshes/") then
                        v69 = string.gsub(v66, "Meshes/", "");
                    elseif l_enableAudioImport_0() and v65 == Enum.AssetType.Audio and string.find(v66, "Audio/") then
                        v69 = string.gsub(v66, "Audio/", "");
                    elseif l_enableVideoImport_0() and v65 == Enum.AssetType.Video and string.find(v66, "Video/") then
                        v69 = string.gsub(v66, "Video/", "");
                    elseif v65 == Enum.AssetType.Model and string.find(v66, "Models/") then
                        v69 = string.gsub(v66, "Models/", "");
                    end;
                    local v70 = tostring(v67);
                    local v71 = v10.Dictionary.join(v68.AssetManagerReducer.recentAssets, {
                        [v70] = {
                            key = v37, 
                            assetType = v65, 
                            name = v69, 
                            id = v67
                        }
                    });
                    v37 = v37 + 1;
                    v30:dispatch(v27(v71));
                end;
                if l_ImprovePluginSpeed_AssetManager_0 then
                    v1.signals["BulkImportService.AssetImported"]:Connect(v72);
                    return;
                else
                    l_BulkImportService_0.AssetImported:connect(v72);
                end;
            end;
        end;
        (function() --[[ Line: 259 ]] --[[ Name: main ]]
            -- upvalues: v0 (copy), l_ImprovePluginSpeed_AssetManager_0 (copy), v1 (copy), v33 (copy), v36 (ref), v40 (copy), v35 (ref), v8 (copy), v42 (copy), v45 (copy), v73 (copy), v30 (copy), v29 (copy), l_StudioPublishService_0 (copy), v60 (copy), v46 (copy), v48 (copy), l_AssetManagerService_0 (copy), v38 (copy)
            v0.Name = "AssetManager";
            local v74 = nil;
            v74 = if l_ImprovePluginSpeed_AssetManager_0 then v1.mainButton else v0:CreateToolbar("assetManagerToolbar"):CreateButton("assetManagerToolButton", v33:getText("Main", "Tooltip"), "rbxlocaltheme://AssetManager", v33:getText("Main", "ToolbarButton"));
            local function v75() --[[ Line: 277 ]] --[[ Name: showIfEnabled ]]
                -- upvalues: v36 (ref), v40 (ref), v35 (ref), v8 (ref), v74 (ref)
                if v36.Enabled then
                    v40();
                elseif v35 then
                    v8.unmount(v35);
                    v35 = nil;
                end;
                v74:SetActive(v36.Enabled);
            end;
            if l_ImprovePluginSpeed_AssetManager_0 then
                v36 = v1.mainDockWidget;
            else
                local l_EnableAssetManagerSortButton_0 = game:GetFastFlag("EnableAssetManagerSortButton");
                local v77 = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, l_EnableAssetManagerSortButton_0 and 350 or 300, 600, l_EnableAssetManagerSortButton_0 and 350 or 270, 256);
                v36 = v0:CreateDockWidgetPluginGui("AssetManager_PluginGui", v77);
                v36.Name = v33:getText("Meta", "PluginName");
                v36.Title = v33:getText("Main", "Title");
                v36.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            end;
            if l_ImprovePluginSpeed_AssetManager_0 then
                v1.mainButtonClickedSignal:Connect(v42);
            else
                v74.Click:connect(v42);
                v74.ClickableWhenViewportHidden = true;
            end;
            v36:GetPropertyChangedSignal("Enabled"):connect(v75);
            if v36.Enabled then
                v40();
            elseif v35 then
                v8.unmount(v35);
                v35 = nil;
            end;
            local l_Enabled_0 = v36.Enabled;
            v74:SetActive(l_Enabled_0);
            v0.Unloading:Connect(v45);
            v73();
            local function v80(v79) --[[ Line: 328 ]] --[[ Name: onGameNameUpdated ]]
                -- upvalues: v30 (ref), v29 (ref)
                v30:dispatch(v29(v79));
            end;
            if l_ImprovePluginSpeed_AssetManager_0 then
                v1.signals["StudioPublishService.GameNameUpdated"]:Connect(v80);
            else
                l_StudioPublishService_0.GameNameUpdated:connect(v80);
            end;
            if l_ImprovePluginSpeed_AssetManager_0 then
                v1.signals["AssetManagerService.AssetImportedSignal"]:Connect(v60);
                v1.signals["AssetManagerService.ImportSessionStarted"]:Connect(v46);
                v1.signals["AssetManagerService.ImportSessionFinished"]:Connect(v48);
            else
                local v81 = l_AssetManagerService_0.AssetImportedSignal:Connect(v60);
                l_Enabled_0 = l_AssetManagerService_0.ImportSessionStarted:Connect(v46);
                local v82 = l_AssetManagerService_0.ImportSessionFinished:Connect(v48);
                table.insert(v38, v81);
                table.insert(v38, l_Enabled_0);
                table.insert(v38, v82);
            end;
        end)();
        return;
    end;
end;