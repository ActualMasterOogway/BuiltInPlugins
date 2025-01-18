local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Pane_0 = v2.UI.Pane;
local v7 = require(l_Parent_0.Src.Components.ProgressSpinner);
local v8 = require(l_Parent_0.Src.Components.MessageFrame);
local v9 = require(l_Parent_0.Src.Components.CloudTableSection);
local v10 = require(l_Parent_0.Src.Components.EmbeddedTableSection);
local v11 = require(l_Parent_0.Src.Components.ImageLocalizationSection);
local v12 = require(l_Parent_0.Src.Components.TextScraperSection);
local l_LocalizationToolsUpdateTextScraperUI_0 = game:GetFastFlag("LocalizationToolsUpdateTextScraperUI");
local v14 = v1.PureComponent:extend("MainView");
v14.render = function(v15) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_LocalizationToolsUpdateTextScraperUI_0 (copy), v12 (copy), v9 (copy), v10 (copy), v11 (copy), v8 (copy), l_Pane_0 (copy), v7 (copy)
    local l_Stylizer_0 = v15.props.Stylizer;
    local v17 = l_LayoutOrderIterator_0.new();
    local v18 = {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Stylizer_0.PaddingTop), 
            PaddingBottom = UDim.new(0, l_Stylizer_0.Padding), 
            PaddingLeft = UDim.new(0, l_Stylizer_0.Padding), 
            PaddingRight = UDim.new(0, l_Stylizer_0.PaddingRight)
        }), 
        TextScraperSection = if l_LocalizationToolsUpdateTextScraperUI_0 then v1.createElement(v12, {
            LayoutOrder = v17:getNextOrder()
        }) else nil, 
        CloudTableSection = v1.createElement(v9, {
            LayoutOrder = v17:getNextOrder()
        }), 
        EmbeddedTableSection = v1.createElement(v10, {
            LayoutOrder = v17:getNextOrder()
        }), 
        ImageLocalizationSection = v1.createElement(v11, {
            LayoutOrder = v17:getNextOrder()
        }), 
        ExtendedBackground = v1.createElement("Frame", {
            BackgroundColor3 = l_Stylizer_0.MainBackground, 
            BorderSizePixel = 0, 
            LayoutOrder = v17:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.EmptyFrameHeight)
        })
    };
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0)
    }, {
        MessageFrame = v1.createElement(v8), 
        ScrollingFrame = v1.createElement("ScrollingFrame", {
            BackgroundColor3 = l_Stylizer_0.ScrollingFrameackground, 
            BackgroundTransparency = 0, 
            BorderColor3 = l_Stylizer_0.ScrollBarBorderColor, 
            BorderSizePixel = 1, 
            CanvasSize = UDim2.new(1, 0, 0, l_Stylizer_0.ScrollingFrameCanvasHeight), 
            ClipsDescendants = true, 
            ScrollBarImageTransparency = 0, 
            ScrollBarImageColor3 = l_Stylizer_0.ScrollBarColor, 
            ScrollingDirection = Enum.ScrollingDirection.XY, 
            Size = UDim2.new(1, 0, 1, l_Stylizer_0.ScrollingFrameHeight - 1)
        }, {
            Container = v1.createElement(l_Pane_0, {
                Style = "Box", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical
            }, v18)
        }), 
        ProgressSpinner = v1.createElement(v7)
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v14));