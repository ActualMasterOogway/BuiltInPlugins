local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.prioritize);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v6 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v7 = require(l_Parent_0.Styling.supportsStyleSheets);
local v8 = require(l_Parent_0.Styling.joinTags);
local v9 = require(l_Parent_0.Util.Typecheck);
local v10 = v1.PureComponent:extend("Image");
v9.wrap(v10, script);
v10.render = function(v11) --[[ Line: 56 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v6 (copy), v4 (copy), v1 (copy), l_join_0 (copy), v8 (copy)
    local l_props_0 = v11.props;
    local v13 = if v7 then l_props_0.Style or {} else l_props_0.Stylizer;
    local v14 = if v7 then l_props_0[v6.Tag] else nil;
    local v15 = l_props_0.ImageColor3 or v13.Color;
    local l_Transparency_0 = v13.Transparency;
    local v17 = l_props_0.Image or v13.Image;
    local v18 = v4(l_props_0.ImageRectSize, v13.ImageRectSize);
    local v19 = v4(l_props_0.ImageRectOffset, v13.ImageRectOffset);
    local v20 = v4(l_props_0.ScaleType, v13.ScaleType);
    local l_SizeConstraint_0 = l_props_0.SizeConstraint;
    local l_SliceCenter_0 = v13.SliceCenter;
    local v23 = l_props_0.AnchorPoint or v13.AnchorPoint;
    local v24 = l_props_0.Position or v13.Position or if v7 then nil else UDim2.new(0, 0, 0, 0);
    local v25 = l_props_0.Size or v13.Size or if v7 then nil else UDim2.new(1, 0, 1, 0);
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v27 = l_props_0.Rotation or v13.Rotation;
    local l_OnMouseEnter_0 = l_props_0.OnMouseEnter;
    local l_OnMouseLeave_0 = l_props_0.OnMouseLeave;
    return v1.createElement("ImageLabel", l_join_0({
        AnchorPoint = v23, 
        Size = v25, 
        Position = v24, 
        BackgroundTransparency = 1, 
        ImageTransparency = l_Transparency_0, 
        ImageColor3 = v15, 
        BorderSizePixel = 0, 
        Rotation = v27, 
        Image = v17, 
        ImageRectSize = v18, 
        ImageRectOffset = v19, 
        ScaleType = v20, 
        SliceCenter = l_SliceCenter_0, 
        SizeConstraint = l_SizeConstraint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        [v1.Event.MouseEnter] = l_OnMouseEnter_0, 
        [v1.Event.MouseLeave] = l_OnMouseLeave_0
    }, if v7 then {
        [v6.Tag] = v8("Component-Image", v14)
    } else nil), l_props_0[v1.Children]);
end;
if not v7 then
    v10 = l_withContext_0({
        Stylizer = v2.Stylizer
    })(v10);
end;
return v10;