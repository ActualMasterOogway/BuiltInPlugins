local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local v4 = require(l_Parent_0.Src.ContextServices.NetworkContext);
local v5 = v2.PureComponent:extend("ServiceWrapper");
v5.init = function(v6, _) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    assert(v6.props[v2.Children] ~= nil, "Expected child elements to wrap");
    assert(v6.props.networkInterface ~= nil, "Expected a NetworkInterface object");
    assert(v6.props.localization ~= nil, "Expected a Localization object");
    assert(v6.props.plugin ~= nil, "Expected a plugin object");
    assert(v6.props.mouse ~= nil, "Expected a mouse object");
    assert(v6.props.store ~= nil, "Expected a Rodux Store object");
    assert(v6.props.theme ~= nil, "Expected a PluginTheme object");
    assert(v6.props.focusGui ~= nil, "Expected a FocusGui object");
end;
v5.render = function(v8) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ContextServices_0 (copy), v4 (copy)
    local l_props_0 = v8.props;
    local l_store_0 = l_props_0.store;
    local l_plugin_0 = l_props_0.plugin;
    local l_theme_0 = l_props_0.theme;
    local l_mouse_0 = l_props_0.mouse;
    local l_focusGui_0 = l_props_0.focusGui;
    local l_localization_0 = l_props_0.localization;
    local l_networkInterface_0 = l_props_0.networkInterface;
    local v17 = v8.props[v2.Children];
    return l_ContextServices_0.provide({
        l_ContextServices_0.Store.new(l_store_0), 
        l_ContextServices_0.Focus.new(l_focusGui_0), 
        l_theme_0, 
        l_localization_0, 
        l_ContextServices_0.Plugin.new(l_plugin_0), 
        v4.new(l_networkInterface_0), 
        l_ContextServices_0.Mouse.new(l_mouse_0)
    }, v17);
end;
return v5;