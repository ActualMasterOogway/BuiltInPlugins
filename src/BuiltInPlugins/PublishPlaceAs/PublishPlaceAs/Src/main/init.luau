local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_DebugBuiltInPluginModalsNotBlocking_0 = game:GetFastFlag("DebugBuiltInPluginModalsNotBlocking");
return function(v2, v3) --[[ Line: 3 ]]
    -- upvalues: l_DebugBuiltInPluginModalsNotBlocking_0 (copy), l_StudioPublishService_0 (copy)
    if not v2 then
        return;
    else
        local l_Parent_0 = script.Parent.Parent;
        local v5 = require(l_Parent_0.Packages.Roact);
        local v6 = require(l_Parent_0.Packages.Rodux);
        local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
        local v8 = require(l_Parent_0.Src.Components.ServiceWrapper);
        local v9 = require(l_Parent_0.Src.Components.ScreenSelect);
        local v10 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v11 = require(l_Parent_0.Src.Middleware.MainMiddleware);
        local v12 = require(l_Parent_0.Src.Actions.ResetInfo);
        local v13 = require(l_Parent_0.Src.Resources.MakeTheme);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
        local v16 = v6.Store.new(v10, {}, v11);
        local v17 = l_ContextServices_0.Localization.new({
            pluginName = l_Parent_0.Name, 
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0
        });
        local v18 = nil;
        local v19 = nil;
        local v20 = require(l_Parent_0.Src.Actions.SetIsPublishing);
        local function v21() --[[ Line: 55 ]] --[[ Name: closePlugin ]]
            -- upvalues: v18 (ref), v5 (copy), v19 (ref)
            if v18 then
                v5.unmount(v18);
            end;
            v19.Enabled = false;
        end;
        local function v23() --[[ Line: 62 ]] --[[ Name: makePluginGui ]]
            -- upvalues: l_Parent_0 (copy), v19 (ref), v2 (copy), l_DebugBuiltInPluginModalsNotBlocking_0 (ref), v17 (copy), v18 (ref), v5 (copy)
            local l_Name_0 = l_Parent_0.Name;
            v19 = v2:CreateQWidgetPluginGui(l_Name_0, {
                Size = Vector2.new(960, 720), 
                MinSize = Vector2.new(890, 550), 
                MaxSize = Vector2.new(960, 750), 
                Resizable = true, 
                Modal = not l_DebugBuiltInPluginModalsNotBlocking_0, 
                InitialEnabled = false
            });
            v19.Name = l_Parent_0.Name;
            v19.Title = v17:getText("General", "PublishPlace");
            v19.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            v19:BindToClose(function() --[[ Line: 76 ]]
                -- upvalues: v18 (ref), v5 (ref), v19 (ref)
                if v18 then
                    v5.unmount(v18);
                end;
                v19.Enabled = false;
            end);
        end;
        local v24 = require(l_Parent_0.Src.Util.CalloutController).new();
        v24:defineCallout("PublishPlaceAsTeamCreateToggleCallout", v17:getText("TcToggleCallout", "Title"), v17:getText("TcToggleCallout", "Description"), (game:GetFastString("TeamCreateLink")));
        local function v29(v25, v26, v27) --[[ Line: 92 ]] --[[ Name: openPluginWindow ]]
            -- upvalues: v5 (copy), v8 (copy), v19 (ref), v17 (copy), v2 (copy), v16 (copy), v13 (copy), v24 (copy), v9 (copy), v21 (copy), v12 (copy), v18 (ref)
            local v28 = v5.createElement(v8, {
                focusGui = v19, 
                localization = v17, 
                mouse = v2:getMouse(), 
                plugin = v2, 
                store = v16, 
                theme = v13(), 
                calloutController = v24
            }, {
                v5.createElement(v9, {
                    OnClose = v21, 
                    IsPublish = v26, 
                    CloseMode = v27, 
                    IsSaveOrPublishAs = v25
                })
            });
            v16:dispatch(v12(v17:getText("General", "UntitledGame"), v25));
            v18 = v5.mount(v28, v19);
            v19.Enabled = true;
        end;
        (function() --[[ Line: 116 ]] --[[ Name: main ]]
            -- upvalues: v2 (copy), l_Parent_0 (copy), v23 (copy), v3 (copy), v19 (ref), v17 (copy), v29 (copy), v16 (copy), v20 (copy), l_StudioPublishService_0 (ref), v18 (ref), v5 (copy)
            v2.Name = l_Parent_0.Name;
            v23();
            v3.signals["StudioPublishService.OnSaveOrPublishPlaceToRoblox"]:Connect(function(v30, v31, v32) --[[ Line: 120 ]]
                -- upvalues: v19 (ref), v17 (ref), v29 (ref)
                if v31 then
                    v19.Title = v17:getText("General", "PublishGame");
                else
                    v19.Title = v17:getText("General", "SaveGame");
                end;
                v29(v30, v31, v32);
            end);
            v3.signals["StudioPublishService.GamePublishFinished"]:Connect(function(_) --[[ Line: 130 ]]
                -- upvalues: v16 (ref), v20 (ref)
                v16:dispatch(v20(false));
            end);
            v3.signals["StudioPublishService.GamePublishCancelled"]:Connect(function() --[[ Line: 134 ]]
                -- upvalues: l_StudioPublishService_0 (ref), v18 (ref), v5 (ref), v19 (ref)
                l_StudioPublishService_0:clearUploadNames();
                if v18 then
                    v5.unmount(v18);
                end;
                v19.Enabled = false;
            end);
        end)();
        return;
    end;
end;