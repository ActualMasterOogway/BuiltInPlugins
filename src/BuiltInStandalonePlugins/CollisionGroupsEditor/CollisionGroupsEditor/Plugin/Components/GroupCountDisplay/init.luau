local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local _ = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v7 = require(script.Parent.Parent.Constants);
local v8 = v1.Component:extend("GroupCountDisplay");
v8.render = function(v9) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_TextLabel_0 (copy), v7 (copy)
    local l_props_0 = v9.props;
    local _ = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    return v1.createElement(l_TextLabel_0, {
        Text = ("%d/%d %s"):format(l_props_0.GroupCount, v7.GroupCountMax, l_Localization_0:getText("Info", "Groups")), 
        Style = "SubText", 
        Size = v7.GroupLabelFixedSize, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v8));