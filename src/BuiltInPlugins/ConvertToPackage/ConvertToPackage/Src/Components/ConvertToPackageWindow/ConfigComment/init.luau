local _ = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_1.Packages;
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_Parent_1.Src.Util;
local v8 = require(l_Util_0.Constants);
local l_ToggleButton_0 = v3.UI.ToggleButton;
local v10 = v4.PureComponent:extend("ConfigComment");
v10.render = function(v11) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v8 (copy), l_ToggleButton_0 (copy)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Title_0 = l_props_0.Title;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_TotalHeight_0 = l_props_0.TotalHeight;
    local l_CommentOn_0 = l_props_0.CommentOn;
    local l_CommentEnabled_0 = l_props_0.CommentEnabled;
    local l_ToggleCallback_0 = l_props_0.ToggleCallback;
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_TotalHeight_0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Title = v4.createElement("TextLabel", {
            Size = UDim2.new(0, v8.TITLE_GUTTER_WIDTH, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v8.FONT_SIZE_TITLE, 
            TextColor3 = l_publishAsset_0.titleTextColor, 
            Font = v8.FONT, 
            LayoutOrder = 1
        }), 
        ToggleButton = v4.createElement(l_ToggleButton_0, {
            Disabled = not l_CommentEnabled_0, 
            LayoutOrder = 2, 
            OnClick = l_ToggleCallback_0, 
            Selected = l_CommentOn_0
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));