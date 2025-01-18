local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Components.Toggle);
local v5 = require(l_script_FirstAncestor_0.Enums.ToggleSize);
return {
    summary = "Toggle component", 
    story = function(v6) --[[ Line: 9 ]] --[[ Name: Story ]]
        -- upvalues: v2 (copy), v4 (copy)
        local l_controls_0 = v6.controls;
        local v8, v9 = v2.useState(false);
        return v2.createElement(v4, {
            isChecked = v8, 
            isDisabled = l_controls_0.isDisabled, 
            onActivated = function() --[[ Line: 16 ]] --[[ Name: onActivated ]]
                -- upvalues: v9 (copy), v8 (copy)
                v9(not v8);
            end, 
            size = l_controls_0.size, 
            label = l_controls_0.label or ""
        });
    end, 
    controls = {
        isDisabled = false, 
        label = "Label", 
        size = v3.values(v5)
    }
};