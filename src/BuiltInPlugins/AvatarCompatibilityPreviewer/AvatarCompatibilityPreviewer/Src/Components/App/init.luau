local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Screens.AvatarScreen);
local v5 = require(l_script_FirstAncestor_0.Src.Components.Screens.AutoSetupScreen);
local v6 = require(l_script_FirstAncestor_0.Src.Components.Screens.SelectScreen);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Screens.SimpleSelectScreen);
local v8 = require(l_script_FirstAncestor_0.Src.Components.Screens.TestingScreen);
local v9 = require(l_script_FirstAncestor_0.Src.Components.EquipmentStateProvider);
local v10 = require(l_script_FirstAncestor_0.Src.Components.OriginalLimbProvider);
local v11 = require(l_script_FirstAncestor_0.Src.Components.RunServiceContext);
local v12 = require(l_script_FirstAncestor_0.Src.Components.SimpleSerializedStateProvider);
local v13 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local v14 = require(l_script_FirstAncestor_0.Src.Components.UserCatalogFolderContext);
local v15 = require(l_script_FirstAncestor_0.Src.Components.UserCatalogProvider);
local v16 = require(l_script_FirstAncestor_0.Src.Components.ContextStack);
local v17 = require(l_script_FirstAncestor_0.Src.Hooks.useAutoSetupState);
local v18 = require(l_script_FirstAncestor_0.Src.Hooks.DEPRECATED_useAutoSetupState);
local v19 = require(l_script_FirstAncestor_0.Src.Hooks.useMostRecentSelected);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCatalogUndo);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local l_Analytics_0 = v2.ContextServices.Analytics;
return function(v24) --[[ Line: 39 ]] --[[ Name: App ]]
    -- upvalues: v3 (copy), v11 (copy), v19 (copy), v20 (copy), v22 (copy), v17 (copy), v18 (copy), l_Analytics_0 (copy), v8 (copy), v5 (copy), v7 (copy), v6 (copy), v16 (copy), v1 (copy), v21 (copy), v14 (copy), v12 (copy), v9 (copy), v15 (copy), v10 (copy), v13 (copy), v4 (copy)
    local v25 = v3.useContext(v11);
    local v26 = v19();
    local v27 = nil;
    v27 = if v20() then if v22() then v17(v26 and v26.autoSetupTarget) else v18(v26 and v26.autoSetupTarget) else nil;
    local v28 = l_Analytics_0:use();
    v3.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v28 (copy)
        v28:report("openPlugin");
    end, {});
    local v29 = nil;
    if v25.isRunning() then
        return (v3.createElement(v8));
    elseif v22() and v20() and v27.state.type ~= "none" then
        return (v3.createElement(v5, {
            autoSetupState = v27.state, 
            cancelAutoSetup = v27.cancelAutoSetup, 
            startAutoSetup = v27.startAutoSetup, 
            clearError = v27.clearError
        }));
    elseif v26 == nil then
        if v22() then
            return (v3.createElement(v7));
        else
            return (v3.createElement(v6));
        end;
    elseif v20() and v27.state.type ~= "none" then
        return (v3.createElement(v5, {
            autoSetupState = v27.state, 
            cancelAutoSetup = v27.cancelAutoSetup, 
            startAutoSetup = v27.startAutoSetup, 
            clearError = v27.clearError
        }));
    else
        if v26.avatar then
            v29 = v3.createElement(v16, {
                providers = v1.List.join(if v21() then {
                    v3.createElement(v14.Provider)
                } else {}, {
                    v3.createElement(v12, {
                        root = v26.avatar.WorldModel
                    }), 
                    v3.createElement(v9, {
                        root = v26.avatar.WorldModel
                    }), 
                    v3.createElement(v15), 
                    v3.createElement(v10), 
                    if not v22() then v3.createElement(v13.Provider) else nil
                }, v24.DEPRECATED_additionalAvatarContext or {})
            }, v3.createElement(v4, {
                Avatar = v26.avatar, 
                IsSelected = v26.isSelected
            }));
        end;
        return v29;
    end;
end;