local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Util_0.Urls);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_Parent_0.Core.Localization.getLocalizedCategoryMap);
local v10 = require(l_Parent_0.Core.Components.Categorization.IconTile);
local l_LinkText_0 = v2.UI.LinkText;
local l_ResponsiveGrid_0 = v2.UI.ResponsiveGrid;
local l_ScrollingFrame_0 = v2.UI.ScrollingFrame;
local v14 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAudioUpdateLandingPage);
local _ = require(l_Parent_0.Core.Types.HomeTypes);
local v16 = UDim2.fromOffset(75, 63);
local l_MAIN_VIEW_PADDING_0 = v5.MAIN_VIEW_PADDING;
local l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 = v5.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE;
local l___tbl_0 = v5.DISCOVER_NEW_AUDIO_SWIMLANE_TILES.__tbl;
local v20 = v3.PureComponent:extend("SubcategoriesView");
v20.defaultProps = {
    Size = UDim2.new(1, 0, 0, 0)
};
v20.init = function(v21, _) --[[ Line: 85 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 (copy), v14 (copy), l___tbl_0 (copy), v16 (copy), v3 (copy), v10 (copy)
    v21.state = {
        maxTileHeight = 0
    };
    v21.onClickBack = function(_) --[[ Line: 90 ]]
        -- upvalues: v21 (copy)
        local l_OnClickBack_0 = v21.props.OnClickBack;
        if l_OnClickBack_0 then
            l_OnClickBack_0();
        end;
    end;
    v21.onClickSubcategory = function(v25) --[[ Line: 97 ]]
        -- upvalues: v21 (copy)
        local l_props_0 = v21.props;
        local l_CategoryName_0 = l_props_0.CategoryName;
        local l_OnClickSubcategory_0 = l_props_0.OnClickSubcategory;
        local l_OnClickSeeAllAssets_0 = l_props_0.OnClickSeeAllAssets;
        local l_SortName_0 = l_props_0.SortName;
        local v31 = l_props_0.SubcategoryDict[v25];
        if v31.childCount == 0 and l_OnClickSeeAllAssets_0 then
            l_OnClickSeeAllAssets_0(nil, l_CategoryName_0, l_SortName_0, nil, v31.queryParams, v31.name);
            return;
        else
            if l_OnClickSubcategory_0 then
                l_OnClickSubcategory_0({
                    v25
                }, v31.children, l_CategoryName_0, l_SortName_0, v31.queryParams);
            end;
            return;
        end;
    end;
    v21.onTileSizeChanged = function(v32) --[[ Line: 120 ]]
        -- upvalues: v21 (copy)
        v21:setState(function(v33) --[[ Line: 121 ]]
            -- upvalues: v32 (copy)
            return {
                maxTileHeight = math.max(v33.maxTileHeight, v32.Y)
            };
        end);
    end;
    v21.getSubcategoryElements = function() --[[ Line: 128 ]]
        -- upvalues: v21 (copy), v6 (ref), l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 (ref), v14 (ref), l___tbl_0 (ref), v16 (ref), v3 (ref), v10 (ref)
        local l_props_1 = v21.props;
        local l_SubcategoryDict_0 = l_props_1.SubcategoryDict;
        local v36 = {};
        for _, v38 in pairs(l_SubcategoryDict_0) do
            local v39 = nil;
            local v40 = nil;
            if v38.thumbnail then
                v39 = Color3.fromHex(v38.thumbnail.backgroundColor);
                local l_assetId_0 = v38.thumbnail.assetId;
                v40 = v6.constructAssetThumbnailUrl(l_assetId_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0);
            end;
            local v42 = {};
            local v43 = v14() and table.find(l___tbl_0, v38.name) ~= nil;
            if v43 then
                v42.ContentsPadding = l_props_1.Stylizer.wideIconButtonPadding;
                v42.ImageSize = v16;
            end;
            v36[v38.name] = v3.createElement(v10, {
                BackgroundColor = v39, 
                ContentsPadding = if v43 then v42.ContentsPadding else nil, 
                Image = v40, 
                ImageSize = if v43 then v42.ImageSize else nil, 
                Key = v38.name, 
                LayoutOrder = v38.index, 
                OnClick = v21.onClickSubcategory, 
                Title = v38.displayName, 
                OnAbsoluteSizeChanged = v21.onTileSizeChanged
            });
        end;
        return v36;
    end;
end;
v20.render = function(v44) --[[ Line: 166 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v3 (copy), l_ScrollingFrame_0 (copy), v5 (copy), l_MAIN_VIEW_PADDING_0 (copy), l_LinkText_0 (copy), l_ResponsiveGrid_0 (copy)
    local l_props_2 = v44.props;
    local l_state_0 = v44.state;
    local l_Localization_0 = l_props_2.Localization;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Position_0 = l_props_2.Position;
    local l_Size_0 = l_props_2.Size;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local v52 = v44.getSubcategoryElements();
    local v53 = "< " .. l_Localization_0:getText("General", "BackToHome", {
        assetType = v9(l_Localization_0)[l_props_2.CategoryName]
    });
    return v3.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0
    }, {
        ScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
            AutoSizeCanvas = true, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            Layout = Enum.FillDirection.Vertical, 
            EnableScrollBarBackground = true, 
            Padding = v5.MAIN_VIEW_PADDING, 
            Size = l_Size_0, 
            Spacing = UDim.new(0, l_MAIN_VIEW_PADDING_0)
        }, {
            BackButton = v3.createElement(l_LinkText_0, {
                LayoutOrder = 1, 
                OnClick = v44.onClickBack, 
                Style = "Unobtrusive", 
                Text = v53
            }), 
            InnerGrid = v3.createElement(l_ResponsiveGrid_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                CutOffs = {
                    {
                        ColumnCount = 1, 
                        MinWidth = 0
                    }, 
                    {
                        ColumnCount = 2, 
                        MinWidth = 376
                    }, 
                    {
                        ColumnCount = 3, 
                        MinWidth = 736
                    }
                }, 
                ItemHeight = UDim.new(0, l_state_0.maxTileHeight), 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0)
            }, v52)
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v20));