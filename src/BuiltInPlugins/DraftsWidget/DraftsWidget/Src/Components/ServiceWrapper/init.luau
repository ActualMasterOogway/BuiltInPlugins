local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(l_Parent_0.Src.ContextServices.DraftsService);
local v4 = v1.PureComponent:extend("ServiceWrapper");
v4.init = function(v5) --[[ Line: 18 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    assert(v5.props[v1.Children] ~= nil, "Expected child elements to wrap");
    assert(v5.props.draftsService ~= nil, "Expected a DraftsService object");
    assert(v5.props.localization ~= nil, "Expected a Localization object");
    assert(v5.props.plugin ~= nil, "Expected a plugin object");
    assert(v5.props.store ~= nil, "Expected a Rodux Store object");
    assert(v5.props.theme ~= nil, "Expected a PluginTheme object");
end;
v4.render = function(v6) --[[ Line: 27 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_ContextServices_0 (copy), v3 (copy)
    local v7 = v6.props[v1.Children];
    local l_draftsService_0 = v6.props.draftsService;
    local l_localization_0 = v6.props.localization;
    local l_plugin_0 = v6.props.plugin;
    local l_focusGui_0 = v6.props.focusGui;
    local l_store_0 = v6.props.store;
    local l_theme_0 = v6.props.theme;
    return l_ContextServices_0.provide({
        l_ContextServices_0.Store.new(l_store_0), 
        l_ContextServices_0.Focus.new(l_focusGui_0), 
        l_theme_0, 
        l_localization_0, 
        l_ContextServices_0.Plugin.new(l_plugin_0), 
        v3.new(l_draftsService_0)
    }, v7);
end;
return v4;