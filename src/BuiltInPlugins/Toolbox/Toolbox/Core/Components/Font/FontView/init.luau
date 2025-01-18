local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Packages_0.Dash);
local l_Pane_0 = v2.UI.Pane;
local _ = v2.Wrappers.withAbsoluteSize;
local l_withAbsoluteSizeAndPosition_0 = v2.Wrappers.withAbsoluteSizeAndPosition;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v13 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v14 = require(l_Util_0.Constants);
local v15 = require(l_Util_0.LayoutOrderIterator);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v17 = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v18 = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local v19 = require(l_script_FirstAncestor_0.Core.Components.LoadScroller);
local v20 = require(l_script_FirstAncestor_0.Core.Components.InfoBanner);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v22 = require(l_script_FirstAncestor_0.Core.Components.Font.FontTile);
local v23 = require(l_script_FirstAncestor_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local l_FONT_TILE_HEIGHT_0 = v14.FONT_TILE_HEIGHT;
local v25 = v3.PureComponent:extend("FontView");
v25.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v25.init = function(v26) --[[ Line: 87 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v22 (copy), l_FONT_TILE_HEIGHT_0 (copy), v15 (copy), l_Pane_0 (copy), v5 (copy), v20 (copy), v19 (copy)
    v26.hasExceededContentMaxWidth = function() --[[ Line: 88 ]]
        -- upvalues: v26 (copy)
        local l_AbsoluteSize_0 = v26.props.AbsoluteSize;
        return l_AbsoluteSize_0 and l_AbsoluteSize_0.X > 640;
    end;
    v26.logImpression = function(v28, v29, v30, v31) --[[ Line: 94 ]]
        -- upvalues: v26 (copy)
        local l_props_0 = v26.props;
        if l_props_0.LogAssetImpression then
            return l_props_0.LogAssetImpression(v28, v31, v29, v30, l_props_0.AbsoluteSize, l_props_0.AbsolutePosition);
        else
            return nil;
        end;
    end;
    v26.renderFontTile = function(v33, v34, v35) --[[ Line: 115 ]]
        -- upvalues: v26 (copy), v3 (ref), v22 (ref), l_FONT_TILE_HEIGHT_0 (ref)
        local l_props_1 = v26.props;
        local l_OnAssetPreviewButtonClicked_0 = l_props_1.OnAssetPreviewButtonClicked;
        local v38 = v35 and 0.5 or 1;
        return v3.createElement(v22, {
            AssetInfo = v34, 
            LayoutOrder = v33, 
            LogImpression = function(v39, v40, v41, v42) --[[ Line: 123 ]] --[[ Name: LogImpression ]]
                -- upvalues: v26 (ref)
                return v26.logImpression(v39, v40, v41, v42);
            end, 
            OnAssetPreviewButtonClicked = function() --[[ Line: 136 ]] --[[ Name: OnAssetPreviewButtonClicked ]]
                -- upvalues: l_OnAssetPreviewButtonClicked_0 (copy), v34 (copy)
                l_OnAssetPreviewButtonClicked_0(v34);
            end, 
            ParentAbsoluteSize = l_props_1.AbsoluteSize, 
            Size = UDim2.new(v38, 0, 0, l_FONT_TILE_HEIGHT_0)
        });
    end;
    v26.renderResponsiveContent = function(v43) --[[ Line: 144 ]]
        -- upvalues: v26 (copy), v15 (ref), v3 (ref), l_Pane_0 (ref), v5 (ref)
        local v44 = v26.hasExceededContentMaxWidth();
        local v45 = v15.new();
        local v46 = nil;
        if v44 and #v43 > 1 then
            local v47 = {};
            v46 = {};
            for _, v49 in pairs(v43) do
                table.insert(v47, (v26.renderFontTile(#v47, v49, true)));
                if #v47 == 2 then
                    local v50 = v45:getNextOrder();
                    v46[v50] = v3.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Layout = Enum.FillDirection.Horizontal, 
                        LayoutOrder = v50, 
                        Size = UDim2.new(1, 0, 0, 10), 
                        Spacing = 10
                    }, v47);
                    v47 = {};
                end;
            end;
            if #v47 > 0 then
                local v51 = v45:getNextOrder();
                v46[v51] = v3.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = v51, 
                    Size = UDim2.new(1, 0, 0, 10), 
                    Spacing = 10
                }, v47);
            end;
        else
            v46 = v5.map(v43, function(v52) --[[ Line: 181 ]]
                -- upvalues: v45 (copy), v26 (ref)
                local v53 = v45:getNextOrder();
                return v26.renderFontTile(v53, v52, false);
            end);
        end;
        return v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            Size = UDim2.new(1, 1, 0, 10), 
            Spacing = 10, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, v46);
    end;
    v26.renderList = function(v54) --[[ Line: 198 ]]
        -- upvalues: v26 (copy), v3 (ref), v20 (ref), l_FONT_TILE_HEIGHT_0 (ref), v19 (ref)
        local v55 = v26.hasExceededContentMaxWidth();
        local v56 = #v54.assets;
        if not v54.loading and (type(v56) ~= "number" or v56 <= 0) then
            return v3.createElement(v20, {
                Position = v26.props.NoResultsPosition, 
                Text = v26.props.Localization:getText("General", "InfoBannerText"), 
                ZIndex = 2
            });
        else
            local function v60() --[[ Line: 212 ]]
                -- upvalues: v54 (copy), v55 (copy), l_FONT_TILE_HEIGHT_0 (ref)
                local v57 = #v54.assets;
                local v58 = v54.loading and 60 or 0;
                local v59 = if v55 then math.ceil(v57 / 2) else v57;
                return (l_FONT_TILE_HEIGHT_0 + 10) * v59 + v58 + 20;
            end;
            return v3.createElement(v19, {
                CalculateCanvasHeight = v60, 
                FetchNextPage = function() --[[ Line: 222 ]] --[[ Name: FetchNextPage ]]
                    -- upvalues: v54 (copy)
                    if v54 and v54.fetchNextPage then
                        return v54.fetchNextPage();
                    else
                        return;
                    end;
                end, 
                Items = v54.assets, 
                Loading = v54.loading, 
                PageSize = 30, 
                RenderContent = v26.renderResponsiveContent, 
                RenderTopContent = nil, 
                Total = v54.total
            });
        end;
    end;
end;
v25.render = function(v61) --[[ Line: 237 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_Pane_0 (copy), v5 (copy), v18 (copy)
    local l_props_2 = v61.props;
    local l_CategoryName_0 = l_props_2.CategoryName;
    local l_IncludeUnverifiedCreators_0 = l_props_2.IncludeUnverifiedCreators;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Position_0 = l_props_2.Position;
    local l_Size_0 = l_props_2.Size;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_WrapperProps_0 = l_props_2.WrapperProps;
    return v3.createElement(l_Pane_0, v5.join({
        BackgroundColor = l_Stylizer_0.backgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0, 
        Style = "Box"
    }, l_WrapperProps_0), {
        Results = v18.Generator({
            categoryName = l_CategoryName_0, 
            networkInterface = l_props_2.Network.networkInterface, 
            initialPageSize = 30, 
            includeUnverifiedCreators = l_IncludeUnverifiedCreators_0, 
            queryParams = {}, 
            render = v61.renderList, 
            searchTerm = l_props_2.searchTerm, 
            sectionName = nil
        })
    });
end;
v25 = v4.connect(function(v70, _) --[[ Line: 272 ]]
    return {
        searchTerm = ((v70 or {}).pageInfo or {}).searchTerm
    };
end, function(v72) --[[ Line: 281 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v23 (copy)
    return {
        getPageInfoAnalyticsContextInfo = function() --[[ Line: 283 ]] --[[ Name: getPageInfoAnalyticsContextInfo ]]
            -- upvalues: v72 (copy), v23 (ref)
            return v72(v23());
        end
    };
end)(v25);
return l_withAbsoluteSizeAndPosition_0(v17((l_withContext_0({
    AssetAnalytics = v13, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v11
})(v25))));