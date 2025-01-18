local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_DockWidget_0 = v3.UI.DockWidget;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v9 = require(l_Parent_0.Src.Reducers.MainReducer);
local v10 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v14 = require(l_Components_0.PublishFrame);
local v15 = require(l_Components_0.ExampleRoactRoduxComponent);
local v16 = v1.PureComponent:extend("MainPlugin");
v16.init = function(v17, _) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v9 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    v17.state = {
        enabled = false
    };
    v17.toggleEnabled = function() --[[ Line: 51 ]]
        -- upvalues: v17 (copy)
        v17:setState(function(v19) --[[ Line: 52 ]]
            return {
                enabled = not v19.enabled
            };
        end);
    end;
    v17.onClose = function() --[[ Line: 59 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            enabled = false
        });
    end;
    v17.onRestore = function(v20) --[[ Line: 65 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            enabled = v20
        });
    end;
    v17.onDockWidgetCreated = function() --[[ Line: 71 ]]
        -- upvalues: v17 (copy)
        v17.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v17.toggleEnabled);
    end;
    v17.onWidgetEnabledChanged = function(v21) --[[ Line: 75 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            enabled = v21.Enabled
        });
    end;
    v17.store = v2.Store.new(v9, nil, {
        v2.thunkMiddleware
    }, nil);
    v17.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "NestedPackagePublisher"
    });
    v17.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 97 ]]
        return {};
    end, {});
end;
v16.didUpdate = function(v22) --[[ Line: 102 ]] --[[ Name: didUpdate ]]
    v22.props.pluginLoaderContext.mainButton:SetActive(v22.state.enabled);
end;
v16.render = function(v23) --[[ Line: 106 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v10 (copy), v1 (copy), l_DockWidget_0 (copy), v14 (copy), v15 (copy)
    local l_props_0 = v23.props;
    local l_state_0 = v23.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v23.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v10(), 
        v23.localization, 
        v23.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "NestedPackagePublisher", 
            Enabled = l_enabled_0, 
            Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v23.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v23.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v23.onRestore, 
            OnWidgetCreated = v23.onDockWidgetCreated, 
            [v1.Change.Enabled] = v23.onWidgetEnabledChanged
        }, {
            PublishFrame = v1.createElement(v14, {
                Enabled = l_enabled_0
            }), 
            ExampleRoactRoduxComponent = v1.createElement(v15)
        })
    });
end;
return v16;