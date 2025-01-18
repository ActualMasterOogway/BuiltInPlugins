local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local v4 = require(l_Parent_0.Core.ContextServices.Settings);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.makeTheme);
local v7 = v2.PureComponent:extend("ToolboxServiceWrapper");
v7.render = function(v8) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), v6 (copy), v4 (copy), v2 (copy)
    local l_props_0 = v8.props;
    local l_localization_0 = l_props_0.localization;
    local l_plugin_0 = l_props_0.plugin;
    local l_settings_0 = l_props_0.settings;
    local l_store_0 = l_props_0.store;
    local _ = l_props_0.theme;
    local l_analytics_0 = l_props_0.analytics;
    local _ = l_props_0.ixp;
    local l_l_plugin_0_Mouse_0 = l_plugin_0:GetMouse();
    return l_ContextServices_0.provide({
        l_ContextServices_0.API.new(), 
        l_ContextServices_0.Plugin.new(l_plugin_0), 
        l_localization_0, 
        v6(), 
        l_ContextServices_0.Store.new(l_store_0), 
        v4.new(l_settings_0), 
        l_ContextServices_0.Mouse.new(l_l_plugin_0_Mouse_0), 
        l_analytics_0, 
        l_props_0.assetAnalytics, 
        l_props_0.ixp
    }, l_props_0[v2.Children]);
end;
return v7;