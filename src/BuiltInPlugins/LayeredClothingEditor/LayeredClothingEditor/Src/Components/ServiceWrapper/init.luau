local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_ContextServices_0 = v2.ContextServices;
local l_AssetServiceWrapper_0 = v3.Contexts.AssetServiceWrapper;
local l_StudioServiceWrapper_0 = v3.Contexts.StudioServiceWrapper;
local l_MannequinContext_0 = v3.Contexts.MannequinContext;
local v8 = v1.PureComponent:extend("ServiceWrapper");
v8.init = function(v9) --[[ Line: 21 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    assert(v9.props.analytics ~= nil, "Expected a Analytics object");
    assert(v9.props[v1.Children] ~= nil, "Expected child elements to wrap");
    assert(v9.props.localization ~= nil, "Expected a Localization object");
    assert(v9.props.plugin ~= nil, "Expected a plugin object");
    assert(v9.props.store ~= nil, "Expected a Rodux Store object");
    assert(v9.props.theme ~= nil, "Expected a PluginTheme object");
    assert(v9.props.mouse ~= nil, "Expected a PluginMouse object");
    assert(v9.props.pluginActions ~= nil, "Expect a PluginActions object");
    assert(v9.props.signals ~= nil, "Expect a Signals object");
    assert(v9.props.editingItemContext ~= nil, "Expect a EditingItemContext");
    assert(v9.props.meshEditingContext ~= nil, "Expect a LuaMeshEditingModuleContext");
end;
v8.render = function(v10) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_ContextServices_0 (copy), l_AssetServiceWrapper_0 (copy), l_StudioServiceWrapper_0 (copy), l_MannequinContext_0 (copy)
    local l_plugin_0 = v10.props.plugin;
    local l_analytics_0 = v10.props.analytics;
    local v13 = v10.props[v1.Children];
    local l_localization_0 = v10.props.localization;
    local l_mouse_0 = v10.props.mouse;
    local l_store_0 = v10.props.store;
    local l_theme_0 = v10.props.theme;
    local l_pluginActions_0 = v10.props.pluginActions;
    local l_signals_0 = v10.props.signals;
    local l_editingItemContext_0 = v10.props.editingItemContext;
    local l_meshEditingContext_0 = v10.props.meshEditingContext;
    return l_ContextServices_0.provide({
        l_plugin_0, 
        l_analytics_0, 
        l_localization_0, 
        l_theme_0, 
        l_ContextServices_0.Store.new(l_store_0), 
        l_ContextServices_0.API.new(), 
        l_pluginActions_0, 
        l_signals_0, 
        l_ContextServices_0.Mouse.new(l_mouse_0), 
        l_editingItemContext_0, 
        l_meshEditingContext_0, 
        l_AssetServiceWrapper_0.new(), 
        l_StudioServiceWrapper_0.new(), 
        l_MannequinContext_0.new()
    }, v13);
end;
return v8;