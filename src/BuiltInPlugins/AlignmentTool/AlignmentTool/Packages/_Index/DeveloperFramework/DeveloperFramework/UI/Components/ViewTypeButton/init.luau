local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else "";
local v2 = require(l_Parent_0.Styling.hasTag);
local v3 = require(l_Parent_0.Styling.joinTags);
local l_Components_0 = l_Parent_0.UI.Components;
local v5 = require(l_Components_0.Pane);
local v6 = require(l_Components_0.Slider);
local _ = require(script.ViewType);
local v8 = require(l_Components_0.Image);
local v9 = require(l_Components_0.TextLabel);
local v10 = require(script.styles);
local v11 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkViewTypeSelectorIcons);
local v12 = {
    SliderAnchorPoint = Vector2.new(0.5, 0.5), 
    SliderPosition = UDim2.fromScale(0.5, 0.5), 
    SliderSize = UDim2.new(1, -10, 0, 20)
};
return function(v13) --[[ Line: 65 ]] --[[ Name: ViewTypeButton ]]
    -- upvalues: v1 (copy), v11 (copy), v2 (copy), v10 (copy), v5 (copy), v3 (copy), v8 (copy), v9 (copy), v6 (copy), v12 (copy)
    assert(v1 ~= "", "You must be using non-legacy React in order to use ViewTypeButton");
    local v14 = nil;
    v14 = if v11() then v2(v13[v1.Tag], "Grid") and "Grid" or "List" else if v2(v13[v1.Tag], "Grid") then v10:GetAttribute("GridIcon") else v10:GetAttribute("ListIcon");
    local v15 = v2(v13[v1.Tag], "Icon");
    local v16 = v15 and "Icon" or "";
    return v1.createElement(v5, {
        LayoutOrder = v13.LayoutOrder, 
        OnClick = v13.OnClick, 
        [v1.Tag] = "Component-ViewTypeButton X-Column X-Fit Main"
    }, {
        ButtonContainer = v1.createElement(v5, {
            LayoutOrder = 1, 
            [v1.Tag] = v3("ButtonContainer X-RowM", v16)
        }, {
            ImageContainer = v1.createElement(v5, {
                LayoutOrder = 1, 
                [v1.Tag] = "ImageContainer X-Center X-Middle"
            }, {
                ViewTypeIcon = v1.createElement(v8, {
                    Image = if not v11() then v14 else nil, 
                    [v1.Tag] = ("Icon16 %*"):format(if not v11() then nil else v14)
                })
            }), 
            Label = if not v15 then v1.createElement(v9, {
                LayoutOrder = 2, 
                Text = v13.Text, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                [v1.Tag] = "X-FitX"
            }) else nil
        }), 
        SliderContainer = if v13.HasSlider then v1.createElement(v5, {
            LayoutOrder = 2, 
            [v1.Tag] = "SliderContainer X-Middle X-Center"
        }, {
            Slider = v1.createElement(v6, {
                Value = v13.GridTileSize, 
                OnValueChanged = v13.OnGridTileSizeChanged, 
                Min = v13.MinGridTileSize or v10:GetAttribute("SliderValueMin"), 
                Max = v13.MaxGridTileSize or v10:GetAttribute("SliderValueMax"), 
                SnapIncrement = v10:GetAttribute("SliderSnapIncrement"), 
                VerticalDragTolerance = v10:GetAttribute("SliderVerticalDragTolerance"), 
                AnchorPoint = v12.SliderAnchorPoint, 
                Position = v12.SliderPosition, 
                Size = v12.SliderSize
            })
        }) else nil
    });
end;