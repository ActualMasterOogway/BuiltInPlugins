local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = require(l_Parent_0.UI.Components.Container);
local v6 = require(l_Parent_0.UI.Components.Image);
local v7 = require(l_Parent_0.UI.Components.TextLabel);
local v8 = require(l_Parent_0.Util.Typecheck);
local v9 = v2.PureComponent:extend("AssetRenderThumbnail");
v8.wrap(v9, script);
v9.getClassIcon = function(v10) --[[ Line: 30 ]] --[[ Name: getClassIcon ]]
    -- upvalues: l_StudioService_0 (copy)
    local l_ClassName_0 = v10.ClassName;
    if v10.IsA and (v10:IsA("JointInstance") and l_ClassName_0 == "ManualWeld" or l_ClassName_0 == "ManualGlue") then
        return l_StudioService_0:GetClassIcon("JointInstance");
    else
        return l_StudioService_0:GetClassIcon(l_ClassName_0);
    end;
end;
v9.render = function(v12) --[[ Line: 40 ]] --[[ Name: render ]]
    -- upvalues: v9 (ref), v2 (copy), v5 (copy), v6 (copy), v7 (copy)
    local l_props_0 = v12.props;
    local l_Instance_0 = l_props_0.Instance;
    local v15 = v9.getClassIcon(l_Instance_0);
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local v19 = l_props_0.IconSize or UDim2.new(0.25, 0, 0.25, 0);
    return v2.createElement(v5, {
        AnchorPoint = l_AnchorPoint_0, 
        Position = l_Position_0, 
        Size = l_Size_0
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        InstanceIcon = v2.createElement(v6, {
            LayoutOrder = 1, 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            Style = {
                Size = v19, 
                Image = v15.Image, 
                ImageRectSize = v15.ImageRectSize, 
                ImageRectOffset = v15.ImageRectOffset
            }
        }), 
        InstanceName = v2.createElement(v7, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1 - v19.Y.Scale, 0), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Text = l_Instance_0.Name or "", 
            TextTruncate = Enum.TextTruncate.AtEnd
        })
    });
end;
v9 = l_withContext_0({
    Stylizer = v3.Stylizer
})(v9);
return v9;