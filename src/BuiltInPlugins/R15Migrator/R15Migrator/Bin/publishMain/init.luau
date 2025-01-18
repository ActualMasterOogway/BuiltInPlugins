local l_StudioService_0 = game:GetService("StudioService");
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_PublishTags_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).PublishTags;
local l_DebugBuiltInPluginModalsNotBlocking_0 = game:GetFastFlag("DebugBuiltInPluginModalsNotBlocking");
return function(v5, v6) --[[ Line: 12 ]]
    -- upvalues: l_StudioPublishService_0 (copy), l_StudioService_0 (copy), l_DebugBuiltInPluginModalsNotBlocking_0 (copy), l_PublishTags_0 (copy)
    if not v5 then
        return;
    else
        require(script.Parent.defineLuaFlags);
        local l_script_FirstAncestor_1 = script:FindFirstAncestor("R15Migrator");
        local v8 = require(l_script_FirstAncestor_1.Packages.Roact);
        local v9 = require(l_script_FirstAncestor_1.Packages.Framework);
        local l_CrossPluginCommunication_0 = v9.Util.CrossPluginCommunication;
        local v11 = require(l_script_FirstAncestor_1.Src.Resources.Constants);
        local v12 = require(l_script_FirstAncestor_1.Src.PublishBlockedPlugin);
        local v13 = require(l_script_FirstAncestor_1.Src.PublishWarningPlugin);
        local v14 = require(l_script_FirstAncestor_1.Src.Util.PublishTagging);
        local v15 = require(l_script_FirstAncestor_1.Src.Util.prepareToPublish);
        local l_Contexts_0 = l_script_FirstAncestor_1.Src.Contexts;
        local v17 = require(l_Contexts_0.NetworkInterface).new();
        local v18 = require(l_script_FirstAncestor_1.Src.Resources.createAnalyticsHandlers);
        local v19 = nil;
        local v20 = nil;
        local v21 = false;
        local function v22() --[[ Line: 48 ]] --[[ Name: closePlugin ]]
            -- upvalues: v19 (ref), v8 (copy), v20 (ref)
            if v19 then
                v8.unmount(v19);
            end;
            v20.Enabled = false;
        end;
        local function v23() --[[ Line: 55 ]] --[[ Name: continueToPublish ]]
            -- upvalues: v19 (ref), v8 (copy), v20 (ref), v15 (copy), v21 (ref), l_StudioPublishService_0 (ref), l_StudioService_0 (ref), l_CrossPluginCommunication_0 (copy), v11 (copy)
            if v19 then
                v8.unmount(v19);
            end;
            v20.Enabled = false;
            v15();
            if v21 then
                l_StudioPublishService_0:ShowSaveOrPublishPlaceToRoblox(false, true, Enum.StudioCloseMode.None);
            else
                l_StudioService_0:ShowPublishToRoblox();
            end;
            l_CrossPluginCommunication_0.new(v11.CrossPluginCommunicationName):Fire(v11.CrossPluginCommunicationInstructions.Published);
        end;
        local l_ContextServices_0 = v9.ContextServices;
        local v25 = l_ContextServices_0.Localization.new({
            pluginName = l_script_FirstAncestor_1.Name, 
            stringResourceTable = l_script_FirstAncestor_1.Src.Resources.Localization.SourceStrings, 
            translationResourceTable = l_script_FirstAncestor_1.Src.Resources.Localization.LocalizedStrings
        });
        local v26 = l_ContextServices_0.Analytics.new(v18);
        local function v27() --[[ Line: 78 ]] --[[ Name: makePluginGui ]]
            -- upvalues: v20 (ref), v5 (copy), l_DebugBuiltInPluginModalsNotBlocking_0 (ref), l_script_FirstAncestor_1 (copy), v25 (copy), v19 (ref), v8 (copy)
            v20 = v5:CreateQWidgetPluginGui("PublishBlocked", {
                Size = Vector2.new(400, 160), 
                Resizable = false, 
                Modal = not l_DebugBuiltInPluginModalsNotBlocking_0, 
                InitialEnabled = false
            });
            v20.Name = l_script_FirstAncestor_1.Name;
            v20.Title = v25:getText("PublishingBlocked", "Title");
            v20.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            v20:BindToClose(function() --[[ Line: 90 ]]
                -- upvalues: v19 (ref), v8 (ref), v20 (ref)
                if v19 then
                    v8.unmount(v19);
                end;
                v20.Enabled = false;
            end);
        end;
        local function v30(v28) --[[ Line: 96 ]] --[[ Name: openPluginWindow ]]
            -- upvalues: v8 (copy), v12 (copy), v22 (copy), v6 (copy), v25 (copy), v13 (copy), v23 (copy), v19 (ref), v20 (ref)
            local v29 = nil;
            v29 = if v28 then v8.createElement(v12, {
                OnClose = v22, 
                PluginLoaderContext = v6, 
                Localization = v25
            }) else v8.createElement(v13, {
                OnCancel = v22, 
                OnContinue = v23, 
                PluginLoaderContext = v6, 
                Localization = v25
            });
            v19 = v8.mount(v29, v20);
            v20.Enabled = true;
        end;
        local function _() --[[ Line: 116 ]] --[[ Name: init ]]
            -- upvalues: v5 (copy), l_script_FirstAncestor_1 (copy), v27 (copy), v6 (copy), v14 (copy), l_PublishTags_0 (ref), v17 (copy), v26 (copy), v21 (ref), v30 (copy)
            v5.Name = l_script_FirstAncestor_1.Name;
            v27();
            v6.signals["StudioPublishService.OnPublishAttempt"]:Connect(function(v31) --[[ Line: 119 ]]
                -- upvalues: v14 (ref), l_PublishTags_0 (ref), v17 (ref), v26 (ref), v21 (ref), v30 (ref)
                local v32 = v14:publishingIsBlocked();
                if v32 ~= nil then
                    local v33 = false;
                    local v34 = {};
                    local v35 = false;
                    for v36, v37 in l_PublishTags_0 do
                        table.insert(v34, {
                            name = v37.Name, 
                            blocking = v14[v36]:isBlocking()
                        });
                    end;
                    v33 = v33 or v32 ~= 0;
                    v35 = v17:getAvatarType(game) == Enum.GameAvatarType.R6;
                    table.insert(v34, {
                        name = "AvatarTypeIsR6", 
                        blocking = v35
                    });
                    v33 = v33 or v35;
                    v26:getHandler("onPublish")(v34);
                    v21 = v31;
                    v30(v33);
                end;
            end);
        end;
        v5.Name = l_script_FirstAncestor_1.Name;
        v27();
        v6.signals["StudioPublishService.OnPublishAttempt"]:Connect(function(v39) --[[ Line: 119 ]]
            -- upvalues: v14 (copy), l_PublishTags_0 (ref), v17 (copy), v26 (copy), v21 (ref), v30 (copy)
            local v40 = v14:publishingIsBlocked();
            if v40 ~= nil then
                local v41 = false;
                local v42 = {};
                local v43 = false;
                for v44, v45 in l_PublishTags_0 do
                    table.insert(v42, {
                        name = v45.Name, 
                        blocking = v14[v44]:isBlocking()
                    });
                end;
                v41 = v41 or v40 ~= 0;
                v43 = v17:getAvatarType(game) == Enum.GameAvatarType.R6;
                table.insert(v42, {
                    name = "AvatarTypeIsR6", 
                    blocking = v43
                });
                v41 = v41 or v43;
                v26:getHandler("onPublish")(v42);
                v21 = v39;
                v30(v41);
            end;
        end);
        return;
    end;
end;