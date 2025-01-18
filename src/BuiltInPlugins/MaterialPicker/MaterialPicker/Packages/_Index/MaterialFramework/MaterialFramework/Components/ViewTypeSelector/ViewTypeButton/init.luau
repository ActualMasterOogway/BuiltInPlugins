local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Framework);
local v3 = require(l_Parent_1.React);
local _ = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_Slider_0 = l_UI_0.Slider;
local _ = v2.Util.prioritize;
local l_ViewType_0 = require(l_Parent_0.Enums).ViewType;
local l_Constants_0 = require(l_Parent_0.Util).Constants;
ViewTypeButton = function(v12) --[[ Line: 71 ]] --[[ Name: ViewTypeButton ]]
    -- upvalues: l_ViewType_0 (copy), v3 (copy), l_Pane_0 (copy), l_IconButton_0 (copy), l_Slider_0 (copy), l_Constants_0 (copy)
    local l_Style_0 = v12.Style;
    local v14 = if v12.ViewType == l_ViewType_0.Grid then l_Style_0.GridIcon else l_Style_0.ListIcon;
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor = l_Style_0.BackgroundColor, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = v12.LayoutOrder
    }, {
        IconButton = v3.createElement(l_IconButton_0, {
            BackgroundColor = l_Style_0.BackgroundColor, 
            BackgroundStyle = "Box", 
            IconColor = l_Style_0.IconColor, 
            IconSize = l_Style_0.IconSize, 
            LayoutOrder = 1, 
            LeftIcon = v14, 
            OnClick = v12.OnClick, 
            Size = l_Style_0.ItemSize, 
            Text = v12.Text
        }), 
        Slider = if v12.ViewType == l_ViewType_0.Grid then v3.createElement(l_Slider_0, {
            AnchorPoint = l_Style_0.SliderAnchorPoint, 
            Disabled = false, 
            Value = v12.GridSize, 
            Min = l_Constants_0.GRID_SIZE_MIN, 
            Max = l_Constants_0.GRID_SIZE_MAX, 
            LayoutOrder = 2, 
            OnValueChanged = v12.OnGridSizeChanged, 
            Position = l_Style_0.SliderPosition, 
            Size = l_Style_0.SliderSize, 
            SnapIncrement = l_Constants_0.GRID_SIZE_SNAP_INCREMENT, 
            VerticalDragTolerance = l_Constants_0.GRID_SIZE_VERTICAL_DRAG_TOLERANCE
        }) else nil
    });
end;
return ViewTypeButton;