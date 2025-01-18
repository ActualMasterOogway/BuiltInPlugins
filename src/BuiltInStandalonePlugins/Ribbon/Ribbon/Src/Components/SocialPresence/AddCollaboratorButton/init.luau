local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local v8 = require(l_script_FirstAncestor_0.Src.Util.SocialPresence.SocialPresenceDmBridge);
return function(v9) --[[ Line: 18 ]] --[[ Name: AddCollaboratorButton ]]
    -- upvalues: l_Plugin_0 (copy), l_Analytics_0 (copy), l_Localization_0 (copy), v1 (copy), v8 (copy), l_joinTags_0 (copy)
    local v10 = l_Plugin_0:use():get();
    local v11 = l_Analytics_0:use();
    local v12 = l_Localization_0.use();
    return v1.createElement("TextButton", {
        [v1.Event.Activated] = function() --[[ Line: 24 ]]
            -- upvalues: v11 (copy), v8 (ref), v10 (copy)
            v11:report("manageCollaboratorsPressed");
            v8.openManageCollaborators(v10);
        end, 
        [v1.Tag] = l_joinTags_0("Component-AddCollaboratorButton Role-Surface X-Fit State-Default", v9.IsTeamCreateOn and "Component-RibbonButton NonTeamCreate" or "Component-Button Primary X-CornerM TeamCreate")
    }, {
        StateLayer = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("Role-Surface X-Fit", v9.IsTeamCreateOn and "X-CornerXS X-PadMezzanine" or "X-CornerM X-PadButtonSmall X-Row X-Middle X-Center")
        }, {
            ButtonIcon = v1.createElement("ImageLabel", {
                [v1.Tag] = "Role-Surface Icon-Small"
            }), 
            ButtonText = if not v9.IsTeamCreateOn then v1.createElement("TextLabel", {
                Text = v12:getText("Plugin", "SocialPresence_Collaborate"), 
                [v1.Tag] = "Role-Surface X-Fit Small Primary"
            }) else nil
        })
    });
end;