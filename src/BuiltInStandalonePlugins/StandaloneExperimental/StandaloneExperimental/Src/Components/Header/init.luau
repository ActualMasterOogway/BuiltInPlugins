local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v10 = v1.PureComponent:extend("Header");
v10.render = function(v11) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    return v1.createElement(l_Pane_0, {
        Size = v11.props.Size, 
        LayoutOrder = v11.props.LayoutOrder, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Bottom
    }, {
        Icon = v1.createElement(l_Pane_0, {
            Size = UDim2.new(0, 150, 1, -50), 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            ScaleType = Enum.ScaleType.Fit, 
            LayoutOrder = 1, 
            Style = {
                Image = "rbxasset://textures/loading/robloxTilt.png"
            }
        }), 
        Title = v1.createElement(l_TextLabel_0, {
            Size = UDim2.fromOffset(150, 50), 
            LayoutOrder = 2, 
            Text = v11.props.Localization:getText("Header", "Title")
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v10));