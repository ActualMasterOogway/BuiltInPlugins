local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_Components_0 = l_Parent_0.Src.Components;
local v5 = require(l_Components_0.ConvertToPackageWindow.AssetConfig);
local v6 = require(l_Components_0.ConvertToPackageWindow.AssetUpload);
local v7 = require(l_Components_0.ConvertToPackageWindow.AssetUploadResult);
local v8 = require(l_Parent_0.Src.Util.Constants);
local function _(v9) --[[ Line: 22 ]] --[[ Name: showAssetConfig ]]
    -- upvalues: v8 (copy)
    return v9 == v8.SCREENS.CONFIGURE_ASSET;
end;
local function _(v11) --[[ Line: 26 ]] --[[ Name: showAssetUpload ]]
    -- upvalues: v8 (copy)
    return v11 == v8.SCREENS.UPLOADING_ASSET;
end;
local function _(v13) --[[ Line: 30 ]] --[[ Name: showAssetUploadResult ]]
    -- upvalues: v8 (copy)
    return v13 == v8.SCREENS.UPLOAD_ASSET_RESULT;
end;
local v15 = v2.PureComponent:extend("ScreenSelect");
v15.render = function(v16) --[[ Line: 36 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v8 (copy), v5 (copy), v6 (copy), v7 (copy)
    local l_props_0 = v16.props;
    local l_currentScreen_0 = l_props_0.currentScreen;
    local v19 = UDim2.new(1, 0, 1, 0);
    local l_onClose_0 = l_props_0.onClose;
    local l_instances_0 = l_props_0.instances;
    local l_assetName_0 = l_props_0.assetName;
    local l_pluginGui_0 = l_props_0.pluginGui;
    return v2.createElement("Frame", {
        Size = v19, 
        BackgroundTransparency = 1
    }, {
        AssetConfig = l_currentScreen_0 == v8.SCREENS.CONFIGURE_ASSET and v2.createElement(v5, {
            Size = v19, 
            assetName = l_assetName_0, 
            onClose = l_onClose_0, 
            pluginGui = l_pluginGui_0, 
            instances = l_instances_0
        }), 
        AssetUpload = l_currentScreen_0 == v8.SCREENS.UPLOADING_ASSET and v2.createElement(v6, {
            Size = v19, 
            onClose = l_onClose_0, 
            instances = l_instances_0
        }), 
        AssetUploadResult = l_currentScreen_0 == v8.SCREENS.UPLOAD_ASSET_RESULT and v2.createElement(v7, {
            Size = v19, 
            onClose = l_onClose_0, 
            instances = l_instances_0
        })
    });
end;
return v3.connect(function(v24, _) --[[ Line: 70 ]] --[[ Name: mapStateToProps ]]
    return {
        currentScreen = (v24 or {}).AssetConfigReducer.currentScreen
    };
end)(v15);