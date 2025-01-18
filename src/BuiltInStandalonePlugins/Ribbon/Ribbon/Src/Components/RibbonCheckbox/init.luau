local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v4) --[[ Line: 39 ]] --[[ Name: RibbonCheckbox ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy)
    local v5 = v4.Checked or false;
    local v6 = v4.Disabled or false;
    local l_OnClick_0 = v4.OnClick;
    local l_LayoutOrder_0 = v4.LayoutOrder;
    local v9 = v4.Size or "Medium";
    local v10 = v4.Text or "";
    local l_TextWrapped_0 = v4.TextWrapped;
    local v12 = nil;
    v12 = v6 and "State-Disabled" or "State-Default";
    if v5 == true then
        v12 = v12 .. " Checked";
    elseif v5 == "Indeterminate" then
        v12 = v12 .. " Indeterminate";
    end;
    return v1.createElement("Frame", {
        LayoutOrder = l_LayoutOrder_0, 
        [v1.Tag] = l_joinTags_0("Component-RibbonCheckbox X-Fit X-Middle", v9, v12)
    }, {
        CheckboxButton = v1.createElement("TextButton", {
            [v1.Event.Activated] = function() --[[ Line: 66 ]]
                -- upvalues: v6 (copy), l_OnClick_0 (copy), v4 (copy)
                if not v6 and l_OnClick_0 then
                    l_OnClick_0(v4.Key, v4.Uri);
                end;
            end, 
            [v1.Tag] = "X-Fit X-Middle"
        }, {
            CheckboxIcon = v1.createElement("ImageLabel", {}), 
            CheckboxLabel = if v10 ~= "" then v1.createElement("TextLabel", {
                Text = v10, 
                TextWrapped = l_TextWrapped_0, 
                [v1.Tag] = "X-Fit"
            }) else nil
        })
    });
end;