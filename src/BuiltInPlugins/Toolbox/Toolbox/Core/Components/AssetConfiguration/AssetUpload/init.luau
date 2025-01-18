local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.AssetConfigConstants);
local l_PreviewTypes_0 = v6.PreviewTypes;
local v8 = require(l_Util_0.AssetConfigUtil);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v10 = require(l_Actions_0.SetCurrentScreen);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_AssetConfiguration_0 = l_Parent_0.Core.Components.AssetConfiguration;
local v14 = require(l_AssetConfiguration_0.LoadingBarWrapper);
local v15 = require(l_AssetConfiguration_0.ProgressBarWrapper);
local v16 = require(l_AssetConfiguration_0.AssetThumbnailPreview);
local v17 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFilterMeshPartsInBundleUpload);
local v18 = v2.PureComponent:extend("AssetUpload");
v18.init = function(v19, _) --[[ Line: 51 ]] --[[ Name: init ]]
    v19.state = {
        isLoading = true
    };
end;
v18.render = function(v21) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_PreviewTypes_0 (copy), v2 (copy), v16 (copy), v17 (copy), v15 (copy), v14 (copy)
    local l_props_0 = v21.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v24 = v8.getPreviewType(l_props_0.assetTypeEnum, l_props_0.instances);
    local v25 = v24 == l_PreviewTypes_0.ModelPreview;
    local v26 = true;
    if v24 ~= l_PreviewTypes_0.Thumbnail then
        v26 = v24 == l_PreviewTypes_0.ImagePicker;
    end;
    return v2.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.typeValidation.background, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Size = l_props_0.Size
    }, {
        ModelPreview = v25 and v2.createElement(v16, {
            title = l_props_0.assetName, 
            titleHeight = 24, 
            titlePadding = 12, 
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 186), 
            AssetType = if v17() then l_props_0.assetTypeEnum else nil, 
            AllowedBundleTypeSettings = if v17() and v8.isUGCBundleType(l_props_0.assetTypeEnum) then l_props_0.allowedBundleTypeSettings else nil
        }), 
        ThumbnailPreview = v26 and v2.createElement("ImageLabel", {
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 150), 
            Image = v8.getResultThumbnail(l_props_0.assetId, l_props_0.iconFile), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }), 
        LoadingBar = if v8.isUGCBundleType(l_props_0.assetTypeEnum) then v2.createElement(v15, {
            onFinish = l_props_0.onNext
        }) else v2.createElement(v14, {
            loadingText = "Uploading", 
            loadingTime = 0.5, 
            holdPercent = 0.92, 
            Size = UDim2.new(0, 400, 0, 6), 
            Position = UDim2.new(0.5, -200, 0, 314), 
            onFinish = l_props_0.uploadSucceeded ~= nil and l_props_0.onNext or nil
        })
    });
end;
local function v29(v27, _) --[[ Line: 108 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v17 (copy)
    v27 = v27 or {};
    return {
        uploadSucceeded = v27.uploadSucceeded, 
        instances = v27.instances, 
        assetId = v27.assetId, 
        assetName = v27.changed and v27.changed.AssetConfigName or v27.assetName, 
        screenFlowType = v27.screenFlowType, 
        assetTypeEnum = v27.assetTypeEnum, 
        thumbnailStatus = v27.thumbnailStatus, 
        iconFile = v27.iconFile, 
        allowedBundleTypeSettings = if v17() then v27.allowedBundleTypeSettings else nil
    };
end;
local function v31(v30) --[[ Line: 128 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy), v6 (copy)
    return {
        onNext = function() --[[ Line: 130 ]] --[[ Name: onNext ]]
            -- upvalues: v30 (copy), v10 (ref), v6 (ref)
            v30(v10(v6.SCREENS.UPLOAD_ASSET_RESULT));
        end
    };
end;
v18 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v18);
return v3.connect(v29, v31)(v18);