local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.ReactRoblox);
local v4 = require(l_Parent_0.Packages.Rodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v5.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_Pane_0 = l_UI_0.Pane;
local l_ContextServices_0 = v5.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v15 = require(l_Parent_0.Src.Reducers.MainReducer);
local v16 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v18 = require(l_Actions_0.UpdateSelectedIndex);
local v19 = require(l_Actions_0.UpdateSearchTerm);
local v20 = require(l_Actions_0.UpdateEvents);
local v21 = require(l_Actions_0.ClearEvents);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v25 = require(l_Components_0.ControlledSplitPane);
local v26 = require(l_Components_0.Topbar);
local v27 = require(l_Components_0.EventList);
local v28 = require(l_Components_0.Details);
local v29 = v2.PureComponent:extend("MainPlugin");
v29.init = function(v30, _) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v15 (copy), l_RunService_0 (copy), v20 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    v30:setState({
        enabled = false
    });
    v30.toggleEnabled = function() --[[ Line: 60 ]]
        -- upvalues: v30 (copy)
        v30:setState(function(v32) --[[ Line: 61 ]]
            return {
                enabled = not v32.enabled
            };
        end);
    end;
    v30.onClose = function() --[[ Line: 68 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            enabled = false
        });
    end;
    v30.onRestore = function(v33) --[[ Line: 74 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            enabled = v33
        });
    end;
    v30.onWidgetEnabledChanged = function(v34) --[[ Line: 80 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            enabled = v34.Enabled
        });
    end;
    v30.store = v4.Store.new(v15, nil, {
        v4.thunkMiddleware
    }, nil);
    if not l_RunService_0:IsEdit() and l_RunService_0:IsClient() then
        local l___RoduxDevtoolsPluginBridge_0 = (workspace.CurrentCamera or workspace):FindFirstChild("__RoduxDevtoolsPluginBridge");
        if l___RoduxDevtoolsPluginBridge_0 and l___RoduxDevtoolsPluginBridge_0:IsA("BindableEvent") then
            v30.devtoolsBridge = l___RoduxDevtoolsPluginBridge_0;
        else
            v30.devtoolsBridge = Instance.new("BindableEvent");
            v30.devtoolsBridge.Name = "__RoduxDevtoolsPluginBridge";
            v30.devtoolsBridge.Archivable = false;
            v30.devtoolsBridge.Parent = workspace.CurrentCamera or workspace;
        end;
        v30.pluginBatchHandlers = {
            updateEvents = function(v36) --[[ Line: 102 ]]
                -- upvalues: v30 (copy), v20 (ref)
                v30.store:dispatch(v20(v36));
            end, 
            updateEvent = function(v37) --[[ Line: 105 ]]
                -- upvalues: v30 (copy), v20 (ref)
                v30.store:dispatch(v20({
                    [v37.index] = v37.event
                }));
            end
        };
        v30.devtoolsBridge.Event:Connect(function(v38, v39) --[[ Line: 112 ]]
            -- upvalues: v30 (copy)
            if v38 ~= "PluginBatchPackets" then
                return;
            else
                for _, v41 in v39 do
                    local v42 = v30.pluginBatchHandlers[v41.type];
                    if not v42 then
                        warn(("RoduxDevtools plugin received an unknown packet type '%*'"):format(v41.type), v41);
                    else
                        local l_status_0, l_result_0 = pcall(v42, v41.props);
                        if not l_status_0 then
                            warn((("RoduxDevtools plugin encountered an error while processing packet '%*': %*"):format(v41.type, l_result_0)));
                        end;
                    end;
                end;
                return;
            end;
        end);
    end;
    v30.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "RoduxDevtools"
    });
    v30.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 143 ]]
        return {};
    end, {});
end;
v29.willUnmount = function(v45) --[[ Line: 148 ]] --[[ Name: willUnmount ]]
    if v45.devtoolsBridge then
        v45.devtoolsBridge:Destroy();
    end;
end;
v29.renderButtons = function(v46, v47) --[[ Line: 154 ]] --[[ Name: renderButtons ]]
    -- upvalues: v2 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v46.state.enabled;
    return {
        Toggle = v2.createElement(l_PluginButton_0, {
            Toolbar = v47, 
            Active = l_enabled_0, 
            Id = "RoduxDevtools_ToggleButton", 
            Title = v46.localization:getText("Plugin", "Button"), 
            Tooltip = v46.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/RoduxDevtools/ToolbarIcon.png", 
            OnClick = v46.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v29.render = function(v49) --[[ Line: 171 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v16 (copy), v2 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v3 (copy), l_Pane_0 (copy), v26 (copy), v19 (copy), v18 (copy), v21 (copy), v25 (copy), v27 (copy), v28 (copy)
    local l_props_0 = v49.props;
    local l_state_0 = v49.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v49.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v16(), 
        v49.localization, 
        v49.analytics
    }, {
        Toolbar = v2.createElement(l_PluginToolbar_0, {
            Title = v49.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v54) --[[ Line: 187 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v49 (copy)
                return v49:renderButtons(v54);
            end
        }), 
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = "RoduxDevtools", 
            Enabled = l_enabled_1, 
            Title = v49.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(400, 250), 
            OnClose = v49.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v49.onRestore, 
            [v3.Change.Enabled] = v49.onWidgetEnabledChanged
        }, {
            Main = v2.createElement(l_Pane_0, {
                Style = "Box", 
                Padding = 5
            }, {
                Topbar = v2.createElement(v26, {
                    OnSearch = function(v55) --[[ Line: 210 ]] --[[ Name: OnSearch ]]
                        -- upvalues: v49 (copy), v19 (ref)
                        v49.store:dispatch(v19(v55));
                    end, 
                    OnClearList = function() --[[ Line: 213 ]] --[[ Name: OnClearList ]]
                        -- upvalues: v49 (copy), v18 (ref), v21 (ref)
                        v49.devtoolsBridge:Fire("DevtoolsCall", "Clear");
                        v49.store:dispatch(v18(0));
                        v49.store:dispatch(v21());
                    end
                }), 
                Sections = v2.createElement(v25, {
                    UseScale = false, 
                    ClampSize = true, 
                    UseDeficit = true, 
                    Position = UDim2.fromOffset(0, 37), 
                    Size = UDim2.new(1, 0, 1, -37), 
                    MinSizes = {
                        UDim.new(0, 150), 
                        UDim.new(0, 100)
                    }, 
                    MaxSizes = {
                        UDim.new(0, 600), 
                        nil
                    }, 
                    InitialSizes = {
                        UDim.new(0, 300), 
                        UDim.new(1, -300)
                    }
                }, {
                    v2.createElement(l_Pane_0, {
                        Style = "BorderBox", 
                        Padding = 1
                    }, {
                        EventList = v2.createElement(v27, {
                            OnSelected = function(v56) --[[ Line: 234 ]] --[[ Name: OnSelected ]]
                                -- upvalues: v49 (copy), v18 (ref)
                                local v57 = v49.store:getState().events[v56];
                                if not v57 then
                                    return;
                                else
                                    if v57.isStub then
                                        v49.devtoolsBridge:Fire("DevtoolsCall", "_fillPluginStubAtIndex", v56);
                                    end;
                                    v49.store:dispatch(v18(v56));
                                    return;
                                end;
                            end
                        })
                    }), 
                    v2.createElement(l_Pane_0, {
                        Style = "BorderBox", 
                        Padding = 1
                    }, {
                        Details = v2.createElement(v28, {
                            OnSetState = function(v58) --[[ Line: 253 ]] --[[ Name: OnSetState ]]
                                -- upvalues: v49 (copy)
                                v49.devtoolsBridge:Fire("DevtoolsCall", "RevertToStateAtIndex", v58);
                            end, 
                            OnUndoAction = function(v59) --[[ Line: 256 ]] --[[ Name: OnUndoAction ]]
                                -- upvalues: v49 (copy)
                                v49.devtoolsBridge:Fire("DevtoolsCall", "UndoActionAtIndex", v59);
                            end, 
                            OnRedoAction = function(v60) --[[ Line: 259 ]] --[[ Name: OnRedoAction ]]
                                -- upvalues: v49 (copy)
                                v49.devtoolsBridge:Fire("DevtoolsCall", "RedoActionAtIndex", v60);
                            end
                        })
                    })
                })
            })
        })
    });
end;
return v29;