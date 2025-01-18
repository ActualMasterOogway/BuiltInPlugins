local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v4 = require(l_script_FirstAncestor_0.Components.Tile.useTileLayout);
local v5 = require(l_script_FirstAncestor_0.Components.View);
local v6 = require(l_script_FirstAncestor_0.Components.Text);
local v7 = require(l_script_FirstAncestor_0.Components.Skeleton);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local function v21(v11, v12, v13, v14, v15, v16) --[[ Line: 30 ]] --[[ Name: getTypographyComponent ]]
    -- upvalues: v2 (copy), v7 (copy), v6 (copy)
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    if typeof(v11) == "string" then
        v17 = v11;
        v18 = v12;
        v19 = v13;
        v20 = v15;
    elseif v11.isLoading then
        return v2.createElement(v7, {
            Size = UDim2.new(1 / v16, 0, 0, v12.FontSize), 
            LayoutOrder = v16
        });
    else
        v17 = v11.text;
        v18 = v11.fontStyle or v12;
        v19 = v11.colorStyle or v13;
        v20 = v11.numLines or v15;
    end;
    assert(v18 ~= nil, "fontStyle cannot be nil");
    assert(v19 ~= nil, "colorStyle cannot be nil");
    assert(v20 ~= nil, "numLines cannot be nil");
    v18.LineHeight = 1;
    return v2.createElement(v6, {
        fontStyle = v18, 
        textStyle = v19, 
        Text = v17, 
        TextXAlignment = v14, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextWrapped = v20 > 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        LayoutOrder = v16
    }, {
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(1000, v20 * v18.FontSize * v18.LineHeight)
        })
    });
end;
local v22 = {
    TextXAlignment = Enum.TextXAlignment.Left
};
return function(v23) --[[ Line: 99 ]] --[[ Name: TileHeader ]]
    -- upvalues: v10 (copy), v22 (copy), v9 (copy), v4 (copy), v21 (copy), v2 (copy), v5 (copy), v3 (copy)
    local v24 = v10(v23, v22);
    local v25 = v9();
    local v26 = v4();
    local v27 = v21(v24.title, v25.Typography.TitleLarge, v25.Color.Content.Emphasis, v24.TextXAlignment, v24.subtitle == nil and 2 or 1, 1);
    return v2.createElement(v5, {
        flexItem = {
            FlexMode = if v26.fillBehavior == v3.Fit then Enum.UIFlexMode.Shrink else Enum.UIFlexMode.Grow
        }, 
        layout = {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v24.spacing or v25.Padding.XSmall), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        tag = "auto-y size-full-0"
    }, {
        Title = v27, 
        Subtitle = if v24.subtitle ~= nil then v21(v24.subtitle, v25.Typography.CaptionLarge, v25.Color.Content.Default, v24.TextXAlignment, 1, 2) else nil
    });
end;