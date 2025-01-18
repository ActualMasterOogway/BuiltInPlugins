local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Checkbox);
local v4 = require(l_script_FirstAncestor_0.Enums.CheckboxSize);
return {
    summary = "Checkbox component", 
    story = function(v5) --[[ Line: 9 ]] --[[ Name: Story ]]
        -- upvalues: v2 (copy), v3 (copy)
        local l_controls_0 = v5.controls;
        local v7, v8 = v2.useState(false);
        return v2.createElement(v3, {
            isChecked = v7, 
            isDisabled = l_controls_0.isDisabled, 
            onActivated = function() --[[ Line: 16 ]] --[[ Name: onActivated ]]
                -- upvalues: v8 (copy), v7 (copy)
                v8(not v7);
            end, 
            size = l_controls_0.size, 
            label = l_controls_0.label or ""
        });
    end, 
    controls = {
        isDisabled = false, 
        label = "Label", 
        size = {
            v4.Large, 
            v4.Medium, 
            v4.Small
        }
    }
};