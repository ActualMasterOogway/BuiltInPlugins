local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local l_DockWidget_0 = v4.UI.DockWidget;
local v10 = require(l_Parent_0.Src.ContextServices.AnalyticsContext);
local v11 = require(l_Parent_0.Src.Resources.PluginTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v14 = require(l_Parent_0.Src.Components.MainView);
local v15 = require(l_Parent_0.Src.Reducers.MainReducer);
local v16 = require(l_Parent_0.Src.Thunks.LoadPluginMetadata);
local v17 = require(l_Parent_0.Src.Util.Analytics);
local v18 = Vector2.new(380, 250);
local v19 = v2.PureComponent:extend("MainPlugin");
v19.init = function(v20) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v15 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v11 (copy), v17 (copy)
    v20.state = {
        enabled = false
    };
    v20.store = v3.Store.new(v15, {}, {
        v3.thunkMiddleware
    });
    v20.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "LocalizationTools"
    });
    v20.theme = v11();
    v20.api = l_ContextServices_0.API.new();
    v20.analyticsImpl = v17.new();
    v20.toggleState = function() --[[ Line: 56 ]]
        -- upvalues: v20 (copy)
        local l_enabled_0 = v20.state.enabled;
        v20:setState({
            enabled = not l_enabled_0
        });
        if l_enabled_0 then
            v20.analyticsImpl:reportButtonPress("tools", "closed");
            return;
        else
            v20.analyticsImpl:reportToolOpened(1);
            v20.analyticsImpl:reportButtonPress("tools", "open");
            return;
        end;
    end;
    v20.onRestore = function(v22) --[[ Line: 71 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            enabled = v22
        });
    end;
    v20.onDockWidgetCreated = function() --[[ Line: 77 ]]
        -- upvalues: v20 (copy)
        v20.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v20.toggleState);
    end;
    v20.onDockWidgetEnabledChanged = function(v23) --[[ Line: 81 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            enabled = v23.Enabled
        });
    end;
    v20.onClose = function() --[[ Line: 87 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            enabled = false
        });
    end;
    v20.button = v20.props.pluginLoaderContext.mainButton;
end;
v19.didMount = function(v24) --[[ Line: 96 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy), v16 (copy)
    if not l_RunService_0:IsEdit() then
        return;
    else
        local v25 = v24.api:get();
        local l_localization_0 = v24.localization;
        local l_store_0 = v24.store;
        l_store_0:dispatch(v16.GetAll(v25, l_localization_0));
        game:GetPropertyChangedSignal("GameId"):Connect(function() --[[ Line: 104 ]]
            -- upvalues: l_store_0 (copy), v16 (ref), v25 (copy), l_localization_0 (copy)
            l_store_0:dispatch(v16.OnGameIdChanged(v25, l_localization_0));
        end);
        return;
    end;
end;
v19.didUpdate = function(v28) --[[ Line: 109 ]] --[[ Name: didUpdate ]]
    v28.button:SetActive(v28.state.enabled);
end;
v19.render = function(v29) --[[ Line: 113 ]] --[[ Name: render ]]
    -- upvalues: l_RunService_0 (copy), l_ContextServices_0 (copy), l_Plugin_0 (copy), v2 (copy), l_DockWidget_0 (copy), v18 (copy), l_Mouse_0 (copy), l_Store_0 (copy), v10 (copy), v14 (copy)
    local l_props_0 = v29.props;
    local l_state_0 = v29.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    local v34 = l_RunService_0:IsEdit();
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1)
    }, {
        MainWidget = v34 and v2.createElement(l_DockWidget_0, {
            Id = "LocalizationTools", 
            Enabled = l_enabled_1, 
            Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v29.localization:getText("Plugin", "WindowTitle"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            MinSize = v18, 
            Size = v18, 
            OnClose = v29.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v29.onRestore, 
            OnWidgetCreated = v29.onDockWidgetCreated, 
            [v2.Change.Enabled] = v29.onDockWidgetEnabledChanged
        }, {
            MainProvider = l_enabled_1 and l_ContextServices_0.provide({
                l_Mouse_0.new(l_Plugin_1:getMouse()), 
                l_Store_0.new(v29.store), 
                v29.api, 
                v29.localization, 
                v29.theme, 
                v10.new(v29.analyticsImpl)
            }, {
                MainView = v2.createElement(v14)
            })
        })
    });
end;
return v19;