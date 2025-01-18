local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_RunService_0 = game:GetService("RunService");
local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Packages.AvatarToolsShared);
local v5 = require(l_Parent_0.Packages.Framework);
local v6 = require(l_Parent_0.Packages.React);
local v7 = require(l_Parent_0.Packages.ReactRoblox);
local l_UI_0 = v5.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v5.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v15 = require(l_Parent_0.Src.Resources.MakeTheme);
local v16 = require(l_Parent_0.Src.Util.SelectionWrapper);
local v17 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
local v18 = require(l_Parent_0.Src.Util.makePluginActions);
local v19 = require(l_Parent_0.Src.Components.UGCValidationContext);
local v20 = require(l_Parent_0.Src.Components.ContextStack);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v24 = require(l_Components_0.App);
local v25 = require(l_Components_0.TestInExperienceManager);
local v26 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v27 = require(l_Parent_0.Src.Flags.getFFlagUnlinkImporterAndAvatarPreview);
local v28 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v29 = v6.PureComponent:extend("MainPlugin");
v29.init = function(v30) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v26 (copy), v18 (copy), v27 (copy), l_MemStorageService_0 (copy), v17 (copy)
    v30:setState({
        enabled = false
    });
    v30.toggleEnabled = function() --[[ Line: 47 ]]
        -- upvalues: v30 (copy)
        v30:setState(function(v31) --[[ Line: 48 ]]
            return {
                enabled = not v31.enabled
            };
        end);
    end;
    v30.onClose = function() --[[ Line: 55 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            enabled = false
        });
    end;
    v30.onRestore = function(v32) --[[ Line: 61 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            enabled = v32
        });
    end;
    v30.onWidgetEnabledChanged = function(v33) --[[ Line: 67 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            enabled = v33.Enabled
        });
    end;
    v30.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AvatarCompatibilityPreviewer"
    });
    if v26() then
        v30.pluginActions = l_ContextServices_0.PluginActions.new(v30.props.Plugin, v18(v30.props.Plugin, v30.localization));
    end;
    if not v27() then
        v30.onImporterValidateUgcRequestConnection = l_MemStorageService_0:Bind("ValidateUgcBody", function() --[[ Line: 87 ]]
            -- upvalues: v30 (copy)
            v30:setState({
                enabled = true
            });
        end);
    end;
    v30.analytics = l_ContextServices_0.Analytics.new(v17);
end;
v29.renderButtons = function(v34, v35) --[[ Line: 97 ]] --[[ Name: renderButtons ]]
    -- upvalues: v6 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v34.state.enabled;
    return {
        Toggle = v6.createElement(l_PluginButton_0, {
            Toolbar = v35, 
            Active = l_enabled_0, 
            Id = "previewAvatar", 
            Title = v34.localization:getText("Plugin", "Button"), 
            OnClick = v34.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
if not v27() then
    v29.willUnmount = function(v37) --[[ Line: 113 ]] --[[ Name: willUnmount ]]
        if v37.onImporterValidateUgcRequestConnection ~= nil then
            v37.onImporterValidateUgcRequestConnection:Disconnect();
            v37.onImporterValidateUgcRequestConnection = nil;
        end;
    end;
end;
v29.render = function(v38) --[[ Line: 121 ]] --[[ Name: render ]]
    -- upvalues: l_Plugin_0 (copy), l_Mouse_0 (copy), v15 (copy), v4 (copy), v26 (copy), v16 (copy), l_Selection_0 (copy), v28 (copy), l_RunService_0 (copy), l_ContextServices_0 (copy), v6 (copy), v20 (copy), v19 (copy), l_PluginToolbar_0 (copy), v25 (copy), l_DockWidget_0 (copy), v7 (copy), v24 (copy)
    local l_props_0 = v38.props;
    local l_state_0 = v38.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    local v43 = {
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v15(), 
        v38.localization, 
        v38.analytics, 
        v4.Contexts.PreviewContext.new()
    };
    if v26() then
        table.insert(v43, v38.pluginActions);
    end;
    table.insert(v43, v16.new(l_Selection_0));
    local v44 = nil;
    v44 = if v28() then not l_RunService_0:IsRunning() and l_enabled_1 else not l_RunService_0:IsRunning();
    return l_ContextServices_0.provide(v43, {
        ContextStack = v6.createElement(v20, {
            providers = {
                if v28() then v6.createElement(v19.Provider) else nil
            }
        }, {
            Toolbar = v6.createElement(l_PluginToolbar_0, {
                Title = "AvatarPreviewer", 
                RenderButtons = function(v45) --[[ Line: 160 ]] --[[ Name: RenderButtons ]]
                    -- upvalues: v38 (copy)
                    return v38:renderButtons(v45);
                end
            }), 
            TestInExperienceManager = if v44 then v6.createElement(v25) else nil, 
            MainWidget = v6.createElement(l_DockWidget_0, {
                Id = "AvatarCompatibilityPreviewer", 
                Enabled = l_enabled_1, 
                Title = v38.localization:getText("Plugin", "Name"), 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                InitialDockState = Enum.InitialDockState.Left, 
                Size = Vector2.new(450, 600), 
                MinSize = Vector2.new(240, 250), 
                OnClose = v38.onClose, 
                ShouldRestore = true, 
                OnWidgetRestored = v38.onRestore, 
                [v7.Change.Enabled] = v38.onWidgetEnabledChanged
            }, {
                App = v38.state.enabled and v6.createElement(v24)
            })
        })
    });
end;
return v29;