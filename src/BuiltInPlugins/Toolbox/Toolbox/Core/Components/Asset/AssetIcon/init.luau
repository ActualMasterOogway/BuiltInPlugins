local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_Util_0 = l_Parent_0.Core.Util;
local v7 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v8 = require(l_Util_0.Constants);
local v9 = require(l_Util_0.Images);
local v10 = require(l_Util_0.Urls);
local l_Types_0 = l_Parent_0.Core.Types;
local v12 = require(l_Types_0.Category);
local v13 = require(l_Parent_0.Core.Components.Asset.AssetIconBadge);
local v14 = require(l_Parent_0.Core.Components.Asset.AssetBackground);
local v15 = require(l_Parent_0.Core.Components.Audio.AudioPreviewButton);
local v16 = require(l_Parent_0.Core.Components.Audio.AudioProgressBar);
local v17 = require(l_Parent_0.Core.Components.ImageWithDefault);
local v18 = require(l_Parent_0.Core.Components.TooltipWrapper);
local v19 = require(l_Parent_0.Core.Components.Asset.Preview.PopUpWrapperButton);
local v20 = require(l_Parent_0.Core.ContextServices.ModalContext);
local l_ImageCarousel_0 = v4.UI.ImageCarousel;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v24 = v2.PureComponent:extend("AssetIcon");
local v25 = UDim2.new(1, -14, 0, 14);
local v26 = UDim2.new(0, 14, 0, 14);
local v27 = UDim2.new(0, 16, 0, 16);
v24._createImageDataForCarousel = function(v28, v29, v30) --[[ Line: 52 ]] --[[ Name: _createImageDataForCarousel ]]
    -- upvalues: v5 (copy), v10 (copy), v8 (copy)
    local v31 = v28.props or v30;
    local v32 = nil;
    local l_assetMediaIds_0 = v31.assetMediaIds;
    if type(l_assetMediaIds_0) == "table" and #l_assetMediaIds_0 > 0 then
        v32 = if v29 then {
            v31.assetId
        } else {
            v28.thumbnailUrl
        };
        v5.forEach(l_assetMediaIds_0, function(v34) --[[ Line: 60 ]]
            -- upvalues: v29 (copy), v32 (ref), v10 (ref), v8 (ref)
            if v29 then
                table.insert(v32, v34);
                return;
            else
                local v35 = v10.constructAssetThumbnailUrl(v34, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE);
                table.insert(v32, v35);
                return;
            end;
        end);
    end;
    return v32;
end;
v24.init = function(v36, v37) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), v8 (copy)
    v36.thumbnailUrl = v10.constructAssetThumbnailUrl(v37.assetId, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE);
    v36.state = {
        isHovered = false, 
        imageUrlsForCarousel = v36:_createImageDataForCarousel(false, v37), 
        imageIdsForCarousel = v36:_createImageDataForCarousel(true, v37)
    };
    v36.onMouseEnter = function() --[[ Line: 90 ]]
        -- upvalues: v36 (copy), v37 (copy), v8 (ref)
        v36:setState({
            isHovered = true
        });
        v37.Modal.onTooltipTriggered(v37.assetId, v8.TOOLTIP_TYPE.ASSET_ICON);
    end;
    v36.onMouseLeave = function() --[[ Line: 99 ]]
        -- upvalues: v36 (copy)
        v36:setState({
            isHovered = false
        });
    end;
    v36.onAssetPreviewButtonClicked = function() --[[ Line: 105 ]]
        -- upvalues: v36 (copy)
        v36.props.onAssetPreviewButtonClicked();
    end;
    v36.assetMediaLogged = {};
    v36.LogAssetMediaImpression = function(v38, _) --[[ Line: 110 ]]
        -- upvalues: v37 (copy), v8 (ref), v36 (copy)
        local l_assetTileLocation_0 = v37.assetTileLocation;
        local v41 = l_assetTileLocation_0 == v8.ASSET_TILE_LOCATION.MORE_FROM;
        if v36.assetMediaLogged[v38] then
            return;
        else
            v36.assetMediaLogged[v38] = true;
            local v42 = if v41 then v8.ASSET_MEDIA_IMPRESSION_SOURCE.ON_HOVER_MORE_FROM else if l_assetTileLocation_0 == v8.ASSET_TILE_LOCATION.BROWSE then v8.ASSET_MEDIA_IMPRESSION_SOURCE.ON_HOVER_BROWSE else "";
            v36.props.AssetAnalytics:get():logAssetMediaImpression(v36.props.assetData, v36.state.imageIdsForCarousel[v38], v38, v36.props.searchId, v42, if v41 then v36.props.originalAssetId else nil);
            return;
        end;
    end;
    v36.OnImageCarouselChange = function(v43, v44) --[[ Line: 133 ]]
        -- upvalues: v36 (copy)
        v36.LogAssetMediaImpression(v43, v44);
    end;
    v36.OnSetImageCarouselImages = function(v45) --[[ Line: 138 ]]
        -- upvalues: v36 (copy)
        v36.LogAssetMediaImpression(v45, true);
    end;
end;
v24.didUpdate = function(v46, v47) --[[ Line: 143 ]] --[[ Name: didUpdate ]]
    -- upvalues: v10 (copy), v8 (copy)
    local l_props_0 = v46.props;
    if v47.assetId ~= l_props_0.assetId then
        v46.thumbnailUrl = v10.constructAssetThumbnailUrl(l_props_0.assetId, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE);
    end;
    if v47.assetMediaIds ~= l_props_0.assetMediaIds then
        v46:setState({
            imageUrlsForCarousel = v46:_createImageDataForCarousel(false, nil), 
            imageIdsForCarousel = v46:_createImageDataForCarousel(true, nil)
        });
    end;
end;
v24.render = function(v49) --[[ Line: 161 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v9 (copy), v12 (copy), v2 (copy), l_ImageCarousel_0 (copy), v17 (copy), v13 (copy), v15 (copy), v16 (copy), v19 (copy), v25 (copy), v26 (copy), v27 (copy), v18 (copy), v14 (copy)
    local l_props_1 = v49.props;
    local l_assetId_0 = l_props_1.assetId;
    local l_assetName_0 = l_props_1.assetName;
    local v53 = l_props_1.LayoutOrder or 0;
    local l_backgroundIndex_0 = l_props_1.backgroundIndex;
    local l_isEndorsed_0 = l_props_1.isEndorsed;
    local l_typeId_0 = l_props_1.typeId;
    local l_isPackage_0 = l_props_1.isPackage;
    local l_currentSoundId_0 = l_props_1.currentSoundId;
    local l_isLoading_0 = l_props_1.isLoading;
    local l_onMouseEnter_0 = v49.onMouseEnter;
    local l_onMouseLeave_0 = v49.onMouseLeave;
    local l_isHovered_0 = v49.state.isHovered;
    local l_isHovered_1 = l_props_1.isHovered;
    local l_status_0 = l_props_1.status;
    local l_thumbnailUrl_0 = v49.thumbnailUrl;
    local v66 = l_props_1.Modal.modalStatus:canShowCurrentTooltip(l_assetId_0, v8.TOOLTIP_TYPE.ASSET_ICON);
    local v67 = l_typeId_0 == Enum.AssetType.Audio.Value;
    local v68 = l_status_0 and v9.AssetStatus[l_status_0];
    local v69 = v12.getTabForCategoryName(l_props_1.categoryName) == v12.CREATIONS;
    local v70 = {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v8.ASSET_CORNER_RADIUS)
        }), 
        AssetImage = if v49.state.imageUrlsForCarousel ~= nil then v2.createElement(l_ImageCarousel_0, {
            AutoAdvanceTimer = v8.ASSET_TILE_IMAGE_CAROUSEL_AUTO_ADVANCE_TIMER, 
            ImageScaleType = Enum.ScaleType.Crop, 
            ImageCornerRadius = v8.ASSET_CORNER_RADIUS, 
            ImageStrings = v49.state.imageUrlsForCarousel, 
            OnImageChange = v49.OnImageCarouselChange, 
            OnImageChangeTransparencyThreshold = v8.IMAGE_CAROUSEL_ON_IMAGE_CHANGE_TRANSPARENCY_THRESHOLD, 
            OnSetImages = v49.OnSetImageCarouselImages, 
            ResetWhenHoveredOff = true, 
            Size = UDim2.new(1, 0, 1, 0)
        }) else v2.createElement(v17, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Image = l_thumbnailUrl_0, 
            defaultImage = ""
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v8.ASSET_CORNER_RADIUS)
            })
        }), 
        Badge = if not not l_isEndorsed_0 or l_isPackage_0 then v2.createElement(v13, {
            assetId = l_assetId_0, 
            isPackage = l_isPackage_0, 
            floatLeft = v67
        }) else nil, 
        PreviewAudioButton = v67 and v2.createElement(v15, {
            ZIndex = 3, 
            assetId = l_assetId_0, 
            currentSoundId = l_currentSoundId_0, 
            isLoading = l_isLoading_0
        }), 
        AudioProgressBar = v67 and v2.createElement(v16, {
            AnchorPoint = Vector2.new(0, 1), 
            assetId = l_assetId_0, 
            currentSoundId = l_currentSoundId_0, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 0, 2)
        }), 
        AssetPreviewTriggerButton = not v69 and v2.createElement(v19, {
            position = v25, 
            ShowIcon = l_isHovered_1, 
            onClick = v49.onAssetPreviewButtonClicked, 
            ZIndex = 2
        }), 
        AssetStatus = l_isHovered_1 and v68 and v2.createElement("ImageLabel", {
            Position = v26, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = v27, 
            Image = v68, 
            BackgroundTransparency = 1
        }), 
        TooltipWrapper = l_isHovered_0 and v2.createElement(v18, {
            Text = l_assetName_0, 
            canShowCurrentTooltip = v66, 
            isHovered = l_isHovered_0
        })
    };
    return v2.createElement(v14, {
        backgroundIndex = l_backgroundIndex_0, 
        Size = UDim2.new(1, 0, 1, 0), 
        SizeConstraint = Enum.SizeConstraint.RelativeXX, 
        ZIndex = 1, 
        LayoutOrder = v53, 
        [v2.Event.MouseEnter] = l_onMouseEnter_0, 
        [v2.Event.MouseLeave] = l_onMouseLeave_0
    }, v70);
end;
v24 = l_withContext_0({
    AssetAnalytics = v7, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v20
})(v24);
return v3.connect(function(v71, v72) --[[ Line: 288 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v12 (copy)
    v71 = v71 or {};
    local v73 = if v71.assets.idToAssetMap ~= nil then v71.assets.idToAssetMap[v72.assetId] else nil;
    local v74 = v71.sound or {};
    local v75 = v71.pageInfo or {};
    local v76 = v75.selectedBackgroundIndex or 1;
    local v77 = v75.hoveredBackgroundIndex or 0;
    local v78 = v75.categoryName or v12.DEFAULT.name;
    return {
        assetData = v73, 
        assetMediaIds = if v73 and v73.Asset then v73.Asset.AssetMediaIds else nil, 
        backgroundIndex = v77 ~= 0 and v77 or v76, 
        categoryName = v78, 
        elapsedTime = v74.elapsedTime or 0, 
        searchId = v75.searchId, 
        totalTime = v74.totalTime or 0
    };
end, nil)(v24);