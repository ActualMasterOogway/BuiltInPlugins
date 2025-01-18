local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v10 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v13 = require(l_Parent_0.Src.Components.GraphicsPane);
local v14 = require(l_Parent_0.Src.Components.NetworkPane);
local v15 = require(l_Parent_0.Src.Components.MultiTouchPane);
local v16 = require(l_Parent_0.Src.Controllers.MultiTouchController);
local v17 = v1.PureComponent:extend("MainPlugin");
require(l_Parent_0.Bin.defineLuaFlags);
local function _() --[[ Line: 36 ]]
    return game:GetFastFlag("StudioEnableMultiTouchGestureEmulation") and game:GetFastFlag("StudioUnlockMouseWhenEmulating");
end;
v17.init = function(v19, _) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v16 (copy)
    v19.state = {
        enabled = false
    };
    v19.toggleEnabled = function() --[[ Line: 56 ]]
        -- upvalues: v19 (copy)
        v19:setState(function(v21) --[[ Line: 57 ]]
            return {
                enabled = not v21.enabled
            };
        end);
    end;
    v19.onClose = function() --[[ Line: 64 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            enabled = false
        });
    end;
    v19.onRestore = function(v22) --[[ Line: 70 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            enabled = v22
        });
    end;
    v19.onDockWidgetCreated = function() --[[ Line: 76 ]]
        -- upvalues: v19 (copy)
        v19.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v19.toggleEnabled);
    end;
    v19.onWidgetEnabledChanged = function(v23) --[[ Line: 80 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            enabled = v23.Enabled
        });
    end;
    v19.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "DeviceEmulator"
    });
    v19.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 91 ]]
        return {};
    end, {});
    if game:GetFastFlag("StudioEnableMultiTouchGestureEmulation") and game:GetFastFlag("StudioUnlockMouseWhenEmulating") then
        v19.multiTouchController = v16.new();
    end;
end;
v17.willUnmount = function(v24) --[[ Line: 100 ]] --[[ Name: willUnmount ]]
    if v24.multiTouchController then
        v24.multiTouchController:destroy();
    end;
end;
v17.didUpdate = function(v25) --[[ Line: 106 ]] --[[ Name: didUpdate ]]
    v25.props.pluginLoaderContext.mainButton:SetActive(v25.state.enabled);
end;
v17.render = function(v26) --[[ Line: 110 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v13 (copy), v14 (copy), v15 (copy), l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v10 (copy), l_DockWidget_0 (copy), l_Pane_0 (copy), l_ScrollingFrame_0 (copy)
    local l_props_0 = v26.props;
    local l_state_0 = v26.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    local v31 = v1.createElement(v13, {});
    local v32 = v1.createElement(v14, {});
    local v33 = nil;
    if game:GetFastFlag("StudioEnableMultiTouchGestureEmulation") and game:GetFastFlag("StudioUnlockMouseWhenEmulating") then
        v33 = v1.createElement(v15, {});
    end;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v10(), 
        v26.localization, 
        v26.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "DeviceEmulator", 
            Enabled = l_enabled_0, 
            Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v26.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(360, 420), 
            MinSize = Vector2.new(300, 200), 
            OnClose = v26.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v26.onRestore, 
            OnWidgetCreated = v26.onDockWidgetCreated, 
            [v1.Change.Enabled] = v26.onWidgetEnabledChanged
        }, {
            MainPane = v1.createElement(l_Pane_0, {
                Style = "Box", 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromOffset(0, 0)
            }, {
                ScrollingFrame = v1.createElement(l_ScrollingFrame_0, {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.fromScale(0, 0), 
                    Layout = Enum.FillDirection.Vertical, 
                    Position = UDim2.fromScale(0, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                }, {
                    ContainerPane = v1.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.fromScale(1, 0), 
                        AnchorPoint = Vector2.new(0, 0), 
                        Position = UDim2.fromScale(0, 0), 
                        Layout = Enum.FillDirection.Vertical, 
                        Padding = 5, 
                        Spacing = 5
                    }, {
                        GraphicsPane = v31, 
                        NetworkPane = v32, 
                        MultiTouchPane = v33
                    })
                })
            })
        })
    });
end;
return v17;