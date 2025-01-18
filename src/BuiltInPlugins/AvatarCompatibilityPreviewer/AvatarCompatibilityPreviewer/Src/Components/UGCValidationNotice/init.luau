local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(script.StatusIcon);
local v4 = require(script.UGCValidationErrorDialog);
local v5 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_script_FirstAncestor_0.Src.Util.createCallThrottler);
local v10 = require(l_script_FirstAncestor_0.Src.Util.localizePlural);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useCreatedByAutoSetup);
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v13 = require(l_script_FirstAncestor_0.Src.Hooks.useSerializedState);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoRerunValidation);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerRerunValidation);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local l_UI_0 = v1.UI;
local l_Alert_0 = l_UI_0.Alert;
local l_Pane_0 = l_UI_0.Pane;
local l_Analytics_0 = v1.ContextServices.Analytics;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v23) --[[ Line: 39 ]] --[[ Name: UGCValidationNotice ]]
    -- upvalues: l_Localization_0 (copy), l_Stylizer_0 (copy), v2 (copy), v5 (copy), v12 (copy), v16 (copy), v14 (copy), v9 (copy), v11 (copy), v10 (copy), v13 (copy), v6 (copy), v15 (copy), l_Analytics_0 (copy), l_Pane_0 (copy), l_Alert_0 (copy), v3 (copy), v4 (copy)
    local v24 = l_Localization_0:use();
    local v25 = l_Stylizer_0:use("UGCValidationNotice");
    local l_WorldModel_0 = v23.Avatar.WorldModel;
    local v27 = v2.useContext(v5.Context);
    local v28 = v12(true);
    local v29 = v12(false);
    local v30 = nil;
    v30 = if v16() then v2.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v27 (copy), l_WorldModel_0 (copy)
        return v27.findCachedValidationResponse(l_WorldModel_0);
    end, if v14() then {
        l_WorldModel_0, 
        v27.findCachedValidationResponse, 
        v23.Avatar.LatestWorldModelHash, 
        v23.Avatar.WorldModelScale, 
        v23.Avatar.ProportionalScale
    } else {
        l_WorldModel_0, 
        v27.findCachedValidationResponse
    }) else v27.DEPRECATED_cachedResponses[l_WorldModel_0];
    local v31 = v30 and v30.ugcValidationResponse;
    local v32 = (v31 == nil and 0 or #v31.errors) + (v27.canUploadBundles ~= nil and v27.canUploadBundles.type == "notAllowed" and 1 or 0);
    v2.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v27 (copy)
        v27.requestCanUploadBundles();
    end, {
        v27.requestCanUploadBundles
    });
    local v33 = if v14() then v9(v2.useCallback(function() --[[ Line: 90 ]]
        -- upvalues: v30 (ref), v27 (copy), l_WorldModel_0 (copy)
        if v30 ~= nil then
            return;
        else
            v27.validateBundle(l_WorldModel_0);
            return;
        end;
    end, {
        v30, 
        l_WorldModel_0
    }), 2) else nil;
    if v14() then
        v2.useEffect(v33, {
            v23.Avatar.LatestWorldModelHash, 
            v23.Avatar.WorldModelScale, 
            v23.Avatar.ProportionalScale
        });
    else
        v2.useEffect(function() --[[ Line: 106 ]]
            -- upvalues: v27 (copy), l_WorldModel_0 (copy)
            v27.validateBundle(l_WorldModel_0);
        end, {
            l_WorldModel_0
        });
    end;
    v2.useEffect(function() --[[ Line: 111 ]]
        -- upvalues: v28 (copy), v29 (copy)
        v28.enable();
        v29.disable();
    end, {
        l_WorldModel_0
    });
    local v34 = v11(l_WorldModel_0);
    local v35 = v10(v24, "UGCValidation", "WarningLongTitle", v32);
    local v36, v37 = v13(l_WorldModel_0, "AutoSetupValidationResultReported", false);
    local v38 = v13(l_WorldModel_0, v6.ATTRIBUTE_AUTO_SETUP_INPUT_ASSET, nil);
    local v39 = false;
    if v30 ~= nil then
        v39 = v30.completed;
    end;
    local v40 = if v15() then v2.useCallback(function() --[[ Line: 128 ]]
        -- upvalues: v27 (copy), l_WorldModel_0 (copy)
        v27.revalidateBundle(l_WorldModel_0);
    end, {
        l_WorldModel_0
    }) else nil;
    local v41 = l_Analytics_0:use();
    v2.useEffect(function() --[[ Line: 135 ]]
        -- upvalues: v39 (copy), v36 (copy), v34 (copy), v30 (ref), v31 (copy), v37 (copy), v41 (copy), v38 (copy)
        if v39 and not v36 and v34 and v30 ~= nil and v31 ~= nil then
            v37(true);
            if #v31.errors == 0 then
                v41:report("autoSetupPassedValidation");
            else
                v41:report("autoSetupFailedValidation");
            end;
            v41:report("autoSetupValidationDuration", v30.duration);
            v41:report("autoSetupValidationErrorCount", #v31.errors);
            for _, v43 in v31.errors do
                if v43.error.type == "message" then
                    v41:report("autoSetupValidationError", v38, v43.error.message);
                end;
            end;
        end;
    end, {
        v39
    });
    local l_createElement_0 = v2.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v46 = {
        Position = v25.Position, 
        Size = v25.Size
    };
    local v47 = {};
    local v48 = false;
    if v31 ~= nil then
        v48 = false;
        if v32 > 0 then
            v48 = v28.enabled and v2.createElement(l_Alert_0, {
                Title = v35, 
                ShortTitle = v10(v24, "UGCValidation", "WarningShortTitle", v32), 
                PrimaryAction = {
                    Text = v24:getText("UGCValidation", "WarningAction"), 
                    OnClick = v29.enable
                }, 
                OnClose = v28.disable, 
                Style = "WarningLong"
            });
        end;
    end;
    v47.Alert = v48;
    v47.StatusIcon = if not (v32 > 0) or v28.enabled then if v32 == 0 and v27.canUploadBundles ~= nil and v30 ~= nil and v30.completed then v2.createElement(v3, {
        Style = "Success", 
        TooltipText = v24:getText("UGCValidation", "SuccessTooltip")
    }) else if not (v15() and v32 == 0 and v27.canUploadBundles ~= nil and v30 ~= nil) or v30.completed then nil else v2.createElement(v3, {
        Style = "InProgress", 
        TooltipText = v24:getText("UGCValidation", "InProgressTooltip")
    }) else v2.createElement(v3, {
        Style = "Failure", 
        TooltipText = v35, 
        OnClick = v29.enable
    });
    v48 = false;
    if v31 ~= nil then
        v48 = false;
        if v32 > 0 then
            v48 = v29.enabled and v2.createElement(v4, {
                Errors = v31.errors, 
                OnClose = v29.disable, 
                RunValidation = v40, 
                ValidationCompleted = v39
            });
        end;
    end;
    v47.FullDetails = v48;
    return l_createElement_0(l_l_Pane_0_0, v46, v47);
end;