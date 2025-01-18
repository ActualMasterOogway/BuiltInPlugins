local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local l_Util_0 = l_Parent_0.Core.Util;
local v8 = require(l_Util_0.Constants);
local v9 = require(l_Util_0.ScreenSetup);
local v10 = require(l_Util_0.AssetConfigConstants);
local v11 = require(l_Util_0.AssetConfigUtil);
local l_Util_1 = require(l_Packages_0.Framework).Util;
local l_StyleModifier_0 = require(l_Packages_0.Framework).Util.StyleModifier;
local l_UI_0 = require(l_Packages_0.Framework).UI;
local l_Button_0 = l_UI_0.Button;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local v17 = require(l_Parent_0.Core.Types.ConfigTypes);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v19 = require(l_Requests_0.ToggleOverrideRequest);
local v20 = require(l_Requests_0.ValidateAnimationRequest);
local l_AssetConfiguration_0 = l_Parent_0.Core.Components.AssetConfiguration;
local v22 = require(l_AssetConfiguration_0.LinkButton);
local v23 = v2.Component:extend("AssetConfigFooter");
local l_AssetConfigFixBadIdVerifyState_0 = game:GetFastFlag("AssetConfigFixBadIdVerifyState");
local v25 = require(l_Parent_0.Core.Flags.getFFlagToolboxAddPackageVersionDescriptions);
local v26 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixDoublePublish);
local v27 = require(l_Parent_0.Core.Flags.getFFlagToolboxSaveOrImportButton);
local v28 = utf8.char(57346);
v23.init = function(v29, v30) --[[ Line: 68 ]] --[[ Name: init ]]
    -- upvalues: v26 (copy)
    v29.hideInvalidAnimationID = true;
    v29.onFlowButtonActivated = function() --[[ Line: 71 ]]
        -- upvalues: v30 (copy), v29 (copy)
        v30.toggleOverride(v29.props.currentTab);
    end;
    v29.state = {
        animationId = "", 
        disablePublish = not v26() and nil
    };
    v29.onAnimationIDChanged = function(v31) --[[ Line: 80 ]]
        -- upvalues: v29 (copy)
        v31 = string.gsub(v31, "[\n\r]", " ");
        if v29.props.validateAnimation then
            v29.props.validateAnimation({
                networkInterface = v29.props.Network.networkInterface, 
                assetId = v31
            });
        end;
        v29:setState({
            animationId = v31
        });
    end;
end;
v23.shouldUpdate = function(v32, v33, v34) --[[ Line: 94 ]] --[[ Name: shouldUpdate ]]
    -- upvalues: l_AssetConfigFixBadIdVerifyState_0 (copy), l_Util_1 (copy)
    if v34 ~= v32.state then
        return true;
    else
        if l_AssetConfigFixBadIdVerifyState_0 then
            local l_hideInvalidAnimationID_0 = v32.hideInvalidAnimationID;
            if v34.animationId == "" then
                v32.hideInvalidAnimationID = true;
            else
                v32.hideInvalidAnimationID = v33.validateAnimationSucceeded or tostring(v33.AssetId) == v34.animationId;
            end;
            if l_hideInvalidAnimationID_0 ~= v32.hideInvalidAnimationID then
                return true;
            end;
        end;
        if l_Util_1.deepEqual(v33, v32.props) then
            return false;
        else
            return true;
        end;
    end;
end;
v23.getUploadFeeWithRobuxIcon = function(v36, v37) --[[ Line: 122 ]] --[[ Name: getUploadFeeWithRobuxIcon ]]
    -- upvalues: v28 (copy)
    return v36.props.Localization:getText("AssetConfigFooter", "UploadFeeWithRobuxIcon", {
        price = v28 .. v37
    });
end;
v23.render = function(v38) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: l_AssetConfigFixBadIdVerifyState_0 (copy), v9 (copy), v17 (copy), v10 (copy), v26 (copy), v25 (copy), v27 (copy), v11 (copy), v2 (copy), l_DEPRECATED_TextInput_0 (copy), v8 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy), v22 (copy)
    local l_props_0 = v38.props;
    local l_state_0 = v38.state;
    local l_Stylizer_0 = v38.props.Stylizer;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_TryPublish_0 = l_props_0.TryPublish;
    local l_TryCancel_0 = l_props_0.TryCancel;
    local l_footer_0 = l_Stylizer_0.footer;
    local l_CanSave_0 = l_props_0.CanSave;
    local l_screenFlowType_0 = l_props_0.screenFlowType;
    local l_assetTypeEnum_0 = l_props_0.assetTypeEnum;
    local l_currentTab_0 = l_props_0.currentTab;
    local l_validateAnimationSucceeded_0 = l_props_0.validateAnimationSucceeded;
    local v52 = l_validateAnimationSucceeded_0 or l_state_0.animationId == "";
    if l_AssetConfigFixBadIdVerifyState_0 then
        v52 = v38.hideInvalidAnimationID;
    end;
    local v53 = v9.queryParam(l_screenFlowType_0, l_assetTypeEnum_0, v9.keys.SHOW_OVERRIDE_BUTTON);
    local v54 = nil;
    v54 = if v17:isOverride(l_currentTab_0) then l_props_0.Localization:getText("AssetConfigFooter", "NewAsset") else l_props_0.Localization:getText("AssetConfigFooter", "Override");
    local v55 = false;
    if l_assetTypeEnum_0 == Enum.AssetType.Animation then
        v55 = v17:isOverride(l_currentTab_0);
    end;
    local v56 = v55 and v10.FLOW_TYPE.DOWNLOAD_FLOW == l_props_0.screenFlowType;
    local v57 = l_props_0.AssetId or l_state_0.animationID;
    local v58 = false;
    local v59 = if v26() then l_CanSave_0 and not l_state_0.disablePublish else l_CanSave_0;
    if v56 then
        if not l_CanSave_0 then
            v59 = l_validateAnimationSucceeded_0;
        elseif not l_validateAnimationSucceeded_0 then
            v59 = false;
        end;
        if v57 then
            v58 = utf8.len(v57) > 32;
        end;
    end;
    local v60 = nil;
    v60 = if v25() then if v27() and v56 then l_props_0.Localization:getText("Common", "Import") else l_props_0.Localization:getText("Common", "Save") else l_props_0.Localization:getText("Common", "Submit");
    local v61 = v11.isCatalogAsset(l_assetTypeEnum_0) or v11.isUGCBundleType(l_assetTypeEnum_0);
    if l_screenFlowType_0 == v10.FLOW_TYPE.UPLOAD_FLOW and v61 then
        if l_props_0.isUploadFeeEnabled then
            if l_props_0.uploadFee > 0 then
                v60 = v38:getUploadFeeWithRobuxIcon(l_props_0.uploadFee);
            end;
            if not l_props_0.canAffordUploadFee then
                v59 = false;
            end;
        elseif l_props_0.isUploadFeeEnabled == nil then
            v59 = false;
        end;
    end;
    return v2.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_footer_0.backgroundColor, 
        BorderColor3 = l_footer_0.borderColor, 
        BorderSizePixel = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24), 
            PaddingTop = UDim.new(0, 0)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 24)
        }), 
        AnimationIdBox = v56 and v2.createElement("Frame", {
            Size = UDim2.new(0, 160, 0, 40), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 3
        }, {
            TextField = v2.createElement(l_DEPRECATED_TextInput_0, {
                ForceOnTextChange = true, 
                OnTextChanged = v38.onAnimationIDChanged, 
                PlaceholderText = l_props_0.Localization:getText("AssetConfigAnimation", "AnimationID"), 
                Size = UDim2.new(1, 0, 1, 0), 
                Style = v58 and "FilledRoundedRedBorder" or "FilledRoundedBorder", 
                Text = v57 and tostring(v57) or nil
            })
        }), 
        InvalidAnimationLabel = v56 and not v52 and v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v8.FONT, 
            Text = l_props_0.Localization:getText("AssetConfigAnimation", "InvalidAnimationID"), 
            TextColor3 = l_Stylizer_0.redText, 
            TextSize = v8.FONT_SIZE_MEDIUM, 
            Size = UDim2.new(0, 96, 1, 0), 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            LayoutOrder = 2
        }), 
        CancelButton = v2.createElement(l_Button_0, {
            LayoutOrder = 4, 
            OnClick = l_TryCancel_0, 
            Style = "Round", 
            Size = UDim2.new(0, 140, 0, 40), 
            Text = l_props_0.Localization:getText("General", "SearchOptionsCancel")
        }), 
        PublishButton = v2.createElement(l_Button_0, {
            LayoutOrder = 5, 
            OnClick = function() --[[ Line: 271 ]] --[[ Name: OnClick ]]
                -- upvalues: v59 (ref), v26 (ref), v38 (copy), l_TryPublish_0 (copy)
                if v59 then
                    if v26() then
                        v38:setState({
                            disablePublish = true
                        }, function() --[[ Line: 276 ]]
                            -- upvalues: l_TryPublish_0 (ref), v38 (ref)
                            l_TryPublish_0(v38.state.animationId);
                        end);
                        return;
                    else
                        l_TryPublish_0(v38.state.animationId);
                    end;
                end;
            end, 
            Style = "RoundPrimary", 
            StyleModifier = not v59 and l_StyleModifier_0.Disabled or nil, 
            Size = UDim2.new(0, 140, 0, 40), 
            Text = v60
        }), 
        ToggleOverrideButton = v53 and v2.createElement(v22, {
            Size = UDim2.new(1, -328, 0, 20), 
            Text = v54, 
            TextSize = v8.FONT_SIZE_MEDIUM, 
            Font = v8.FONT, 
            onActivated = v38.onFlowButtonActivated, 
            LayoutOrder = 1
        })
    });
end;
local function v64(v62, _) --[[ Line: 302 ]] --[[ Name: mapStateToProps ]]
    v62 = v62 or {};
    return {
        currentTab = v62.currentTab, 
        instances = v62.instances, 
        screenFlowType = v62.screenFlowType, 
        assetTypeEnum = v62.assetTypeEnum, 
        isUploadFeeEnabled = v62.isUploadFeeEnabled, 
        uploadFee = v62.uploadFee, 
        canAffordUploadFee = v62.canAffordUploadFee, 
        validateAnimationSucceeded = v62.validateAnimationSucceeded
    };
end;
local function v68(v65) --[[ Line: 320 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy), v20 (copy)
    return {
        toggleOverride = function(v66) --[[ Line: 323 ]] --[[ Name: toggleOverride ]]
            -- upvalues: v65 (copy), v19 (ref)
            v65(v19(v66));
        end, 
        validateAnimation = function(v67) --[[ Line: 328 ]]
            -- upvalues: v65 (copy), v20 (ref)
            v65(v20(v67));
        end
    };
end;
v23 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v6
})(v23);
return v3.connect(v64, v68)(v23);