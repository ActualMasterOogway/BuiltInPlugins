local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioAvatarAutosetupReportsProgress);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Alert_0 = v2.UI.Alert;
return function(v8) --[[ Line: 23 ]] --[[ Name: AutoSetupAlert ]]
    -- upvalues: l_Localization_0 (copy), v4 (copy), v3 (copy), v5 (copy), l_Alert_0 (copy)
    local v9 = l_Localization_0:use();
    local v10 = v4(false);
    v3.useEffect(function() --[[ Line: 27 ]]
        -- upvalues: v8 (copy), v10 (copy)
        if v8.autoSetupState.type == "error" then
            v10.enable();
        end;
    end, {
        v8.autoSetupState.type
    });
    local v11 = v3.useCallback(function() --[[ Line: 33 ]]
        -- upvalues: v10 (copy), v8 (copy)
        v10.disable();
        v8.clearError();
    end, {
        v10.disable, 
        v8.clearError
    });
    if not v5() and v8.autoSetupState.type == "inAutoSetup" then
        local v12 = v9:getText("AvatarScreen", "AutoSetupInProgressDescription");
        if v8.autoSetupState.DEPRECATED_eta ~= nil then
            v12 = (v12 .. "\n") .. v9:getText("AvatarScreen", "AutoSetupETA", {
                eta = math.ceil(v8.autoSetupState.DEPRECATED_eta)
            });
        end;
        return v3.createElement(l_Alert_0, {
            Title = v9:getText("AvatarScreen", "AutoSetupInProgressTitle"), 
            Description = v12, 
            PrimaryAction = {
                Text = v9:getText("AvatarScreen", "AutoSetupInProgressActionText"), 
                OnClick = v8.cancelDialogOpen.enable
            }
        });
    elseif v8.autoSetupState.type == "error" and v10.enable then
        return v3.createElement(l_Alert_0, {
            Title = v9:getText("AvatarScreen", "AutoSetupErrorTitle"), 
            Description = v9:getText("AvatarScreen", v8.autoSetupState.error), 
            Style = "Error", 
            OnClose = v11
        });
    else
        return nil;
    end;
end;