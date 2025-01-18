local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util.StyleModifier);
local v3 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v4 = require(l_Parent_0.UI.Components.IconButton);
local v5 = require(l_Parent_0.UI.Components.Pane);
local v6 = require(l_Parent_0.UI.Components.Separator);
local v7 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v8 = require(l_Parent_0.Styling.supportsStyleSheets);
local v9 = require(l_Parent_0.Styling.joinTags);
return function(v10) --[[ Line: 31 ]] --[[ Name: SearchButtons ]]
    -- upvalues: v1 (copy), v5 (copy), v8 (copy), v7 (copy), v4 (copy), v3 (copy), v9 (copy), v2 (copy), v6 (copy)
    return v1.createElement(v5, if v8 then {
        LayoutOrder = v10.LayoutOrder, 
        Size = v10.Size, 
        [v7.Tag] = "Buttons X-Row X-FitY"
    } else {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.fromScale(1, 0), 
        Size = v10.Size, 
        LayoutOrder = v10.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal
    }, {
        ClearButton = if v10.ShowClearButton then v1.createElement(if v8 then v4 else v3, if v8 then {
            LeftIcon = {
                [v7.Tag] = "Primary Icon16"
            }, 
            OnClick = v10.OnClear, 
            [v7.Tag] = v9("ClearButton Compact IconOnly", v10.Disabled and "Disabled" or nil)
        } else {
            Size = v10.ButtonSize, 
            LayoutOrder = 1, 
            OnClick = v10.OnClear, 
            Style = v10.Style.Clear, 
            StyleModifier = if v10.Disabled then v2.Disabled else nil
        }) else nil, 
        Separator = v10.ShowSearchButton and v1.createElement(v6, {
            DominantAxis = Enum.DominantAxis.Height, 
            LayoutOrder = 2
        }), 
        SearchButton = v10.ShowSearchButton and v1.createElement(if v8 then v4 else v3, if v8 then {
            LayoutOrder = 3, 
            LeftIcon = {
                [v7.Tag] = "Primary Icon16"
            }, 
            OnClick = v10.OnSearch, 
            [v7.Tag] = v9("SearchButton Compact IconOnly", v10.Disabled and "Disabled" or nil)
        } else {
            Size = v10.ButtonSize, 
            LayoutOrder = 3, 
            OnClick = v10.OnSearch, 
            Style = v10.Style.Search, 
            StyleModifier = if v10.Disabled then v2.Disabled else nil
        }), 
        FilterButton = if v10.ShowFilterButton then v1.createElement(if v8 then v4 else v3, if v8 then {
            LayoutOrder = 4, 
            LeftIcon = {
                [v7.Tag] = "Primary Icon16"
            }, 
            OnClick = v10.OnSearchOptionsToggled, 
            [v7.Tag] = v9("FilterButton Compact IconOnly", v10.Disabled and "Disabled" or nil, v10.SearchIsFiltered and "Filtered" or nil)
        } else {
            Size = v10.ButtonSize, 
            LayoutOrder = 4, 
            OnClick = v10.OnSearchOptionsToggled, 
            Style = if v10.SearchIsFiltered then v10.Style.FilterHighlighted else v10.Style.Filter, 
            StyleModifier = if v10.Disabled then v2.Disabled else nil
        }) else nil
    });
end;