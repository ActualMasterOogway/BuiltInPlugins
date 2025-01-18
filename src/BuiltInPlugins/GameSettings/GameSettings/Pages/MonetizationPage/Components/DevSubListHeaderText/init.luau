local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = v1.Component:extend("DeveloperSubscriptionListHeaderText");
v5.render = function(v6) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Size_0 = v6.props.Size;
    local l_Text_0 = v6.props.Text;
    local l_LayoutOrder_0 = v6.props.LayoutOrder;
    local l_Alignment_0 = v6.props.Alignment;
    local l_Stylizer_0 = v6.props.Stylizer;
    return v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
        Size = l_Size_0, 
        Text = l_Text_0, 
        LayoutOrder = l_LayoutOrder_0, 
        TextXAlignment = l_Alignment_0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }));
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));