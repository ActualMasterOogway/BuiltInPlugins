local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.HintText);
return {
    summary = "Helper text put below inputs", 
    story = function(v4) --[[ Line: 7 ]] --[[ Name: Story ]]
        -- upvalues: v2 (copy), v3 (copy)
        local l_controls_0 = v4.controls;
        return v2.createElement(v3, {
            text = l_controls_0.text, 
            hasError = l_controls_0.hasError
        });
    end, 
    controls = {
        text = "Helper text", 
        hasError = false
    }
};