local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v5 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v9 = require(l_Components_0.DEPRECATED_CollaboratorRibbon);
local v10 = require(l_Parent_0.Src.ContextServices.CollaboratorsServiceContext);
local v11 = require(l_Parent_0.Src.Util.AnalyticsHandlers);
local v12 = v1.PureComponent:extend("RibbonPlugin");
v12.init = function(v13, _) --[[ Line: 23 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v11 (copy)
    v13.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "SocialPresence"
    });
    v13.analytics = l_ContextServices_0.Analytics.new(v11);
end;
v12.render = function(v15) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v5 (copy), v10 (copy), v1 (copy), v9 (copy)
    local l_CollaboratorsService_0 = game:GetService("CollaboratorsService");
    local l_props_0 = v15.props;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_Widget_0 = l_props_0.Widget;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v5(), 
        v15.localization, 
        v15.analytics, 
        v10.new(l_CollaboratorsService_0)
    }, {
        RibbonComponent = v1.createElement(v9, {
            Widget = l_Widget_0, 
            OnClick = l_props_0.OnClick
        })
    });
end;
return v12;