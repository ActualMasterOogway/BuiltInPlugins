local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v1.ContextServices.Localization;
local l_DialogAction_0 = v1.Util.DialogAction;
return {
    get = function() --[[ Line: 12 ]] --[[ Name: get ]]
        -- upvalues: l_Localization_0 (copy), l_DialogAction_0 (copy)
        local v4 = l_Localization_0:use();
        return {
            Intent = "Warning", 
            Heading = v4:getText("Plugin", "AgeRestrictionDialog.Heading"), 
            Body = v4:getText("Plugin", "AgeRestrictionDialog.Body"), 
            ActionPrimary = l_DialogAction_0.CANCEL, 
            Modal = true
        };
    end
};