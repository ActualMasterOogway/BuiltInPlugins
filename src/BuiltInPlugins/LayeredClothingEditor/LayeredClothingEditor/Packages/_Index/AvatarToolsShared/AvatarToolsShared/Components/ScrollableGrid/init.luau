local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Util_0 = v2.Util;
local l_deepCopy_0 = l_Util_0.deepCopy;
local l_Typecheck_0 = l_Util_0.Typecheck;
local v9 = v1.PureComponent:extend("ScrollableGrid");
l_Typecheck_0.wrap(v9, script);
v9.defaultProps = {
    LayoutOrder = 1
};
v9.render = function(v10) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: l_deepCopy_0 (copy), v1 (copy), l_Pane_0 (copy), l_ScrollingFrame_0 (copy)
    local l_props_0 = v10.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Size_0 = l_props_0.Size;
    local l_CellSize_0 = l_props_0.CellSize;
    local l_CellPadding_0 = l_props_0.CellPadding;
    local v16 = l_deepCopy_0(l_props_0[v1.Children]);
    if v16 then
        v16.UIGridLayout = v1.createElement("UIGridLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            CellPadding = l_CellPadding_0, 
            CellSize = l_CellSize_0
        });
    end;
    return v1.createElement(l_Pane_0, {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        ScrollingFrame = v1.createElement(l_ScrollingFrame_0, {
            LayoutOrder = l_LayoutOrder_0, 
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.fromScale(0, 1), 
            AutomaticCanvasSize = Enum.AutomaticSize.XY
        }, v16)
    });
end;
return v9;