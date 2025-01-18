local l_Parent_0 = script.Parent.Parent;
local l_Src_0 = l_Parent_0.Src;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v12 = require(l_Src_0.Reducers.MainReducer);
local v13 = require(l_Src_0.Resources.MakeTheme);
local v14 = require(l_Src_0.Resources.AnalyticsHolder);
local l_SourceStrings_0 = l_Src_0.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Src_0.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Src_0.Components;
local v18 = require(l_Components_0.Callstack.CallstackWindow);
local v19 = require(l_Components_0.Watch.WatchWindow);
local v20 = require(l_Components_0.Breakpoints.BreakpointsWindow);
local v21 = require(l_Components_0.Watch.WatchComponent);
local v22 = require(l_Components_0.Common.DebuggerToolbarButtons);
local v23 = require(l_Src_0.Middleware.MainMiddleware);
local v24 = require(l_Src_0.Util.DebugConnectionListener.DebugConnectionListener);
local v25 = require(l_Src_0.Util.MetaBreakpointManagerListener.MetaBreakpointManagerListener);
local v26 = require(l_Src_0.Util.CrossDMScriptChangeListener.CrossDMScriptChangeListener);
local v27 = require(l_Src_0.Util.DebuggerUIServiceListener.DebuggerUIServiceListener);
local v28 = require(l_Src_0.Util.MakePluginActions);
local v29 = v2.PureComponent:extend("MainPlugin");
v29.init = function(v30, v31) --[[ Line: 66 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v12 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v14 (copy), v28 (copy)
    local l_Plugin_1 = v31.Plugin;
    v30.state = {
        callstackWindow = {
            Enabled = false
        }, 
        breakpointsWindow = {
            Enabled = false
        }, 
        watchWindow = {
            Enabled = false
        }, 
        uiDmLoaded = false
    };
    local l_MultipleDocumentInterfaceInstance_0 = l_Plugin_1.MultipleDocumentInterfaceInstance;
    l_MultipleDocumentInterfaceInstance_0.DataModelSessionStarted:Connect(function(_) --[[ Line: 83 ]]
        -- upvalues: v30 (copy)
        v30:setState(function() --[[ Line: 84 ]]
            return {
                uiDmLoaded = true
            };
        end);
    end);
    l_MultipleDocumentInterfaceInstance_0.DataModelSessionEnded:Connect(function(_) --[[ Line: 88 ]]
        -- upvalues: v30 (copy)
        v30:setState(function() --[[ Line: 89 ]]
            return {
                uiDmLoaded = false
            };
        end);
    end);
    if l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession then
        v30:setState(function() --[[ Line: 94 ]]
            return {
                uiDmLoaded = true
            };
        end);
    end;
    v30.toggleWidgetEnabled = function(v36) --[[ Line: 99 ]]
        -- upvalues: v30 (copy)
        local v37 = not v30.state[v36].Enabled;
        v30:setState(function(_) --[[ Line: 101 ]]
            -- upvalues: v36 (copy), v37 (copy)
            return {
                [v36] = {
                    Enabled = v37
                }
            };
        end);
    end;
    v30.onWidgetClose = function(v39) --[[ Line: 110 ]]
        -- upvalues: v30 (copy)
        v30:setState(function(_) --[[ Line: 111 ]]
            -- upvalues: v39 (copy)
            return {
                [v39] = {
                    Enabled = false
                }
            };
        end);
    end;
    v30.setWidgetEnabledState = function(v41, v42) --[[ Line: 120 ]]
        -- upvalues: v30 (copy)
        v30:setState(function(_) --[[ Line: 121 ]]
            -- upvalues: v41 (copy), v42 (copy)
            return {
                [v41] = {
                    Enabled = v42
                }
            };
        end);
    end;
    v30.store = v3.Store.new(v12, nil, v23);
    v30.debugConnectionListener = v24.new(v30.store);
    v30.metaBreakpointManagerListener = v25.new(v30.store);
    v30.scriptChangeServiceListener = v26.new(v30.store);
    v30.debuggerUIServiceListener = v27.new(v30.store);
    v30.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "Debugger"
    });
    v30.analytics = v14;
    v30.pluginActions = l_ContextServices_0.PluginActions.new(v31.Plugin, v28.getActionsWithShortcuts(v30.localization));
end;
v29.renderButtons = function(v44, v45) --[[ Line: 152 ]] --[[ Name: renderButtons ]]
    -- upvalues: v2 (copy), l_PluginButton_0 (copy)
    local l_state_0 = v44.state;
    local l_Enabled_0 = l_state_0.callstackWindow.Enabled;
    local l_Enabled_1 = l_state_0.watchWindow.Enabled;
    local l_Enabled_2 = l_state_0.breakpointsWindow.Enabled;
    return {
        ToggleCallstack = v2.createElement(l_PluginButton_0, {
            Name = "callStackDockWidgetActionV2", 
            Toolbar = v45, 
            Active = l_Enabled_0, 
            Title = "Callstack", 
            Tooltip = "", 
            icon = "rbxlocaltheme://CallStack", 
            OnClick = function() --[[ Line: 167 ]] --[[ Name: OnClick ]]
                -- upvalues: v44 (copy)
                v44.toggleWidgetEnabled("callstackWindow");
            end, 
            ClickableWhenViewportHidden = true
        }), 
        ToggleBreakpointsWindow = v2.createElement(l_PluginButton_0, {
            Name = "breakpointsDockWidgetActionV2", 
            Toolbar = v45, 
            Active = l_Enabled_2, 
            Title = "Breakpoints", 
            Tooltip = "", 
            icon = "rbxlocaltheme://Breakpoint", 
            OnClick = function() --[[ Line: 179 ]] --[[ Name: OnClick ]]
                -- upvalues: v44 (copy)
                v44.toggleWidgetEnabled("breakpointsWindow");
            end, 
            ClickableWhenViewportHidden = true
        }), 
        ToggleWatchWindow = v2.createElement(l_PluginButton_0, {
            Name = "watchDockWidgetActionV2", 
            Toolbar = v45, 
            Active = l_Enabled_1, 
            Title = "Watch", 
            Tooltip = "", 
            icon = "rbxlocaltheme://Watch", 
            OnClick = function() --[[ Line: 191 ]] --[[ Name: OnClick ]]
                -- upvalues: v44 (copy)
                v44.toggleWidgetEnabled("watchWindow");
            end, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v29.render = function(v50) --[[ Line: 199 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v13 (copy), v2 (copy), l_PluginToolbar_0 (copy), v22 (copy), v18 (copy), v20 (copy), v19 (copy), v21 (copy)
    local l_props_0 = v50.props;
    local l_state_1 = v50.state;
    local l_Plugin_2 = l_props_0.Plugin;
    local v54 = l_state_1.uiDmLoaded and l_state_1.callstackWindow and l_state_1.callstackWindow.Enabled;
    local v55 = l_state_1.uiDmLoaded and l_state_1.watchWindow and l_state_1.watchWindow.Enabled;
    local v56 = l_state_1.uiDmLoaded and l_state_1.breakpointsWindow and l_state_1.breakpointsWindow.Enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_2), 
        l_Store_0.new(v50.store), 
        l_Mouse_0.new(l_Plugin_2:getMouse()), 
        v13(), 
        v50.localization, 
        v50.analytics, 
        v50.pluginActions
    }, {
        Toolbar = v2.createElement(l_PluginToolbar_0, {
            Title = "Debugger", 
            RenderButtons = function(v57) --[[ Line: 219 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v50 (copy)
                return v50:renderButtons(v57);
            end
        }), 
        ToolbarWithRoduxConnection = v2.createElement(v22), 
        CallstackWindow = v2.createElement(v18, {
            Enabled = v54, 
            OnClose = function() --[[ Line: 226 ]] --[[ Name: OnClose ]]
                -- upvalues: v50 (copy)
                v50.onWidgetClose("callstackWindow");
            end, 
            OnRestore = function(v58) --[[ Line: 229 ]] --[[ Name: OnRestore ]]
                -- upvalues: v50 (copy)
                v50.setWidgetEnabledState("callstackWindow", v58);
            end, 
            OnWidgetEnabledChanged = function(v59) --[[ Line: 232 ]] --[[ Name: OnWidgetEnabledChanged ]]
                -- upvalues: v50 (copy)
                v50.setWidgetEnabledState("callstackWindow", v59.Enabled);
            end
        }), 
        BreakpointsWindow = v2.createElement(v20, {
            Enabled = v56, 
            OnClose = function() --[[ Line: 238 ]] --[[ Name: OnClose ]]
                -- upvalues: v50 (copy)
                v50.onWidgetClose("breakpointsWindow");
            end, 
            OnRestore = function(v60) --[[ Line: 241 ]] --[[ Name: OnRestore ]]
                -- upvalues: v50 (copy)
                v50.setWidgetEnabledState("breakpointsWindow", v60);
            end, 
            OnWidgetEnabledChanged = function(v61) --[[ Line: 244 ]] --[[ Name: OnWidgetEnabledChanged ]]
                -- upvalues: v50 (copy)
                v50.setWidgetEnabledState("breakpointsWindow", v61.Enabled);
            end
        }), 
        WatchWindow = v2.createElement(v19, {
            Enabled = v55, 
            OnClose = function() --[[ Line: 250 ]] --[[ Name: OnClose ]]
                -- upvalues: v50 (copy)
                v50.onWidgetClose("watchWindow");
            end, 
            OnRestore = function(v62) --[[ Line: 253 ]] --[[ Name: OnRestore ]]
                -- upvalues: v50 (copy)
                v50.setWidgetEnabledState("watchWindow", v62);
            end, 
            OnWidgetEnabledChanged = function(v63) --[[ Line: 256 ]] --[[ Name: OnWidgetEnabledChanged ]]
                -- upvalues: v50 (copy)
                v50.setWidgetEnabledState("watchWindow", v63.Enabled);
            end
        }, {
            Watch = v2.createElement(v21)
        })
    });
end;
v29.willUnmount = function(v64) --[[ Line: 265 ]] --[[ Name: willUnmount ]]
    if v64.debugConnectionListener then
        v64.debugConnectionListener:destroy();
        v64.debugConnectionListener = nil;
    end;
    if v64.metaBreakpointManagerListener then
        v64.metaBreakpointManagerListener:destroy();
        v64.metaBreakpointManagerListener = nil;
    end;
    if v64.scriptChangeServiceListener then
        v64.scriptChangeServiceListener:destroy();
        v64.scriptChangeServiceListener = nil;
    end;
    if v64.debuggerUIServiceListener then
        v64.debuggerUIServiceListener:destroy();
        v64.debuggerUIServiceListener = nil;
    end;
end;
return v29;