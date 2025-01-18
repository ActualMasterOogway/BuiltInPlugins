local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local _ = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local v7 = v1.PureComponent:extend("MainProvider");
v7.render = function(v8) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_ContextServices_0 (copy)
    local l_analytics_0 = v8.props.analytics;
    local v10 = v8.props[v1.Children];
    local v11 = v8.props.focusGui and l_ContextServices_0.Focus.new(v8.props.focusGui);
    local l_localization_0 = v8.props.localization;
    local v13 = v8.props.mouse and l_ContextServices_0.Mouse.new(v8.props.mouse);
    local v14 = v8.props.plugin and l_ContextServices_0.Plugin.new(v8.props.plugin);
    local v15 = v8.props.store and l_ContextServices_0.Store.new(v8.props.store);
    local l_theme_0 = v8.props.theme;
    local l_pluginActions_0 = v8.props.pluginActions;
    local l_signals_0 = v8.props.signals;
    local l_calloutController_0 = v8.props.calloutController;
    return l_ContextServices_0.provide({
        l_analytics_0, 
        v11, 
        v14, 
        l_localization_0, 
        l_theme_0, 
        v15, 
        v13, 
        l_pluginActions_0, 
        l_signals_0, 
        l_calloutController_0
    }, v10);
end;
return v7;