local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v1.ContextServices.Localization;
local l_DialogAction_0 = v1.Util.DialogAction;
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
return {
    get = function() --[[ Line: 13 ]] --[[ Name: get ]]
        -- upvalues: l_Localization_0 (copy), l_DialogAction_0 (copy), l_StartPageManager_0 (copy)
        local v5 = l_Localization_0:use();
        return {
            Intent = "Warning", 
            Heading = v5:getText("Plugin", "VerifyAgeDialog.Heading"), 
            Body = v5:getText("Plugin", "VerifyAgeDialog.BodyPoint1") .. "\n" .. v5:getText("Plugin", "VerifyAgeDialog.BodyPoint2"), 
            ActionPrimary = l_DialogAction_0.CANCEL, 
            ActionSecondary = {
                Label = v5:getText("Plugin", "VerifyAgeDialog.Action"), 
                OnActivated = function() --[[ Line: 27 ]] --[[ Name: OnActivated ]]
                    -- upvalues: l_StartPageManager_0 (ref)
                    l_StartPageManager_0:openLink("https://www.roblox.com/my/account#!/info");
                end, 
                Enabled = true, 
                HidesDialog = true
            }, 
            Modal = true
        };
    end
};