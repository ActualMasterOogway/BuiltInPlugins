local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Padding);
local v4 = require(l_script_FirstAncestor_0.Components.AspectRatio);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v6) --[[ Line: 13 ]] --[[ Name: GuiObjectChildren ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    return {
        Children = v2.createElement(v2.Fragment, {}, v6.children), 
        AspectRatio = if v6.aspectRatio ~= nil then v2.createElement(v4, {
            value = v6.aspectRatio
        }) else nil, 
        CornerRadius = if v6.cornerRadius ~= nil then v2.createElement("UICorner", {
            CornerRadius = v6.cornerRadius
        }) else nil, 
        FlexItem = if v6.flexItem ~= nil then v2.createElement("UIFlexItem", {
            FlexMode = v6.flexItem.FlexMode, 
            GrowRatio = v6.flexItem.GrowRatio, 
            ShrinkRatio = v6.flexItem.ShrinkRatio, 
            ItemLineAlignment = v6.flexItem.ItemLineAlignment
        }) else nil, 
        ListLayout = if v6.layout ~= nil and v6.layout.FillDirection ~= nil then v2.createElement("UIListLayout", {
            FillDirection = v6.layout.FillDirection, 
            ItemLineAlignment = v6.layout.ItemLineAlignment, 
            HorizontalAlignment = v6.layout.HorizontalAlignment, 
            HorizontalFlex = v6.layout.HorizontalFlex, 
            VerticalAlignment = v6.layout.VerticalAlignment, 
            VerticalFlex = v6.layout.VerticalFlex, 
            Padding = v6.layout.Padding, 
            SortOrder = v6.layout.SortOrder, 
            Wraps = v6.layout.Wraps
        }) else nil, 
        SizeConstraint = if v6.sizeConstraint ~= nil then v2.createElement("UISizeConstraint", v6.sizeConstraint) else nil, 
        Padding = if v6.padding ~= nil then v2.createElement(v3, {
            value = v6.padding
        }) else nil, 
        Scale = if v6.scale ~= nil then v2.createElement("UIScale", {
            Scale = v6.scale
        }) else nil, 
        Stroke = if v6.stroke ~= nil then v2.createElement("UIStroke", v6.stroke) else nil
    };
end;