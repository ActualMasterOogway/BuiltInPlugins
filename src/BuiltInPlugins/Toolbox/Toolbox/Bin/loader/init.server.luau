require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dev.TestLoader);
v1.launch("Toolbox", l_Parent_0.Core);
if v1.isCli() then
    return;
else
    local l_AICOChatBot_0 = game:GetFastFlag("AICOChatBot");
    local l_CAPNewUserExperiment_0 = game:GetFastFlag("CAPNewUserExperiment");
    local v4 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local v5 = require(l_Parent_0.Core.Util.Constants);
    local v6 = require(l_Parent_0.Core.Util.Images);
    local v7 = require(l_Parent_0.SharedPluginConstants);
    local l_StudioService_0 = game:GetService("StudioService");
    local l_StudioAssetService_0 = game:GetService("StudioAssetService");
    local l_MemStorageService_0 = game:GetService("MemStorageService");
    local l_ShowSaveToRobloxOnStudioAssetService_0 = game:GetFastFlag("ShowSaveToRobloxOnStudioAssetService");
    local v14 = {
        ["StudioAssetService.OnSaveToRoblox"] = (not not game:GetFastFlag("UnifyModelPackagePublish3") or l_ShowSaveToRobloxOnStudioAssetService_0) and function() --[[ Line: 32 ]]
            -- upvalues: l_StudioAssetService_0 (copy)
            return l_StudioAssetService_0.OnSaveToRoblox;
        end or nil, 
        ["StudioService.OnSaveToRoblox"] = function() --[[ Line: 36 ]]
            -- upvalues: l_StudioService_0 (copy)
            return l_StudioService_0.OnSaveToRoblox;
        end, 
        ["StudioService.OnImportFromRoblox"] = function() --[[ Line: 39 ]]
            -- upvalues: l_StudioService_0 (copy)
            return l_StudioService_0.OnImportFromRoblox;
        end, 
        ["StudioService.OnOpenManagePackagePlugin"] = function() --[[ Line: 42 ]]
            -- upvalues: l_StudioService_0 (copy)
            return l_StudioService_0.OnOpenManagePackagePlugin;
        end, 
        ["StudioService.OnPublishAsPlugin"] = function() --[[ Line: 45 ]]
            -- upvalues: l_StudioService_0 (copy)
            return l_StudioService_0.OnPublishAsPlugin;
        end, 
        ["MemStorageService." .. "OpenAssetConfiguration"] = function() --[[ Line: 48 ]]
            -- upvalues: l_MemStorageService_0 (copy)
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            l_MemStorageService_0:Bind("OpenAssetConfiguration", function(...) --[[ Line: 50 ]]
                -- upvalues: l_BindableEvent_0 (copy)
                l_BindableEvent_0:Fire(...);
            end);
            return l_BindableEvent_0.Event;
        end, 
        ["MemStorageService." .. v7.SHOW_TOOLBOX_PLUGINS_EVENT] = function() --[[ Line: 55 ]]
            -- upvalues: l_MemStorageService_0 (copy), v7 (copy)
            local l_BindableEvent_1 = Instance.new("BindableEvent");
            l_MemStorageService_0:Bind(v7.SHOW_TOOLBOX_PLUGINS_EVENT, function(...) --[[ Line: 57 ]]
                -- upvalues: l_BindableEvent_1 (copy)
                l_BindableEvent_1:Fire(...);
            end);
            return l_BindableEvent_1.Event;
        end
    };
    if l_AICOChatBot_0 or l_CAPNewUserExperiment_0 then
        v14["MemStorageService." .. v7.SHOW_TOOLBOX_OPEN_MODELS_AND_SEARCH_EVENT] = function() --[[ Line: 65 ]]
            -- upvalues: l_MemStorageService_0 (copy), v7 (copy)
            local l_BindableEvent_2 = Instance.new("BindableEvent");
            l_MemStorageService_0:Bind(v7.SHOW_TOOLBOX_OPEN_MODELS_AND_SEARCH_EVENT, function(...) --[[ Line: 67 ]]
                -- upvalues: l_BindableEvent_2 (copy)
                l_BindableEvent_2:Fire(...);
            end);
            return l_BindableEvent_2.Event;
        end;
    end;
    v14["MemStorageService." .. v5.OPEN_MARKETPLACE_VIEW_FOR_ASSET_TYPE] = function(_) --[[ Line: 74 ]]
        -- upvalues: l_MemStorageService_0 (copy), v5 (copy)
        local l_BindableEvent_3 = Instance.new("BindableEvent");
        l_MemStorageService_0:Bind(v5.OPEN_MARKETPLACE_VIEW_FOR_ASSET_TYPE, function(...) --[[ Line: 76 ]]
            -- upvalues: l_BindableEvent_3 (copy)
            l_BindableEvent_3:Fire(...);
        end);
        return l_BindableEvent_3.Event;
    end;
    local v22 = {
        plugin = plugin, 
        pluginName = "Toolbox", 
        translationResourceTable = l_Parent_0.LocalizationSource.LocalizedStrings, 
        fallbackResourceTable = l_Parent_0.LocalizationSource.SourceStrings, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function() --[[ Line: 89 ]] --[[ Name: getToolbarName ]]
            return "luaToolboxToolbar";
        end, 
        buttonInfo = {
            getName = function() --[[ Line: 93 ]] --[[ Name: getName ]]
                return "luaToolboxButton";
            end, 
            getDescription = function() --[[ Line: 96 ]] --[[ Name: getDescription ]]
                return "Insert items from the toolbox";
            end, 
            icon = v6.TOOLBOX_ICON, 
            text = nil, 
            clickableWhenViewportHidden = true
        }, 
        dockWidgetInfo = {
            id = "Toolbox", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, true, false, 0, 0, v5.TOOLBOX_MIN_WIDTH, v5.TOOLBOX_MIN_HEIGHT), 
            getDockTitle = function(v18, v19, v20) --[[ Line: 114 ]] --[[ Name: getDockTitle ]]
                return v18(v19, v20, "General", "ToolboxToolbarName");
            end, 
            name = "Toolbox", 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, 
        extraTriggers = v14, 
        shouldImmediatelyOpen = function() --[[ Line: 121 ]] --[[ Name: shouldImmediatelyOpen ]]
            -- upvalues: l_StudioService_0 (copy)
            local l_l_StudioService_0_StartupAssetId_0 = l_StudioService_0:GetStartupAssetId();
            if l_l_StudioService_0_StartupAssetId_0 and #l_l_StudioService_0_StartupAssetId_0 > 0 then
                return true;
            else
                return false;
            end;
        end
    };
    local v23 = v4.build(v22);
    if not v23.pluginLoader:waitForUserInteraction() then
        return;
    else
        require(script.Parent.main)(plugin, v23);
        return;
    end;
end;