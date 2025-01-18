local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v10 = require(l_Parent_0.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Resources.LocalizedStrings;
local l_Components_0 = l_Parent_0.Plugin.Components;
local v14 = require(l_Components_0.Gui);
local v15 = require(l_Components_0.CannotConfigureSelectionDialog);
local v16 = v1.PureComponent:extend("MainPlugin");
v16.init = function(v17, v18) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    local l_Plugin_1 = v18.Plugin;
    v17.state = {
        enabled = false, 
        uiDmLoaded = false, 
        cannotConfigureSelectionDialogVisible = false
    };
    local l_MultipleDocumentInterfaceInstance_0 = l_Plugin_1.MultipleDocumentInterfaceInstance;
    l_MultipleDocumentInterfaceInstance_0.DataModelSessionStarted:Connect(function(_) --[[ Line: 41 ]]
        -- upvalues: v17 (copy)
        v17:setState(function() --[[ Line: 42 ]]
            return {
                uiDmLoaded = true
            };
        end);
    end);
    l_MultipleDocumentInterfaceInstance_0.DataModelSessionEnded:Connect(function(_) --[[ Line: 46 ]]
        -- upvalues: v17 (copy)
        v17:setState(function() --[[ Line: 47 ]]
            return {
                uiDmLoaded = false
            };
        end);
    end);
    if l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession then
        v17:setState(function() --[[ Line: 52 ]]
            return {
                uiDmLoaded = true
            };
        end);
    end;
    local function _(v23) --[[ Line: 57 ]] --[[ Name: setEnabled ]]
        -- upvalues: v17 (copy), l_Plugin_1 (copy)
        if v23 == v17.state.enabled then
            return;
        else
            v17:setState({
                enabled = v23
            });
            l_Plugin_1:Invoke("WindowEnabledChanged", v23);
            return;
        end;
    end;
    v17.toggleEnabled = function() --[[ Line: 66 ]]
        -- upvalues: v17 (copy), l_Plugin_1 (copy)
        local v25 = not v17.state.enabled;
        if v25 == v17.state.enabled then
            return;
        else
            v17:setState({
                enabled = v25
            });
            l_Plugin_1:Invoke("WindowEnabledChanged", v25);
            return;
        end;
    end;
    v17.onClose = function() --[[ Line: 70 ]]
        -- upvalues: v17 (copy), l_Plugin_1 (copy)
        if v17.state.enabled == false then
            return;
        else
            v17:setState({
                enabled = false
            });
            l_Plugin_1:Invoke("WindowEnabledChanged", false);
            return;
        end;
    end;
    v17.onRestore = function(v26) --[[ Line: 74 ]]
        -- upvalues: v17 (copy), l_Plugin_1 (copy)
        if v26 == v17.state.enabled then
            return;
        else
            v17:setState({
                enabled = v26
            });
            l_Plugin_1:Invoke("WindowEnabledChanged", v26);
            return;
        end;
    end;
    v17.onWidgetEnabledChanged = function(v27) --[[ Line: 78 ]]
        -- upvalues: v17 (copy), l_Plugin_1 (copy)
        local l_Enabled_0 = v27.Enabled;
        if l_Enabled_0 == v17.state.enabled then
            return;
        else
            v17:setState({
                enabled = l_Enabled_0
            });
            l_Plugin_1:Invoke("WindowEnabledChanged", l_Enabled_0);
            return;
        end;
    end;
    v17.trackPollGuiEnabled = l_Plugin_1:OnInvoke("PollGuiEnabled", function() --[[ Line: 82 ]]
        -- upvalues: l_Plugin_1 (copy), v17 (copy)
        l_Plugin_1:Invoke("WindowEnabledChanged", v17.state.enabled);
    end);
    v17.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "CGE"
    });
    v17.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 92 ]]
        return {};
    end, {});
    v17.onAttemptModifyInPlayMode = function() --[[ Line: 95 ]]
        -- upvalues: v17 (copy)
        print(v17.localization:getText("Info", "CannotModifyInPlayModeMessage"));
    end;
    v17.onCannotConfigureSelection = function() --[[ Line: 98 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            cannotConfigureSelectionDialogVisible = true
        });
    end;
    v17.onCloseCannotConfigureSelectionDialog = function() --[[ Line: 103 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            cannotConfigureSelectionDialogVisible = false
        });
    end;
end;
v16.renderButtons = function(v29, v30) --[[ Line: 110 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v29.state.enabled;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v30, 
            Active = l_enabled_0, 
            Id = "collisionGroupsEditorButton", 
            Title = v29.localization:getText("Main", "Title"), 
            Tooltip = v29.localization:getText("Main", "Title"), 
            Icon = "rbxlocaltheme://CollisionGroups", 
            OnClick = v29.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v16.render = function(v32) --[[ Line: 127 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v10 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v14 (copy), v15 (copy)
    local l_props_0 = v32.props;
    local l_state_0 = v32.state;
    local l_Plugin_2 = l_props_0.Plugin;
    local v36 = l_state_0.enabled and l_state_0.uiDmLoaded;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_2), 
        l_Mouse_0.new(l_Plugin_2:getMouse()), 
        v10(), 
        v32.localization, 
        v32.analytics
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = "collisionGroupsEditorToolbar", 
            RenderButtons = function(v37) --[[ Line: 142 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v32 (copy)
                return v32:renderButtons(v37);
            end
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "CollisionGroupsEditor", 
            Enabled = v36, 
            Title = v32.localization:getText("Main", "Title"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(128, 200), 
            OnClose = v32.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v32.onRestore, 
            [v1.Change.Enabled] = v32.onWidgetEnabledChanged
        }, {
            Gui = v1.createElement(v14, {
                plugin = l_Plugin_2, 
                OnAttemptModifyInPlayMode = v32.onAttemptModifyInPlayMode, 
                OnCannotConfigureSelection = v32.onCannotConfigureSelection
            }), 
            CannotConfigureSelectionDialog = l_state_0.cannotConfigureSelectionDialogVisible and v1.createElement(v15, {
                Enabled = true, 
                OnClose = v32.onCloseCannotConfigureSelectionDialog
            })
        })
    });
end;
v16.willUnmount = function(v38) --[[ Line: 174 ]] --[[ Name: willUnmount ]]
    v38.trackPollGuiEnabled:Disconnect();
end;
return v16;