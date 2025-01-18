local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local _ = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Core.Util.Constants);
local v4 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v6 = {
    getAssetsPerRow = function(v5) --[[ Line: 12 ]] --[[ Name: getAssetsPerRow ]]
        -- upvalues: v3 (copy)
        return (math.floor((v5 + v3.BETWEEN_ASSETS_HORIZONTAL_PADDING) / (v3.ASSET_WIDTH_NO_PADDING + v3.BETWEEN_ASSETS_HORIZONTAL_PADDING)));
    end
};
v6.getSwimlaneWidth = function(v7) --[[ Line: 19 ]] --[[ Name: getSwimlaneWidth ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = v7 - 2 * v3.MAIN_VIEW_PADDING - v3.SCROLLBAR_PADDING;
    local v9 = v3.ASSET_WIDTH_NO_PADDING + v3.BETWEEN_ASSETS_HORIZONTAL_PADDING;
    return v6.getAssetsPerRow(v8) * v9 - v3.BETWEEN_ASSETS_HORIZONTAL_PADDING;
end;
v6.getAssetCellHeightWithPadding = function(v10) --[[ Line: 26 ]] --[[ Name: getAssetCellHeightWithPadding ]]
    -- upvalues: v3 (copy)
    local l_ASSET_HEIGHT_0 = v3.ASSET_HEIGHT;
    if v10 then
        l_ASSET_HEIGHT_0 = l_ASSET_HEIGHT_0 + v3.PRICE_HEIGHT;
    end;
    return l_ASSET_HEIGHT_0 + v3.BETWEEN_ASSETS_VERTICAL_PADDING;
end;
v6.calculateAssetsHeight = function(v12, v13, v14) --[[ Line: 34 ]] --[[ Name: calculateAssetsHeight ]]
    -- upvalues: v6 (copy), v3 (copy)
    if v12 == 0 or v13 == 0 then
        return 0;
    else
        local v15 = v6.getAssetsPerRow(v13);
        if v15 == 0 then
            return 0;
        else
            return v6.getAssetCellHeightWithPadding(v14) * math.ceil(v12 / v15) - v3.BETWEEN_ASSETS_VERTICAL_PADDING + v3.ASSET_VOTING_HEIGHT;
        end;
    end;
end;
v6.sliceAssetsFromBounds = function(v16, v17, v18) --[[ Line: 62 ]] --[[ Name: sliceAssetsFromBounds ]]
    local v19 = {};
    v17 = v17 or 1;
    v18 = math.min(v18 or #v16, #v16);
    if v17 > 0 and v17 <= v18 then
        for v20 = v17, v18 do
            v19[#v19 + 1] = {
                v16[v20], 
                v20
            };
        end;
    end;
    return v19;
end;
v6.calculateRenderBoundsForScrollingFrame = function(v21, v22, v23, v24) --[[ Line: 77 ]] --[[ Name: calculateRenderBoundsForScrollingFrame ]]
    -- upvalues: v6 (copy), v3 (copy)
    if not v21 then
        return 0, 0;
    else
        local v25 = v6.getAssetsPerRow(v22);
        local v26 = v6.getAssetCellHeightWithPadding(v24);
        local v27 = v21.CanvasPosition.Y - v23;
        local l_Y_0 = v21.AbsoluteSize.Y;
        local l_SCROLLING_FRAME_VIEW_PADDING_0 = v3.SCROLLING_FRAME_VIEW_PADDING;
        v27 = v27 - l_SCROLLING_FRAME_VIEW_PADDING_0;
        l_Y_0 = l_Y_0 + 2 * l_SCROLLING_FRAME_VIEW_PADDING_0;
        local v30 = math.max(math.floor(v27 / v26), 0);
        local v31 = v30 + math.ceil(l_Y_0 / v26);
        return v30 * v25 + 1, (v31 + 1) * v25;
    end;
end;
v6.calculateMainViewHeaderHeight = function(v32, _, _, _, v36, v37) --[[ Line: 106 ]] --[[ Name: calculateMainViewHeaderHeight ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v38 = 0;
    local v39 = 0;
    if v4() then
        if v36 or v32 then
            v38 = v38 + v3.SEARCH_TERMS_HEIGHT;
        end;
        if v32 and v37 then
            v38 = v38 + v3.MAIN_VIEW_VERTICAL_PADDING;
            v39 = v3.MAIN_VIEW_VERTICAL_PADDING;
        end;
        return math.max(v38, v3.MAIN_VIEW_NO_HEADER_HEIGHT), v39;
    else
        if v32 then
            v39 = v3.MAIN_VIEW_VERTICAL_PADDING;
            v38 = v38 + v3.SEARCH_TERMS_HEIGHT;
        end;
        return math.max(v38, v3.MAIN_VIEW_NO_HEADER_HEIGHT), v39;
    end;
end;
return v6;