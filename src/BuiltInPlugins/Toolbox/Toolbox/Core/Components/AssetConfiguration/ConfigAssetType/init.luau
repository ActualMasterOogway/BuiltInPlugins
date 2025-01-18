local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Roact);
local v6 = require(l_Packages_0.RoactRodux);
local v7 = require(l_Packages_0.UGCValidation);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v11 = require(l_Util_0.Analytics.Analytics);
local v12 = require(l_Util_0.AssetConfigUtil);
local v13 = require(l_Util_0.fixUpPreValidation);
local v14 = require(l_Util_0.Constants);
local v15 = require(l_Util_0.DebugFlags);
local v16 = require(l_Util_0.Images);
local v17 = require(l_Util_0.SharedFlags.getFFlagUGCBundleValidationFullBodyErrors);
local v18 = require(l_Util_0.getAllowedAssetTypeEnums);
local v19 = require(l_script_FirstAncestor_0.Core.Localization.getLocalizedAssetTextMap);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local v26 = require(l_script_FirstAncestor_0.Core.Actions.SetUploadAssetType);
local v27 = require(l_script_FirstAncestor_0.Core.Actions.SetUploadAssetValidationStatus);
local v28 = require(l_script_FirstAncestor_0.Core.Components.DropdownMenu);
local v29 = require(l_script_FirstAncestor_0.Core.Components.MessageBox.MessageBox);
local l_AssetConfiguration_0 = l_script_FirstAncestor_0.Core.Components.AssetConfiguration;
local v31 = require(l_AssetConfiguration_0.ConfigSectionWrapper);
local v32 = require(l_AssetConfiguration_0.UGCBundleValidation);
local v33 = require(l_AssetConfiguration_0.ValidationStatus);
local v34 = require(l_Util_0.AssetConfigConstants);
local v35 = require(l_AssetConfiguration_0.DataConsentToggle);
game:DefineFastFlag("BodyFirstInAssetsCategory", false);
local v36 = game:DefineFastFlag("DisableSubmitButtonForValidationInInit", false);
local v37 = require(l_Util_0.SharedFlags.getFFlagEnableUGCMissingPartsMessage);
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local v39 = require(l_Util_0.SharedFlags.getFFlagEnableUGCUploadFlowAnalytics);
local v40 = require(l_Util_0.SharedFlags.getFFlagEnableUGCForAllChecks);
local v41 = game:DefineFastString("ToolboxConfigAssetTypeAgeIDVerificationLink", "https://en.help.roblox.com/hc/en-us/articles/4407282410644-Age-ID-Verification");
local v42 = game:DefineFastString("ToolboxConfigAssetTypePremiumLink", "https://www.roblox.com/premium/membership");
local v43 = game:DefineFastFlag("ToolboxFixUGCBundleValidationCryoThingy1", false);
local v44 = game:DefineFastFlag("DisableClickableErrorsBundlePublish", false);
local v45 = v5.PureComponent:extend("ConfigAssetType");
local v46 = (not not v37() or l_EnableUGCBundleUnknownMeshPartFiltering_0) and 18 or nil;
local v47 = v40() and 10 or 0;
local v48 = v40() and 72 or 24;
local v49 = {};
if game:GetFastFlag("BodyFirstInAssetsCategory") then
    v49 = {
        v34.UGCBundleTypes.Body, 
        v34.UGCBundleTypes.DynamicHead
    };
end;
local v50 = {
    NONE = "None", 
    BEGIN = "Begin", 
    VALIDATING = "Validating", 
    SUCCESS = "Success", 
    FAILURE = "Failure"
};
local function _(v51) --[[ Line: 164 ]] --[[ Name: shouldValidateAssetType ]]
    -- upvalues: v12 (copy)
    return v12.isCatalogAsset(v51) or v12.isUGCBundleType(v51);
end;
local _ = function(v53) --[[ Line: 168 ]] --[[ Name: getValidationFailuresAsString ]]
    if not v53 then
        return nil;
    else
        local _ = nil;
        if type(v53) == "table" then
            return (table.concat(v53, "\n"));
        else
            return (tostring(v53));
        end;
    end;
end;
v45.init = function(v56, v57) --[[ Line: 183 ]] --[[ Name: init ]]
    -- upvalues: v50 (copy), v39 (copy), v12 (copy), v15 (copy), v11 (copy), v36 (copy)
    v56.dropdownItems = {};
    local v58, v59 = v56:selectedRadioButtonKeyFor(v57.assetTypeEnum);
    v56.state = {
        currentSelectedRadioButtonKey = v58, 
        currentAssetType = v57.assetTypeEnum, 
        dropdownAvatarCategoryIndex = if v58 == "AvatarItem" then v59 else 0, 
        dropdownDevelopmentCategoryIndex = if v58 == "DevelopmentItem" then v59 else 0, 
        validationState = v50.NONE, 
        validationFailureReasons = {}, 
        displayValidationErrorMessages = false
    };
    v56.setAssetCategoryIndex = function(v60) --[[ Line: 200 ]]
        -- upvalues: v56 (copy)
        if v56.state.currentSelectedRadioButtonKey == "AvatarItem" then
            v56:setState(function() --[[ Line: 204 ]]
                -- upvalues: v60 (copy)
                return {
                    dropdownAvatarCategoryIndex = v60
                };
            end);
            return;
        else
            v56:setState(function() --[[ Line: 208 ]]
                -- upvalues: v60 (copy)
                return {
                    dropdownDevelopmentCategoryIndex = v60
                };
            end);
            return;
        end;
    end;
    v56.onRadioButtonClicked = function(v61) --[[ Line: 214 ]]
        -- upvalues: v56 (copy)
        v56:setState(function() --[[ Line: 215 ]]
            -- upvalues: v61 (copy)
            return {
                currentSelectedRadioButtonKey = v61
            };
        end);
    end;
    v56.openValidationErrorMessageBox = function() --[[ Line: 220 ]]
        -- upvalues: v56 (copy)
        v56:setState(function() --[[ Line: 221 ]]
            return {
                displayValidationErrorMessages = true
            };
        end);
    end;
    v56.onValidationErrorMessageBoxClosed = function() --[[ Line: 228 ]]
        -- upvalues: v56 (copy)
        v56:setState(function() --[[ Line: 229 ]]
            return {
                displayValidationErrorMessages = false
            };
        end);
    end;
    v56.validationCallback = function(v62, v63) --[[ Line: 236 ]]
        -- upvalues: v56 (copy), v39 (ref), v12 (ref), v15 (ref), v50 (ref), v11 (ref)
        local l_state_0 = v56.state;
        local l_props_0 = v56.props;
        local v66 = nil;
        if v39() then
            v66 = v12.getAvatarAssetTypeAsString(l_state_0.currentAssetType);
        end;
        if v15.shouldDebugWarnings() then
            assert(l_state_0.validationState == v50.VALIDATING, "Validation state is expected to be `Validating`.");
        end;
        if v62 then
            v56:setState(function() --[[ Line: 253 ]]
                -- upvalues: v50 (ref)
                return {
                    validationState = v50.SUCCESS, 
                    validationFailureReasons = {}
                };
            end);
            if v39() then
                v11.UGCBundleValidationEvent(v11.Status.Success, v66);
            end;
        else
            if #v63 > 0 then
                local v67 = l_props_0.Localization:getText("AssetConfig", "AssetConfigOutputErrorHeading", {
                    errorCount = #v63
                });
                warn(v67, v63);
            end;
            local v68 = if #v63 > 0 then v63 else {
                l_props_0.Localization:getText("AssetConfig", "ValidationErrorUnknown")
            };
            v56:setState(function() --[[ Line: 272 ]]
                -- upvalues: v50 (ref), v68 (copy)
                return {
                    validationState = v50.FAILURE, 
                    validationFailureReasons = v68
                };
            end);
            if v39() then
                local l_UGCBundleValidationEvent_0 = v11.UGCBundleValidationEvent;
                local l_Failure_0 = v11.Status.Failure;
                local l_v66_0 = v66;
                local v72;
                if not v68 then
                    v72 = nil;
                else
                    local _ = nil;
                    v72 = if type(v68) == "table" then table.concat(v68, "\n") else tostring(v68);
                end;
                l_UGCBundleValidationEvent_0(l_Failure_0, l_v66_0, v72);
            end;
        end;
        if l_props_0.onAssetValidationResultChanged then
            l_props_0.onAssetValidationResultChanged(v62);
        end;
    end;
    if v57.assetTypeEnum ~= nil then
        local l_assetTypeEnum_0 = v57.assetTypeEnum;
        if v12.isCatalogAsset(l_assetTypeEnum_0) or v12.isUGCBundleType(l_assetTypeEnum_0) then
            if v36 and v57.onAssetValidationResultChanged then
                v57.onAssetValidationResultChanged(false);
            end;
            task.defer(function() --[[ Line: 303 ]]
                -- upvalues: v56 (copy), v50 (ref)
                v56:setState({
                    validationState = v50.BEGIN
                });
            end);
        end;
    end;
end;
v45.getAvatarItemCategoryErrorsPrimaryText = function(v75) --[[ Line: 311 ]] --[[ Name: getAvatarItemCategoryErrorsPrimaryText ]]
    local l_props_1 = v75.props;
    local v77 = #v75.state.validationFailureReasons;
    if v77 == 1 then
        return l_props_1.Localization:getText("AssetConfig", "AvatarItemsErrorTextSingular", {
            errorCount = v77
        });
    else
        return l_props_1.Localization:getText("AssetConfig", "AvatarItemsErrorTextPlural", {
            errorCount = v77
        });
    end;
end;
v45.getAvatarItemCategoryErrors = function(v78) --[[ Line: 326 ]] --[[ Name: getAvatarItemCategoryErrors ]]
    local l_state_1 = v78.state;
    local v80 = "";
    for _, v82 in l_state_1.validationFailureReasons do
        v80 = table.concat({
            v80, 
            v82, 
            "\n\n"
        });
    end;
    return v80;
end;
v45.selectedRadioButtonKeyFor = function(v83, v84) --[[ Line: 336 ]] --[[ Name: selectedRadioButtonKeyFor ]]
    for _, v86 in {
        "AvatarItem", 
        "DevelopmentItem"
    } do
        for v87, v88 in v83:getDropdownItemsFor(v86) do
            if v88.type == v84 then
                return v86, v87;
            end;
        end;
    end;
    return "DevelopmentItem", 0;
end;
v45.isAvatarItemCategorySelected = function(v89) --[[ Line: 348 ]] --[[ Name: isAvatarItemCategorySelected ]]
    return v89.state.currentSelectedRadioButtonKey == "AvatarItem";
end;
v45.onAssetTypeChanged = function(v90) --[[ Line: 353 ]] --[[ Name: onAssetTypeChanged ]]
    -- upvalues: v3 (copy), v40 (copy), v12 (copy), v50 (copy)
    local l_props_2 = v90.props;
    local v92 = v90:getAssetCategoryIndex();
    if not v92 then
        v90:resetValidation();
        v90:setState(function() --[[ Line: 360 ]]
            -- upvalues: v3 (ref)
            return {
                currentAssetType = v3.None
            };
        end);
        if l_props_2.onAssetTypeSelected then
            l_props_2.onAssetTypeSelected(v3.None);
        end;
        return;
    else
        local v93 = v90.dropdownItems[v92];
        if not v93 or not v93.type then
            v90:resetValidation();
            v90:setState(function() --[[ Line: 378 ]]
                -- upvalues: v3 (ref)
                return {
                    currentAssetType = v3.None
                };
            end);
            if l_props_2.onAssetTypeSelected then
                l_props_2.onAssetTypeSelected(v3.None);
            end;
            return;
        else
            if v93.type ~= v90.state.currentAssetType then
                v90:resetValidation();
            end;
            if l_props_2.onAssetValidationResultChanged then
                l_props_2.onAssetValidationResultChanged(false);
            end;
            v90:setState(function() --[[ Line: 403 ]]
                -- upvalues: v93 (copy)
                return {
                    currentAssetType = v93.type
                };
            end);
            if l_props_2.onAssetTypeSelected then
                l_props_2.onAssetTypeSelected(v93.type);
            end;
            if v40() and l_props_2.onCategoryChange then
                l_props_2.onCategoryChange(v90.state.currentSelectedRadioButtonKey);
            end;
            local l_type_0 = v93.type;
            if not (v12.isCatalogAsset(l_type_0) or v12.isUGCBundleType(l_type_0)) then
                v90:resetValidation();
                return;
            else
                v90:setState(function() --[[ Line: 426 ]]
                    -- upvalues: v50 (ref)
                    return {
                        validationState = v50.BEGIN
                    };
                end);
                return;
            end;
        end;
    end;
end;
v45.startUGCBundleValidation = function(v95) --[[ Line: 431 ]] --[[ Name: startUGCBundleValidation ]]
    -- upvalues: v39 (copy), v12 (copy), v11 (copy), v50 (copy), v17 (copy), v19 (copy), v33 (copy), v7 (copy), v43 (copy), v3 (copy)
    local l_props_3 = v95.props;
    local l_state_2 = v95.state;
    local v98 = nil;
    if v39() then
        v98 = v12.getAvatarAssetTypeAsString(l_state_2.currentAssetType);
        v11.UGCBundleValidationEvent(v11.Status.Start, v98);
    end;
    if #l_props_3.instances ~= 1 then
        v95:setState(function() --[[ Line: 442 ]]
            -- upvalues: v50 (ref), l_props_3 (copy)
            return {
                validationState = v50.FAILURE, 
                validationFailureReasons = {
                    l_props_3.Localization:getText("AssetConfig", "ValidationErrorBadSelectionCount")
                }
            };
        end);
        if v39() then
            v11.UGCBundleValidationEvent(v11.Status.Failure, v98, "Bad Selection Count");
        end;
        return;
    else
        local v99 = nil;
        if v17() then
            v99 = v95.props.instances[1]:Clone();
            v12.sanitizeForValidation(v99);
        end;
        local function v101(v100) --[[ Line: 469 ]] --[[ Name: getReasonFromError ]]
            -- upvalues: l_props_3 (copy), v19 (ref)
            if v100.error.type == "message" then
                return v100.error.message;
            elseif v100.error.type == "notFound" then
                return (l_props_3.Localization:getText("AssetConfig", "ValidationErrorItemNotDetected", {
                    itemName = v19(l_props_3.Localization)[v100.assetType]
                }));
            else
                return (error((("Unknown error type: %*"):format(v100.error.type))));
            end;
        end;
        local function v113(v102) --[[ Line: 482 ]] --[[ Name: progressCallback ]]
            -- upvalues: v17 (ref), v101 (copy), v33 (ref), v99 (ref), v95 (copy)
            local v103 = {};
            local v104 = {};
            local v105 = {};
            for _, v107 in v102.errors do
                if v17() then
                    local v108 = v101(v107);
                    if v107.assetType == nil then
                        table.insert(v105, v108);
                    else
                        if v104[v107.assetType] == nil then
                            v104[v107.assetType] = {};
                        end;
                        table.insert(v104[v107.assetType], v108);
                    end;
                elseif v107.assetType ~= nil then
                    if v104[v107.assetType] == nil then
                        v104[v107.assetType] = {};
                    end;
                    local v109 = v101(v107);
                    table.insert(v104[v107.assetType], v109);
                end;
            end;
            for _, v111 in v102.pieces do
                local v112 = v104[v111.assetType] or {};
                table.insert(v103, {
                    assetType = v111.assetType, 
                    instance = v111.instance, 
                    required = v111.settings.minimumQuantity > 0, 
                    errors = v112, 
                    type = if #v112 > 0 then v33.error else if v111.status == "finished" then v33.success else v33.pending
                });
            end;
            if v17() then
                table.insert(v103, {
                    assetType = nil, 
                    instance = v99, 
                    required = true, 
                    errors = v105, 
                    type = if #v105 > 0 then v33.error else v33.pending
                });
            end;
            v95:setState({
                ugcBundleValidationResults = v103
            });
        end;
        v95.validationPromise = v7.validateBundleReadyForUpload(l_props_3.instances[1], l_props_3.allowedBundleTypeSettings, l_state_2.currentAssetType.rawValue(), v113):andThen(function(v114) --[[ Line: 551 ]]
            -- upvalues: v17 (ref), v95 (copy), v43 (ref), v3 (ref), v33 (ref), v101 (copy)
            if v17() then
                v95:setState(function(v115) --[[ Line: 553 ]]
                    -- upvalues: v43 (ref), v3 (ref), v33 (ref)
                    if v115.ugcBundleValidationResults == nil or v43 and v115.ugcBundleValidationResults == v3.None then
                        return {};
                    else
                        local v116 = table.clone(v115.ugcBundleValidationResults);
                        local v117 = table.clone(v116[#v116]);
                        assert(v117.assetType == nil, "Expected last validation result to not have an asset type (full body)");
                        if #v117.errors == 0 then
                            v117.type = v33.success;
                        end;
                        v116[#v116] = v117;
                        return {
                            ugcBundleValidationResults = v116
                        };
                    end;
                end);
            end;
            local v118 = {};
            for _, v120 in v114.errors do
                table.insert(v118, (v101(v120)));
            end;
            v95.validationCallback(#v118 == 0, v118);
        end);
        return;
    end;
end;
v45.resetValidation = function(v121) --[[ Line: 594 ]] --[[ Name: resetValidation ]]
    -- upvalues: v50 (copy), v3 (copy)
    local l_props_4 = v121.props;
    v121:cancelValidationTasks();
    v121:setState(function() --[[ Line: 599 ]]
        -- upvalues: v50 (ref), v3 (ref)
        return {
            validationState = v50.NONE, 
            validationFailureReasons = {}, 
            ugcBundleValidationResults = v3.None
        };
    end);
    if l_props_4.onAssetValidationResultChanged then
        l_props_4.onAssetValidationResultChanged(false);
    end;
end;
v45.cancelValidationTasks = function(v123) --[[ Line: 613 ]] --[[ Name: cancelValidationTasks ]]
    if v123.validationTask ~= nil then
        task.cancel(v123.validationTask);
        v123.validationTask = nil;
    end;
    if v123.validationPromise ~= nil then
        v123.validationPromise:cancel();
        v123.validationPromise = nil;
    end;
end;
v45.getErrorMessageWithCount = function(v124, v125) --[[ Line: 625 ]] --[[ Name: getErrorMessageWithCount ]]
    local l_props_5 = v124.props;
    if v125 == 1 then
        return l_props_5.Localization:getText("AssetConfig", "ValidationErrorSingular", {
            errorCount = v125
        });
    else
        return l_props_5.Localization:getText("AssetConfig", "ValidationErrorPlural", {
            errorCount = v125
        });
    end;
end;
v45.getValidationStatusMessage = function(v127) --[[ Line: 638 ]] --[[ Name: getValidationStatusMessage ]]
    -- upvalues: v50 (copy)
    local l_props_6 = v127.props;
    local l_state_3 = v127.state;
    if l_state_3.validationState == v50.VALIDATING then
        return l_props_6.Localization:getText("AssetConfig", "ValidatingInProgress");
    elseif l_state_3.validationState == v50.SUCCESS then
        return l_props_6.Localization:getText("AssetConfig", "ValidationSuccess");
    elseif l_state_3.validationState == v50.FAILURE then
        local v130 = #l_state_3.validationFailureReasons;
        if v130 > 0 then
            return v127:getErrorMessageWithCount(v130);
        else
            return l_props_6.Localization:getText("AssetConfig", "ValidationErrorUnknown");
        end;
    else
        return "";
    end;
end;
v45.getValidationStatusColor = function(v131, v132) --[[ Line: 658 ]] --[[ Name: getValidationStatusColor ]]
    -- upvalues: v50 (copy)
    local l_state_4 = v131.state;
    if l_state_4.validationState == v50.SUCCESS then
        return v132.typeValidation.successResultColor;
    elseif l_state_4.validationState == v50.FAILURE then
        return v132.typeValidation.failureResultColor;
    else
        return v132.TextColor;
    end;
end;
v45.getAssetCategoryIndex = function(v134) --[[ Line: 670 ]] --[[ Name: getAssetCategoryIndex ]]
    local l_state_5 = v134.state;
    if l_state_5.currentSelectedRadioButtonKey == "AvatarItem" then
        return l_state_5.dropdownAvatarCategoryIndex;
    else
        return l_state_5.dropdownDevelopmentCategoryIndex;
    end;
end;
v45.getDropdownItemsFor = function(v136, v137, v138) --[[ Line: 678 ]] --[[ Name: getDropdownItemsFor ]]
    -- upvalues: v12 (copy), v49 (ref), v18 (copy), v19 (copy)
    local l_props_7 = v136.props;
    local v140 = {};
    if v137 == "AvatarItem" then
        if l_props_7.allowedBundleTypeSettings ~= nil then
            for v141 in l_props_7.allowedBundleTypeSettings do
                local v142 = v12.getUGCBundleTypeFromString(v141);
                table.insert(v140, {
                    name = if v138 then v12.getLocalizedUGCBundleName(v142, v138) else "", 
                    selectable = true, 
                    type = v142
                });
            end;
            if game:GetFastFlag("BodyFirstInAssetsCategory") then
                table.sort(v140, function(v143, v144) --[[ Line: 698 ]]
                    -- upvalues: v49 (ref)
                    return (table.find(v49, v143.type) or 1e999) < (table.find(v49, v144.type) or 1e999);
                end);
            end;
        end;
        local v145 = v18(l_props_7.allowedAssetTypesForRelease);
        if #v145 > 0 then
            for _, v147 in v145 do
                table.insert(v140, {
                    name = if v138 then v19(v138)[v147] else "", 
                    selectable = true, 
                    type = v147
                });
            end;
            return v140;
        end;
    else
        local v148 = if v138 then v138:getText("General", "AssetTypeModel") else "";
        local v149 = if v138 then v138:getText("General", "AssetTypeAnimation") else "";
        table.insert(v140, {
            name = v148, 
            selectable = true, 
            type = Enum.AssetType.Model
        });
        table.insert(v140, {
            name = v149, 
            selectable = true, 
            type = Enum.AssetType.Animation
        });
    end;
    return v140;
end;
v45.getDropdownItems = function(v150, v151) --[[ Line: 731 ]] --[[ Name: getDropdownItems ]]
    v150.dropdownItems = v150:getDropdownItemsFor(v150.state.currentSelectedRadioButtonKey, v151);
    return v150.dropdownItems;
end;
if v37() then
    v45.getMissingOptionalPartsMessage = function(v152, v153, v154, v155, v156) --[[ Line: 739 ]] --[[ Name: getMissingOptionalPartsMessage ]]
        -- upvalues: v12 (copy), l_LayoutOrderIterator_0 (copy), v5 (copy), l_TextLabel_0 (copy), v14 (copy), v19 (copy)
        local l_props_8 = v152.props;
        if not v12.isUGCBundleType(v155) then
            return nil;
        else
            local v158 = v12.getOptionalBodyPartsNotFound(v153, v154, v155);
            if not v158 or #v158 <= 0 then
                return nil;
            else
                local v159 = {};
                local v160 = l_LayoutOrderIterator_0.new();
                v159.OptionalPartsMessage = v5.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Font = v14.FONT, 
                    LayoutOrder = v160:getNextOrder(), 
                    Size = UDim2.fromScale(1, 0), 
                    Text = l_props_8.Localization:getText("AssetConfig", "UGCMissingOptionalPartsMessage"), 
                    TextColor = v156.assetConfig.labelTextColor, 
                    TextSize = v14.FONT_SIZE_TITLE, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                });
                for _, v162 in v158 do
                    local v163 = v19(l_props_8.Localization)[v162];
                    if v163 ~= nil then
                        v159[v162.Name] = v5.createElement(l_TextLabel_0, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            Font = v14.FONT, 
                            LayoutOrder = v160:getNextOrder(), 
                            Size = UDim2.fromScale(1, 0), 
                            Text = v163, 
                            TextColor = v156.assetConfig.labelTextColor, 
                            TextSize = v14.FONT_SIZE_TITLE, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center
                        });
                    end;
                end;
                return v159;
            end;
        end;
    end;
end;
if l_EnableUGCBundleUnknownMeshPartFiltering_0 then
    v45.getUnknownMeshPartMessage = function(v164, v165, v166, v167) --[[ Line: 794 ]] --[[ Name: getUnknownMeshPartMessage ]]
        -- upvalues: v12 (copy), l_LayoutOrderIterator_0 (copy), v5 (copy), l_TextLabel_0 (copy), v14 (copy)
        local l_props_9 = v164.props;
        if not v12.isUGCBundleType(v166) then
            return nil;
        else
            local v169 = v12.getUnknownMeshPartNames(v165);
            if not v169 or #v169 <= 0 then
                return nil;
            else
                local v170 = {};
                local v171 = l_LayoutOrderIterator_0.new();
                v170.OptionalPartsMessage = v5.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Font = v14.FONT, 
                    LayoutOrder = v171:getNextOrder(), 
                    Size = UDim2.fromScale(1, 0), 
                    Text = l_props_9.Localization:getText("AssetConfig", "UGCUnknownMeshPartsMessage"), 
                    TextColor = v167.assetConfig.labelTextColor, 
                    TextSize = v14.FONT_SIZE_TITLE, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                });
                for _, v173 in v169 do
                    v170[v173] = v5.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Font = v14.FONT, 
                        LayoutOrder = v171:getNextOrder(), 
                        Size = UDim2.fromScale(1, 0), 
                        Text = v173, 
                        TextColor = v167.assetConfig.labelTextColor, 
                        TextSize = v14.FONT_SIZE_TITLE, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center
                    });
                end;
                return v170;
            end;
        end;
    end;
end;
if v40() then
    v45.getUgcRestrictionsWarningText = function(v174, v175, v176) --[[ Line: 845 ]] --[[ Name: getUgcRestrictionsWarningText ]]
        -- upvalues: l_BrowserService_0 (copy), v41 (copy), v42 (copy)
        local l_props_10 = v174.props;
        local l_Localization_0 = l_props_10.Localization;
        local v179 = nil;
        local v180 = {};
        local l_canUploadWithUgcRestrictions_0 = l_props_10.canUploadWithUgcRestrictions;
        local l_canUploadWithUgcRestrictionsDenyReason_0 = l_props_10.canUploadWithUgcRestrictionsDenyReason;
        if v174:isAvatarItemCategorySelected() then
            if l_canUploadWithUgcRestrictions_0 ~= nil and l_canUploadWithUgcRestrictions_0 == false then
                return if l_canUploadWithUgcRestrictionsDenyReason_0 == "MissingIdVerification" then l_Localization_0:getText("AssetConfig", "UploadDenied_MissingIdVerification_Text") else if l_canUploadWithUgcRestrictionsDenyReason_0 == "MissingPremiumSubscriptionTier" then l_Localization_0:getText("AssetConfig", "UploadDenied_MissingPremiumSubscriptionTier_Text") else l_Localization_0:getText("AssetConfig", "UploadDenied_UnknownError", {
                    errorCode = l_canUploadWithUgcRestrictionsDenyReason_0
                }), {
                    ["[Age_Verified]"] = {
                        LinkText = l_Localization_0:getText("AssetConfig", "UploadDenied_MissingIdVerification_Link"), 
                        LinkCallback = function() --[[ Line: 872 ]] --[[ Name: LinkCallback ]]
                            -- upvalues: l_BrowserService_0 (ref), v41 (ref)
                            l_BrowserService_0:OpenBrowserWindow(v41);
                        end
                    }, 
                    ["[Premium_1000_Or_2200_Subscription]"] = {
                        LinkText = l_Localization_0:getText("AssetConfig", "UploadDenied_MissingPremiumSubscriptionTier_Link"), 
                        LinkCallback = function() --[[ Line: 882 ]] --[[ Name: LinkCallback ]]
                            -- upvalues: l_BrowserService_0 (ref), v42 (ref)
                            l_BrowserService_0:OpenBrowserWindow(v42);
                        end
                    }
                };
            end;
        elseif v175 then
            return l_Localization_0:getText("AssetConfig", "InsufficientRobuxWarning"), v180;
        elseif v176 then
            v179 = l_Localization_0:getText("AssetConfig", "ModelPublishWarning");
        end;
        return v179, v180;
    end;
end;
v45.didUpdate = function(v183, _, v185) --[[ Line: 898 ]] --[[ Name: didUpdate ]]
    -- upvalues: v50 (copy), v12 (copy), v13 (copy), v7 (copy)
    local l_props_11 = v183.props;
    local l_state_6 = v183.state;
    if l_state_6.currentSelectedRadioButtonKey ~= v185.currentSelectedRadioButtonKey or l_state_6.dropdownAvatarCategoryIndex ~= v185.dropdownAvatarCategoryIndex or l_state_6.dropdownDevelopmentCategoryIndex ~= v185.dropdownDevelopmentCategoryIndex then
        v183:onAssetTypeChanged();
    end;
    if l_state_6.validationState ~= v185.validationState then
        if l_state_6.validationState == v50.BEGIN then
            v183:setState(function() --[[ Line: 915 ]]
                -- upvalues: v50 (ref)
                return {
                    validationState = v50.VALIDATING
                };
            end);
            return;
        elseif l_state_6.validationState == v50.VALIDATING then
            if v12.isUGCBundleType(l_state_6.currentAssetType) then
                v183:startUGCBundleValidation();
                return;
            else
                v183.validationTask = task.spawn(function() --[[ Line: 924 ]]
                    -- upvalues: v13 (ref), v7 (ref), l_props_11 (copy), l_state_6 (copy), v183 (copy)
                    local function v194(v188) --[[ Line: 925 ]] --[[ Name: fixInstances ]]
                        -- upvalues: v13 (ref)
                        local v189 = {};
                        local v190 = v188 or {};
                        for v191, v192 in v190 do
                            local v193 = v192:Clone();
                            v13(v193);
                            v189[v191] = v193;
                        end;
                        return v189;
                    end;
                    local v195, v196 = v7.validate(v194(l_props_11.instances), l_state_6.currentAssetType);
                    v183.validationCallback(v195, v196);
                end);
            end;
        end;
    end;
end;
v45.willUnmount = function(v197) --[[ Line: 943 ]] --[[ Name: willUnmount ]]
    v197:cancelValidationTasks();
end;
v45.render = function(v198) --[[ Line: 947 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v50 (copy), v14 (copy), v12 (copy), v40 (copy), v37 (copy), l_EnableUGCBundleUnknownMeshPartFiltering_0 (copy), v5 (copy), l_Pane_0 (copy), v29 (copy), v31 (copy), l_RadioButtonList_0 (copy), v48 (copy), v47 (copy), v16 (copy), l_TextWithLinks_0 (copy), v28 (copy), l_TextLabel_0 (copy), v3 (copy), v46 (copy), v32 (copy), v44 (copy), v35 (copy)
    local l_props_12 = v198.props;
    local l_state_7 = v198.state;
    local l_Localization_1 = l_props_12.Localization;
    local l_Stylizer_0 = l_props_12.Stylizer;
    local v203 = l_LayoutOrderIterator_0.new();
    local v204 = l_state_7.validationState == v50.FAILURE;
    local v205 = v204 and 24 or 0;
    local l_FONT_SIZE_TITLE_0 = v14.FONT_SIZE_TITLE;
    local l_currentAssetType_0 = l_state_7.currentAssetType;
    local v208 = l_currentAssetType_0 == Enum.AssetType.Model;
    local v209 = v12.isUGCBundleType(l_currentAssetType_0);
    local v210 = l_Localization_1:getText("AssetConfig", "AvatarItemsErrorTitle");
    local v211 = l_Localization_1:getText("Common", "Close");
    local v212 = l_Localization_1:getText("General", "ContentType");
    local v213 = l_Localization_1:getText("AssetConfig", "DevelopmentItem");
    local v214 = l_Localization_1:getText("AssetConfig", "AvatarItem");
    local v215 = l_Localization_1:getText("General", "AssetCategory");
    local v216 = nil;
    if not v40() and v208 then
        v216 = l_Localization_1:getText("AssetConfig", "ModelPublishWarning");
    end;
    local l_canAffordUploadFee_0 = l_props_12.canAffordUploadFee;
    local v218 = l_props_12.uploadFee > 0 and not l_canAffordUploadFee_0;
    local v219 = nil;
    if not v40() and v218 then
        v219 = l_Localization_1:getText("AssetConfig", "InsufficientRobuxWarning");
    end;
    local l_displayValidationErrorMessages_0 = l_state_7.displayValidationErrorMessages;
    local v221 = l_Localization_1:getText("General", "BodyValidation");
    local v222 = if v37() then v198:getMissingOptionalPartsMessage(l_props_12.instances[1], l_props_12.allowedBundleTypeSettings, l_currentAssetType_0, l_Stylizer_0) else nil;
    local v223 = if l_EnableUGCBundleUnknownMeshPartFiltering_0 then v198:getUnknownMeshPartMessage(l_props_12.instances[1], l_currentAssetType_0, l_Stylizer_0) else nil;
    local v224 = nil;
    local v225 = {};
    if v40() then
        local v226, v227 = v198:getUgcRestrictionsWarningText(v218, v208);
        v224 = v226;
        v225 = v227;
    end;
    return v5.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = l_Stylizer_0.typeSelection.background, 
        BackgroundTransparency = 1, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_12.LayoutOrder, 
        Padding = {
            Bottom = 32
        }, 
        Spacing = 30, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        ValidationErrorMessageBox = if l_displayValidationErrorMessages_0 then v5.createElement(v29, {
            buttons = {
                {
                    Text = v211, 
                    Font = l_Stylizer_0.Font, 
                    TextSize = l_Stylizer_0.TextSize, 
                    action = "yes"
                }
            }, 
            Icon = "rbxasset://textures/ui/ErrorIcon.png", 
            InformativeText = v198:getAvatarItemCategoryErrors(), 
            onButtonClicked = v198.onValidationErrorMessageBoxClosed, 
            onClose = v198.onValidationErrorMessageBoxClosed, 
            Text = v198:getAvatarItemCategoryErrorsPrimaryText(), 
            Title = v210
        }) else nil, 
        ContentTypeRadioButtons = v5.createElement(v31, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v203:getNextOrder(), 
            Title = v212
        }, {
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, 8), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            RadioButtons = v5.createElement(l_RadioButtonList_0, {
                Buttons = {
                    {
                        Key = "DevelopmentItem", 
                        Text = v213, 
                        Disabled = false
                    }, 
                    {
                        Key = "AvatarItem", 
                        Text = v214, 
                        Disabled = false
                    }
                }, 
                FillDirection = Enum.FillDirection.Horizontal, 
                LayoutOrder = 1, 
                OnClick = v198.onRadioButtonClicked, 
                SelectedKey = l_state_7.currentSelectedRadioButtonKey
            }), 
            WarningMessageFrame = if v40() then v5.createElement(l_Pane_0, {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v48), 
                Spacing = v47, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                WarningMessageIcon = if v224 ~= nil then v5.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v16.WARNING_ICON, 
                    ImageColor3 = l_Stylizer_0.assetConfig.warningColor, 
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(24, 24)
                }) else nil, 
                WarningMessageText = if v224 ~= nil then v5.createElement(l_TextWithLinks_0, {
                    BackgroundTransparency = 1, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    LayoutOrder = 2, 
                    LinkMap = v225, 
                    Size = UDim2.fromScale(1, 1), 
                    Text = v224, 
                    TextColor3 = l_Stylizer_0.assetConfig.warningColor, 
                    TextProps = {
                        Font = v14.FONT, 
                        TextSize = 24
                    }, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                }) else nil
            }) else nil, 
            WarningFrame = if not v40() then v5.createElement(l_Pane_0, {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v48), 
                Spacing = v47, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                Icon = if not not v208 or v218 then v5.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v16.WARNING_ICON, 
                    ImageColor3 = l_Stylizer_0.assetConfig.warningColor, 
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(24, 24)
                }) else nil, 
                ModelWarningText = if v208 then v5.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = v14.FONT, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v216, 
                    TextColor3 = l_Stylizer_0.assetConfig.warningColor, 
                    TextSize = 24, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }) else nil, 
                InsufficientRobuxWarningText = if v218 then v5.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = v14.FONT, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v219, 
                    TextColor3 = l_Stylizer_0.assetConfig.warningColor, 
                    TextSize = 24, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }) else nil
            }) else nil
        }), 
        AssetCategoryDropDown = v5.createElement(v31, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v203:getNextOrder(), 
            Title = v215
        }, {
            Dropdown = v5.createElement(v28, {
                fontSize = 20, 
                items = v198:getDropdownItems(l_Localization_1), 
                onItemClicked = v198.setAssetCategoryIndex, 
                rowHeight = 24, 
                selectedDropDownIndex = v198:getAssetCategoryIndex(), 
                Size = UDim2.new(0, 400, 0, 40), 
                visibleDropDownCount = 6
            }), 
            ValidationResult = if not v204 then v5.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(0, 400 + v205 + 16, 0, (40 - l_FONT_SIZE_TITLE_0) / 2), 
                Text = v198:getValidationStatusMessage(), 
                TextColor = v198:getValidationStatusColor(l_Stylizer_0), 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }) else nil, 
            ErrorIconButton = if v204 then v5.createElement("ImageButton", {
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/ErrorIcon.png", 
                ImageColor3 = v198:getValidationStatusColor(l_Stylizer_0), 
                Position = UDim2.new(0, 408, 0, 8), 
                Size = UDim2.fromOffset(24, 24), 
                [v5.Event.Activated] = v198.openValidationErrorMessageBox
            }) else nil, 
            ErrorMessageTextButton = if v204 then v5.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Font = l_Stylizer_0.Font, 
                Position = UDim2.new(0, 400 + v205 + 16, 0, (40 - l_FONT_SIZE_TITLE_0) / 2), 
                Text = v198:getValidationStatusMessage(), 
                TextColor3 = v198:getValidationStatusColor(l_Stylizer_0), 
                TextSize = v14.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                [v5.Event.Activated] = v198.openValidationErrorMessageBox
            }) else nil
        }), 
        ContentTypeBodyValidation = if v209 and v198.state.ugcBundleValidationResults ~= v3.None then v5.createElement(v31, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v203:getNextOrder(), 
            Title = v221
        }, {
            ValidationPane = if not not v37() or l_EnableUGCBundleUnknownMeshPartFiltering_0 then v5.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 1, 
                Size = UDim2.fromScale(1, 0), 
                Spacing = v46
            }, {
                UGCBundleValidation = v5.createElement(v32, {
                    LayoutOrder = 1, 
                    onClickError = if v44 then nil else v198.openValidationErrorMessageBox, 
                    validationResults = v198.state.ugcBundleValidationResults
                }), 
                MissingOptionalAccessoriesMsg = if v222 then v5.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = 2, 
                    Size = UDim2.fromScale(1, 0)
                }, v222) else nil, 
                UnknownMeshPartsMsgChildren = if v223 then v5.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = 3, 
                    Size = UDim2.fromScale(1, 0)
                }, v223) else nil
            }) else v5.createElement(v32, {
                onClickError = if v44 then nil else v198.openValidationErrorMessageBox, 
                validationResults = v198.state.ugcBundleValidationResults
            })
        }) else nil, 
        DataSharingConsent = if l_props_12.dataSharingEnabled and v209 then v5.createElement(v35, {
            LayoutOrder = v203:getNextOrder(), 
            dataSharingToggled = l_props_12.dataSharingToggled, 
            onDataConsentToggleClick = l_props_12.onDataConsentToggleClick
        }) else nil
    });
end;
local function v229(v228) --[[ Line: 1284 ]] --[[ Name: mapStateToProps ]]
    v228 = v228 or {};
    return {
        allowedAssetTypesForRelease = v228.allowedAssetTypesForRelease, 
        allowedBundleTypeSettings = v228.allowedBundleTypeSettings, 
        assetTypeEnum = v228.assetTypeEnum, 
        canAffordUploadFee = v228.canAffordUploadFee or false, 
        instances = v228.instances, 
        uploadFee = v228.uploadFee or 0
    };
end;
local function v233(v230) --[[ Line: 1296 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v26 (copy), v27 (copy)
    return {
        onAssetTypeSelected = function(v231) --[[ Line: 1298 ]] --[[ Name: onAssetTypeSelected ]]
            -- upvalues: v230 (copy), v26 (ref)
            v230(v26(v231));
        end, 
        onAssetValidationResultChanged = function(v232) --[[ Line: 1301 ]] --[[ Name: onAssetValidationResultChanged ]]
            -- upvalues: v230 (copy), v27 (ref)
            v230(v27(v232));
        end
    };
end;
v45 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v45);
return v6.connect(v229, v233)(v45);