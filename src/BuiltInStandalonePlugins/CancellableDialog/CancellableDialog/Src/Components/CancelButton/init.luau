local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_joinTags_0 = v2.Styling.joinTags;
return function(v5) --[[ Line: 16 ]] --[[ Name: CancelButton ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), l_joinTags_0 (copy)
    local v6 = l_Localization_0:use();
    return v1.createElement("Frame", {
        LayoutOrder = v5.LayoutOrder, 
        [v1.Tag] = "X-FitY X-Row X-Right Component-CancelButton"
    }, {
        CancelButton = v1.createElement("TextButton", {
            Text = v6:getText("Button", "Cancel"), 
            [v1.Tag] = l_joinTags_0("X-Corner X-Fit Cancel-Button", v5.Enabled and "Enabled" or "Disabled"), 
            [v1.Event.Activated] = function() --[[ Line: 26 ]]
                -- upvalues: v5 (copy)
                if v5.Enabled then
                    v5.OnCancel();
                end;
            end
        })
    });
end;