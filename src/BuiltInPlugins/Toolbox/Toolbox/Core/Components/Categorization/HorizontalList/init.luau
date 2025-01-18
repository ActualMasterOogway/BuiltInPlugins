local l_Packages_0 = script.Parent.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local v2 = v1.PureComponent:extend("HorizontalList");
v2.render = function(v3) --[[ Line: 15 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local v4 = v3.props.Data or {};
    local l_OnRenderItem_0 = v3.props.OnRenderItem;
    local l_Position_0 = v3.props.Position;
    local l_LayoutOrder_0 = v3.props.LayoutOrder;
    local l_DisplayCount_0 = v3.props.DisplayCount;
    local v9 = {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8)
        })
    };
    local v10 = 0;
    for v11, v12 in pairs(v4) do
        local l_v10_0 = v10;
        if typeof(v12) == "table" and v12.index ~= nil then
            l_v10_0 = v12.index;
        end;
        if l_v10_0 < l_DisplayCount_0 then
            v10 = v10 + 1;
            v9[tostring(v11)] = l_OnRenderItem_0(v11, v12);
        end;
    end;
    return v1.createElement("Frame", {
        LayoutOrder = l_LayoutOrder_0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        Position = l_Position_0, 
        BackgroundTransparency = 1
    }, v9);
end;
return v2;