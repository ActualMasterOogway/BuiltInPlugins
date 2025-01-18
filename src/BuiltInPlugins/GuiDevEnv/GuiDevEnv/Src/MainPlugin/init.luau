local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_DockWidget_0 = v2.UI.DockWidget;
local v6 = v1.PureComponent:extend("MainPlugin");
v6.init = function(v7, _) --[[ Line: 12 ]] --[[ Name: init ]]
    v7.onClose = function() --[[ Line: 13 ]]

    end;
    v7.onRestore = function(_) --[[ Line: 15 ]]

    end;
    v7.mouse = v7.props.plugin:GetMouse();
end;
v6.render = function(v10) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), v1 (copy), l_DockWidget_0 (copy)
    local l_plugin_0 = v10.props.plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_plugin_0)
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "GuiDevEnv", 
            Enabled = false, 
            Title = l_plugin_0.Name, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Float, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v10.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v10.onRestore
        })
    });
end;
return v6;