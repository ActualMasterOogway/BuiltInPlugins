local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_Parent_0.Src.Util;
local v7 = require(l_Util_0.Constants);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v9 = require(l_Actions_0.SetCurrentScreen);
local l_Components_0 = l_Parent_0.Src.Components;
local v11 = require(l_Components_0.ConvertToPackageWindow.LoadingBar);
local v12 = require(l_Components_0.ConvertToPackageWindow.AssetThumbnailPreview);
local v13 = v2.PureComponent:extend("AssetUpload");
v13.init = function(v14, _) --[[ Line: 41 ]] --[[ Name: init ]]
    v14.state = {
        isLoading = true
    };
end;
v13.render = function(v16) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v12 (copy), v11 (copy)
    local l_props_0 = v16.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_assetName_0 = l_props_0.assetName;
    return v2.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.typeValidation.background, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Size = l_props_0.Size
    }, {
        ModelPreview = v2.createElement(v12, {
            titleHeight = 24, 
            titlePadding = 12, 
            title = l_assetName_0, 
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 186)
        }), 
        LoadingBar = v2.createElement(v11, {
            loadingText = l_Localization_0:getText("Action", "Converting"), 
            loadingTime = 0.5, 
            holdPercent = 0.92, 
            Size = UDim2.new(0, 400, 0, 6), 
            Position = UDim2.new(0.5, -200, 0, 314), 
            onFinish = l_props_0.uploadSucceeded ~= nil and l_props_0.onNext or nil
        })
    });
end;
v13 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13);
return v3.connect(function(v21, _) --[[ Line: 83 ]] --[[ Name: mapStateToProps ]]
    v21 = v21 or {};
    return {
        uploadSucceeded = v21.AssetConfigReducer.uploadSucceeded, 
        assetId = v21.AssetConfigReducer.assetId, 
        assetName = v21.AssetConfigReducer.assetName
    };
end, function(v23) --[[ Line: 93 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy), v7 (copy)
    return {
        onNext = function() --[[ Line: 95 ]] --[[ Name: onNext ]]
            -- upvalues: v23 (copy), v9 (ref), v7 (ref)
            v23(v9(v7.SCREENS.UPLOAD_ASSET_RESULT));
        end
    };
end)(v13);