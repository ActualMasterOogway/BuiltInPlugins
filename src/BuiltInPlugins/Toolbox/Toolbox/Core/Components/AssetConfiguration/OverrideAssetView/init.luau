local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Tooltip_0 = v4.UI.Tooltip;
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v7 = require(l_Requests_0.MakeChangeRequest);
local l_Util_0 = l_Parent_0.Core.Util;
local v9 = require(l_Util_0.Constants);
local v10 = require(l_Util_0.Urls);
local v11 = require(l_Util_0.Images);
local v12 = require(l_Util_0.Colors);
local v13 = require(l_Util_0.AssetConfigConstants);
local v14 = require(l_Parent_0.Core.Components.InfiniteScrollingFrame);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v17 = v2.PureComponent:extend("OverrideAssetView");
v17.init = function(v18, v19) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v13 (copy)
    v18.state = {
        selectedAssetId = 0, 
        pageIndex = 1, 
        layoutContentSize = Vector2.new()
    };
    v18.newAssetInfo = {
        assetTypeEnum = v19.assetTypeEnum, 
        instances = v19.instances
    };
    v18.layouterRef = v2.createRef();
    v18.onLayoutContentSizeChange = function(v20) --[[ Line: 68 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            layoutContentSize = v20.AbsoluteContentSize
        });
    end;
    v18.onAssetActivated = function(v21) --[[ Line: 74 ]]
        -- upvalues: v18 (copy), v19 (copy), v13 (ref)
        local l_Id_0 = v21.Asset.Id;
        if l_Id_0 == v18.state.selectedAssetId then
            return;
        else
            v19.onOverrideAssetSelected(l_Id_0);
            v18.props.makeChangeRequest(v13.OVERRIDE_ASSET_ID, v18.state.selectedAssetId, l_Id_0);
            v18:setState({
                selectedAssetId = l_Id_0
            });
            return;
        end;
    end;
    v18.requestOverrideAsset = function() --[[ Line: 92 ]]
        -- upvalues: v19 (copy), v18 (copy)
        v19.getOverrideAssets(v18.state.pageIndex);
        v18:setState({
            pageIndex = v18.state.pageIndex + 1
        });
    end;
    v18.DEPRECATED_requestOverrideAsset = function(v23) --[[ Line: 99 ]]
        -- upvalues: v19 (copy), v18 (copy)
        v19.getOverrideAssets(v23);
        if v18.state.pageIndex ~= v23 then
            v18:setState({
                pageIndex = v23
            });
        end;
    end;
end;
v17.createAssets = function(v24, v25, v26) --[[ Line: 109 ]] --[[ Name: createAssets ]]
    -- upvalues: v2 (copy), v10 (copy), v9 (copy), v13 (copy), v12 (copy), v11 (copy), l_Tooltip_0 (copy)
    local l_assetConfig_0 = v26.assetConfig;
    local v28 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 1), 
            PaddingRight = UDim.new(0, 1), 
            PaddingTop = UDim.new(0, 12)
        }), 
        UIGridLayout = v2.createElement("UIGridLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            CellPadding = UDim2.new(0, 24, 0, 26), 
            CellSize = UDim2.new(0, 150, 0, 198), 
            FillDirectionMaxCells = 4, 
            StartCorner = Enum.StartCorner.TopLeft, 
            [v2.Ref] = v24.layouterRef, 
            [v2.Change.AbsoluteContentSize] = v24.onLayoutContentSizeChange
        })
    };
    local l_filterID_0 = v24.props.filterID;
    local l_selectedAssetId_0 = v24.state.selectedAssetId;
    for v31, v32 in pairs(v25) do
        local l_Id_1 = v32.Asset.Id;
        local v34 = v10.constructAssetThumbnailUrl(l_Id_1, v9.THUMBNAIL_SIZE_LARGE, v9.THUMBNAIL_SIZE_LARGE);
        local v35 = l_selectedAssetId_0 == l_Id_1;
        local _ = true;
        local v37 = true;
        if l_filterID_0 ~= "" then
            v37 = tostring(l_Id_1):find(l_filterID_0, 1, true);
        end;
        v28[l_Id_1] = v37 and v2.createElement("TextButton", {
            Size = v13.OverrideAssetItemSize, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Text = "", 
            Font = v9.FONT, 
            TextSize = v9.FONT_SIZE_MEDIUM, 
            [v2.Event.Activated] = function(_) --[[ Line: 158 ]]
                -- upvalues: v24 (copy), v32 (copy)
                v24.onAssetActivated(v32);
            end, 
            LayoutOrder = v31
        }, {
            UIListLayout = v2.createElement("UIListLayout"), 
            Border = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -48), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = v12.WHITE, 
                BorderSizePixel = 1, 
                BorderColor3 = v35 and v12.BLUE_PRIMARY or v12.GRAY_3, 
                LayoutOrder = 1
            }, {
                ThumbNail = v2.createElement("ImageLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BorderSizePixel = 1, 
                    BackgroundTransparency = 1, 
                    Image = v34
                }), 
                CheckedIcon = v35 and v2.createElement("ImageLabel", {
                    Position = UDim2.new(0, 4, 0, 4), 
                    Size = UDim2.new(0, 28, 0, 28), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = v11.SELECTED_CHECK, 
                    ImageColor3 = v12.BLUE_PRIMARY
                }), 
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = v32.Asset.Name
                }) or nil
            }), 
            Title = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 48), 
                Text = v32.Asset.Name, 
                Font = v9.FONT, 
                TextColor3 = l_assetConfig_0.textColor, 
                TextSize = v9.FONT_SIZE_MEDIUM, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = v32.Asset.Name
                }) or nil
            })
        });
    end;
    return v28;
end;
v17.render = function(v39) --[[ Line: 227 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v14 (copy)
    local l_props_0 = v39.props;
    local _ = v39.state;
    local l_Stylizer_0 = v39.props.Stylizer;
    local l_Size_0 = l_props_0.Size;
    local v44 = v39:createAssets(l_props_0.resultsArray or {}, l_Stylizer_0);
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    local l_layouterRef_0 = v39.layouterRef;
    return v2.createElement(v14, {
        Size = l_Size_0, 
        BackgroundColor3 = l_publishAsset_0.backgroundColor, 
        layouterRef = l_layouterRef_0, 
        nextPageFunc = v39.DEPRECATED_requestOverrideAsset, 
        LayoutOrder = l_props_0.LayoutOrder
    }, v44);
end;
local function v51(v47) --[[ Line: 251 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v7 (copy)
    return {
        makeChangeRequest = function(v48, v49, v50) --[[ Line: 253 ]] --[[ Name: makeChangeRequest ]]
            -- upvalues: v47 (copy), v7 (ref)
            v47(v7(v48, v49, v50));
        end
    };
end;
v17 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v17);
return v3.connect(nil, v51)(v17);