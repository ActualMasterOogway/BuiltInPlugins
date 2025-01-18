local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v4 = require(l_script_FirstAncestor_0.Components.Tile.useTileLayout);
local v5 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = {
    LayoutOrder = 2
};
return function(v8) --[[ Line: 22 ]] --[[ Name: TileContent ]]
    -- upvalues: v5 (copy), v7 (copy), v4 (copy), v2 (copy), v6 (copy), v3 (copy)
    local v9 = v5(v8, v7);
    local v10 = v4();
    local v11 = if v9.padding then UDim.new(0, v9.padding) else nil;
    local v12 = v9.spacing or 0;
    return v2.createElement(v6, {
        LayoutOrder = v9.LayoutOrder, 
        flexItem = {
            FlexMode = if v10.fillBehavior == v3.Fit then Enum.UIFlexMode.Shrink else Enum.UIFlexMode.Fill
        }, 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            VerticalFlex = if v10.fillBehavior == v3.Fill then Enum.UIFlexAlignment.SpaceBetween else Enum.UIFlexAlignment.None, 
            Padding = UDim.new(0, v12), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        padding = if v11 then {
            top = if v10.fillDirection == Enum.FillDirection.Horizontal then v11 else UDim.new(), 
            bottom = v11, 
            left = if v10.fillDirection == Enum.FillDirection.Vertical then v11 else UDim.new(), 
            right = v11
        } else nil, 
        tag = "size-full"
    }, v9.children);
end;