local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_Util_0 = v3.Util;
local l_CrossPluginCommunication_0 = l_Util_0.CrossPluginCommunication;
local l_Dialog_0 = v3.UI.Dialog;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v11 = require(l_Parent_0.Src.Reducers.MainReducer);
local v12 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v16 = require(l_Components_0.PermissionsView);
local v17 = require(l_Components_0.SaveToRobloxView);
local v18 = v1.PureComponent:extend("MainPlugin");
local v19 = require(l_Parent_0.Src.Networking.Networking);
local v20 = require(l_Parent_0.Src.Controllers.GroupMetadataController);
local v21 = require(l_Parent_0.Src.Controllers.GroupRolePermissionsController);
local v22 = require(l_Parent_0.Src.Controllers.GamePermissionsController);
local v23 = require(l_Parent_0.Src.Controllers.GameMetadataController);
local v24 = require(l_Parent_0.Src.Controllers.SocialController);
local v25 = require(l_Parent_0.Src.Actions.ResetStore);
v18.init = function(v26, v27) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: l_Plugin_0 (copy), v25 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), l_Util_0 (copy), v2 (copy), v11 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_CrossPluginCommunication_0 (copy)
    v26.plugin = l_Plugin_0.new(v27.Plugin);
    v26.state = {
        enabled = false
    };
    v26.toggleEnabled = function() --[[ Line: 61 ]]
        -- upvalues: v26 (copy)
        v26:setState(function(v28) --[[ Line: 62 ]]
            return {
                enabled = not v28.enabled
            };
        end);
    end;
    v26.onClose = function() --[[ Line: 69 ]]
        -- upvalues: v26 (copy), v25 (ref)
        v26.store:dispatch(v25());
        v26:setState({
            enabled = false
        });
    end;
    v26.onRestore = function(v29) --[[ Line: 78 ]]
        -- upvalues: v26 (copy)
        v26:setState({
            enabled = v29
        });
    end;
    v26.onWidgetEnabledChanged = function(v30) --[[ Line: 84 ]]
        -- upvalues: v26 (copy)
        v26:setState({
            enabled = v30.Enabled
        });
    end;
    local v31 = {};
    local v32 = v19.new();
    local v33 = v20.new(v32:get());
    local v34 = v21.new(v32:get());
    local v35 = v22.new(v32:get());
    local v36 = v23.new(v32:get());
    local v37 = v24.new(v32:get());
    v31.networking = v32:get();
    v31.groupMetadataController = v33;
    v31.groupRolePermisionsController = v34;
    v31.gamePermissionsController = v35;
    v31.gameMetadataController = v36;
    v31.socialController = v37;
    local v38 = {
        (l_Util_0.ThunkWithArgsMiddleware(v31))
    };
    v26.store = v2.Store.new(v11, nil, v38);
    v26.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "ManageCollaborators"
    });
    v26.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 117 ]]
        return {};
    end, {});
    v26.communication = l_CrossPluginCommunication_0.new("ManageCollaborators");
    v26.communication:Connect("ToggleManageCollaborators", function() --[[ Line: 122 ]]
        -- upvalues: v26 (copy)
        v26.toggleEnabled();
    end);
end;
v18.render = function(v39) --[[ Line: 127 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), l_ContextServices_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v1 (copy), l_Dialog_0 (copy), v16 (copy), v17 (copy)
    local l_props_0 = v39.props;
    local l_enabled_0 = v39.state.enabled;
    local v42 = game.GameId ~= 0;
    local v43 = v12();
    return l_ContextServices_0.provide({
        v39.plugin, 
        l_Store_0.new(v39.store), 
        l_Mouse_0.new(l_props_0.Plugin:getMouse()), 
        v43, 
        v39.localization, 
        v39.analytics
    }, {
        Dialog = v1.createElement(l_Dialog_0, {
            CreateWidgetImmediately = true, 
            Enabled = l_enabled_0, 
            Modal = true, 
            Title = v39.localization:getText("Plugin", "Title"), 
            Size = Vector2.new(800, 571), 
            OnClose = v39.onClose
        }, {
            PermissionsView = v42 and v1.createElement(v16, {
                CloseWidget = v39.onClose, 
                Plugin = v39.plugin, 
                Enabled = l_enabled_0
            }) or nil, 
            SaveToRobloxView = not v42 and v1.createElement(v17, {
                CloseWidget = v39.onClose
            })
        })
    });
end;
return v18;