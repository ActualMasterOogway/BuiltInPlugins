local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local v5 = require(l_Parent_0.Core.Localization.getLocalizedCategoryMap);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LinkText_0 = v3.UI.LinkText;
local l_ScrollingFrame_0 = v3.UI.ScrollingFrame;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v11 = require(l_Parent_0.Core.Components.SearchOptions.SearchTag);
local l_SEARCH_TAG_HEIGHT_0 = v4.SEARCH_TAG_HEIGHT;
local v13 = UDim.new(0, 3);
local v14 = v2.PureComponent:extend("SearchTags");
local v15 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
v14.createTag = function(_, v17, v18) --[[ Line: 59 ]] --[[ Name: createTag ]]
    -- upvalues: v2 (copy), v11 (copy)
    local l_text_0 = v17.text;
    local l_prefix_0 = v17.prefix;
    return v2.createElement(v11, {
        Name = l_text_0, 
        LayoutOrder = v18, 
        onDelete = function() --[[ Line: 66 ]] --[[ Name: onDelete ]]
            -- upvalues: v17 (copy)
            if v17.onDelete then
                v17.onDelete(v17);
            end;
        end, 
        prefix = l_prefix_0
    });
end;
v14.createTags = function(v21, v22, v23) --[[ Line: 75 ]] --[[ Name: createTags ]]
    -- upvalues: v2 (copy), v13 (copy), l_ScrollingFrame_0 (copy)
    local v24 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = v13
        })
    };
    for v25, v26 in ipairs(v22) do
        v24[v26] = v21:createTag(v26, v25);
    end;
    return v2.createElement(l_ScrollingFrame_0, {
        AnchorPoint = Vector2.new(0, 1), 
        AutomaticCanvasSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        Size = v23, 
        ScrollingEnabled = true, 
        Position = UDim2.new(0, 0, 1, 0), 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ScrollBarThickness = 0
    }, v24);
end;
v14.createPrompt = function(v27, v28, v29) --[[ Line: 100 ]] --[[ Name: createPrompt ]]
    -- upvalues: v4 (copy), v5 (copy), v2 (copy), l_SEARCH_TAG_HEIGHT_0 (copy), v13 (copy), l_LinkText_0 (copy)
    local l_props_0 = v27.props;
    local l_textColor_0 = v29.searchTag.textColor;
    local l_FONT_SIZE_SMALL_0 = v4.FONT_SIZE_SMALL;
    local v33 = l_props_0.Localization:getText("General", "BackToHome", {
        assetType = v5(l_props_0.Localization)[l_props_0.categoryName]
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_SEARCH_TAG_HEIGHT_0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = v13
        }), 
        BackToHome = v2.createElement(l_LinkText_0, {
            LayoutOrder = 1, 
            OnClick = l_props_0.onBackToHome, 
            Style = "Unobtrusive", 
            Text = ("< %* /"):format(v33)
        }), 
        Prompt = v2.createElement("TextLabel", {
            LayoutOrder = 2, 
            Font = v4.FONT, 
            Text = if not (v28 ~= "") or v28 == nil then l_props_0.Localization:getText("General", "SearchResults") else l_props_0.Localization:getText("General", "SearchResultsKeyword"), 
            TextSize = l_FONT_SIZE_SMALL_0, 
            TextColor3 = l_textColor_0, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }), 
        SearchTerm = v2.createElement("TextLabel", {
            LayoutOrder = 3, 
            Font = v4.FONT_BOLD, 
            Text = v28 or "", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = l_FONT_SIZE_SMALL_0, 
            TextColor3 = l_textColor_0, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BackgroundTransparency = 1
        })
    });
end;
v14.render = function(v34) --[[ Line: 153 ]] --[[ Name: render ]]
    -- upvalues: l_GetTextSize_0 (copy), v13 (copy), l_SEARCH_TAG_HEIGHT_0 (copy), v15 (copy), v2 (copy), v4 (copy)
    local l_props_1 = v34.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Tags_0 = l_props_1.Tags;
    local l_searchTerm_0 = l_props_1.searchTerm;
    local l_onClearTags_0 = l_props_1.onClearTags;
    local v40 = l_props_1.Localization:getText("General", "SearchResultsClearAll");
    local l_x_0 = l_GetTextSize_0(v40, nil, nil, Vector2.new(0, 0)).x;
    local v42 = UDim2.new(1, -l_x_0 - v13.Offset, 0, l_SEARCH_TAG_HEIGHT_0);
    local v43 = l_searchTerm_0 or "Prompt";
    local v44 = l_Tags_0 and #l_Tags_0 > 0;
    local v45 = v44 and 0.6666666666666666 or 0.3333333333333333;
    local v46 = if v15() then v45 else 1;
    local v47 = v15() and 20 or 29;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, v46, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_1.LayoutOrder
    }, {
        [v43] = v34:createPrompt(l_searchTerm_0, l_Stylizer_0), 
        ClearAll = v44 and v2.createElement("TextButton", {
            Font = v4.FONT, 
            Text = v40, 
            TextSize = v4.FONT_SIZE_MEDIUM, 
            TextColor3 = l_Stylizer_0.searchTag.clearAllText, 
            Size = UDim2.new(0, l_x_0, 0, l_SEARCH_TAG_HEIGHT_0), 
            Position = UDim2.new(1, 0, 0, v47), 
            AnchorPoint = Vector2.new(1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = #l_Tags_0 + 1, 
            [v2.Event.Activated] = l_onClearTags_0
        }), 
        Tags = v44 and v34:createTags(l_Tags_0, v42)
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v14));