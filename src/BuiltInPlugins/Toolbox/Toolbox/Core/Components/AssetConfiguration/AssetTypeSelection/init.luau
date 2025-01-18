local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local _ = require(l_Util_0.AssetConfigConstants);
local v7 = require(l_Util_0.AssetConfigUtil);
local v8 = require(l_Util_0.getAllowedAssetTypeEnums);
local v9 = require(l_Parent_0.Core.Localization.getLocalizedAssetTextMap);
local l_Components_0 = l_Parent_0.Core.Components;
local v11 = require(l_Components_0.NavButton);
local v12 = require(l_Components_0.AssetConfiguration.AssetThumbnailPreview);
local v13 = require(l_Components_0.AssetConfiguration.DefaultThumbnailPreview);
local v14 = require(l_Components_0.AssetConfiguration.AssetTypeSelector);
local l_UseDefaultThumbnailForAnimation_0 = game:GetFastFlag("UseDefaultThumbnailForAnimation");
local l_Actions_0 = l_Parent_0.Core.Actions;
local _ = require(l_Actions_0.SetCurrentScreen);
local v18 = require(l_Actions_0.SetUploadAssetType);
local l_Thunks_0 = l_Parent_0.Core.Thunks;
local v20 = require(l_Thunks_0.AssetConfiguration.GoToNextScreen);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v23 = v2.PureComponent:extend("AssetTypeSelection");
v23.didMount = function(v24) --[[ Line: 55 ]] --[[ Name: didMount ]]
    if v24:canSkip() then
        v24.props.goToNextScreen();
    end;
end;
v23.getSelectorItems = function(v25) --[[ Line: 61 ]] --[[ Name: getSelectorItems ]]
    -- upvalues: v8 (copy), v9 (copy)
    local v26 = {
        {
            name = "Game development assets", 
            selectable = false
        }, 
        {
            name = "Model", 
            selectable = true, 
            type = Enum.AssetType.Model
        }
    };
    table.insert(v26, {
        name = "Animation", 
        selectable = true, 
        type = Enum.AssetType.Animation
    });
    local v27 = v8(v25.props.allowedAssetTypesForRelease);
    if #v27 > 0 then
        local v28 = v25.props.Localization:getText("General", "CategoryCreationsCatalogSectionDivider") or "";
        v26[#v26 + 1] = {
            name = v28, 
            selectable = false
        };
        for _, v30 in pairs(v27) do
            local v31 = v9(v25.props.Localization)[v30] or "";
            v26[#v26 + 1] = {
                name = v31, 
                selectable = true, 
                type = v30
            };
        end;
    end;
    return v26;
end;
v23.canSkip = function(v32) --[[ Line: 90 ]] --[[ Name: canSkip ]]
    -- upvalues: v7 (copy)
    if v7.isBuyableMarketplaceAsset(v32.props.assetTypeEnum) then
        return true;
    else
        local v33 = 0;
        for _, v35 in pairs(v32:getSelectorItems()) do
            if v35.selectable then
                v33 = v33 + 1;
            end;
        end;
        return v33 == 2;
    end;
end;
v23.render = function(v36) --[[ Line: 104 ]] --[[ Name: render ]]
    -- upvalues: l_UseDefaultThumbnailForAnimation_0 (copy), v2 (copy), v12 (copy), v13 (copy), v14 (copy), v11 (copy)
    local l_props_0 = v36.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v39 = l_UseDefaultThumbnailForAnimation_0 and v36.props.assetTypeEnum == Enum.AssetType.Animation;
    return v2.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.typeSelection.background, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Size = l_props_0.Size
    }, {
        AssetThumbnailPreview = not v39 and v2.createElement(v12, {
            Size = UDim2.new(0, 150, 0, 186), 
            Position = UDim2.new(0.5, -75, 0, 48), 
            titleHeight = 24, 
            titlePadding = 12
        }), 
        DefaultThumbnailPreview = v39 and v2.createElement(v13, {
            Size = UDim2.new(0, 150, 0, 186), 
            Position = UDim2.new(0.5, -75, 0, 48)
        }), 
        AssetTypeSelector = v2.createElement(v14, {
            Position = UDim2.new(0.5, -200, 0, 310), 
            height = 40, 
            width = 400, 
            assetTypeEnum = v36.props.assetTypeEnum, 
            onAssetTypeSelected = v36.props.onAssetTypeSelected, 
            items = v36:getSelectorItems()
        }), 
        Footer = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 62), 
            Position = UDim2.new(0, 0, 1, -62), 
            BackgroundColor3 = l_Stylizer_0.typeSelection.configFooter.background, 
            BorderColor3 = l_Stylizer_0.typeSelection.configFooter.border
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 24), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 24)
            }), 
            CancelButton = v2.createElement(v11, {
                Size = UDim2.new(0, 120, 0, 32), 
                LayoutOrder = 0, 
                titleText = "Cancel", 
                onClick = l_props_0.onClose
            }), 
            NextButton = v2.createElement(v11, {
                Size = UDim2.new(0, 120, 0, 32), 
                LayoutOrder = 1, 
                titleText = "Next", 
                isPrimary = true, 
                onClick = function() --[[ Line: 167 ]] --[[ Name: onClick ]]
                    -- upvalues: v36 (copy)
                    v36.props.goToNextScreen();
                end
            })
        })
    });
end;
local function v42(v40, _) --[[ Line: 175 ]] --[[ Name: mapStateToProps ]]
    v40 = v40 or {};
    return {
        instances = v40.instances, 
        currentScreen = v40.currentScreen, 
        screenFlowType = v40.screenFlowType, 
        allowedAssetTypesForRelease = v40.allowedAssetTypesForRelease, 
        assetTypeEnum = v40.assetTypeEnum
    };
end;
local function v45(v43) --[[ Line: 187 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v20 (copy), v18 (copy)
    return {
        goToNextScreen = function() --[[ Line: 190 ]] --[[ Name: goToNextScreen ]]
            -- upvalues: v43 (copy), v20 (ref)
            v43(v20());
        end, 
        onAssetTypeSelected = function(v44) --[[ Line: 193 ]] --[[ Name: onAssetTypeSelected ]]
            -- upvalues: v43 (copy), v18 (ref)
            v43(v18(v44));
        end
    };
end;
v23 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v23);
return v3.connect(v42, v45)(v23);