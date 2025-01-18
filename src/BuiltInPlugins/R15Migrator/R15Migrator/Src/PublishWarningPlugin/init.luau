local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Resources.MakeTheme);
local v4 = require(l_Parent_0.Src.Components.PublishWarning.PublishWarningDialog);
local v5 = v1.PureComponent:extend("PublishWarningPlugin");
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
v5.render = function(v8) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), v3 (copy), v1 (copy), v4 (copy)
    local l_props_0 = v8.props;
    local l_OnCancel_0 = l_props_0.OnCancel;
    local l_OnContinue_0 = l_props_0.OnContinue;
    local l_Localization_0 = l_props_0.Localization;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(plugin), 
        v3(), 
        l_Localization_0
    }, {
        v1.createElement(v4, {
            OnCancel = l_OnCancel_0, 
            OnContinue = l_OnContinue_0
        })
    });
end;
return v5;