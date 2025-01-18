local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = v1.PureComponent:extend("ServiceWrapper");
v3.init = function(v4) --[[ Line: 16 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    assert(v4.props[v1.Children] ~= nil, "Expected child elements to wrap");
    assert(v4.props.localization ~= nil, "Expected a Localization object");
    assert(v4.props.plugin ~= nil, "Expected a plugin object");
    assert(v4.props.store ~= nil, "Expected a Rodux Store object");
    assert(v4.props.theme ~= nil, "Expected a PluginTheme object");
    assert(v4.props.focusGui ~= nil, "Expected a FocusGui object");
    assert(v4.props.mouse ~= nil, "Expected a Mouse object");
end;
v3.render = function(v5) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_ContextServices_0 (copy)
    local v6 = v5.props[v1.Children];
    local l_localization_0 = v5.props.localization;
    local l_plugin_0 = v5.props.plugin;
    local l_focusGui_0 = v5.props.focusGui;
    local l_store_0 = v5.props.store;
    local l_theme_0 = v5.props.theme;
    local l_mouse_0 = v5.props.mouse;
    local l_calloutController_0 = v5.props.calloutController;
    return l_ContextServices_0.provide({
        l_ContextServices_0.Focus.new(l_focusGui_0), 
        l_ContextServices_0.Plugin.new(l_plugin_0), 
        l_localization_0, 
        l_theme_0, 
        l_ContextServices_0.Store.new(l_store_0), 
        l_ContextServices_0.API.new(), 
        l_ContextServices_0.Mouse.new(l_mouse_0), 
        l_calloutController_0
    }, v6);
end;
return v3;