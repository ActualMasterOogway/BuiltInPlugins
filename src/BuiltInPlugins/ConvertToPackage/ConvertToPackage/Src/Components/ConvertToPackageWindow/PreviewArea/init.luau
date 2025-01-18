local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Components.ConvertToPackageWindow.AssetThumbnailPreview);
local l_Util_0 = l_Parent_0.Src.Util;
local v7 = require(l_Util_0.LayoutOrderIterator);
local v8 = v2.PureComponent:extend("PreviewArea");
v8.render = function(v9) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v2 (copy), v5 (copy)
    local l_props_0 = v9.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_TotalWidth_0 = l_props_0.TotalWidth;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_previewArea_0 = l_Stylizer_0.previewArea;
    local v15 = v7.new();
    return v2.createElement("Frame", {
        Size = UDim2.new(0, l_TotalWidth_0, 1, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_previewArea_0.backgroundColor, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 5), 
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 20)
        }), 
        AssetThumbnailPreview = v2.createElement(v5, {
            Size = UDim2.new(0, 150, 0, 150), 
            ShowTitle = false, 
            LayoutOrder = v15:getNextOrder()
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));