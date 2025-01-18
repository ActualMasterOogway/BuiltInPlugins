local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Components.InputLabel);
local v5 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
return {
    summary = "Label put above inputs", 
    story = function(v6) --[[ Line: 11 ]] --[[ Name: Story ]]
        -- upvalues: v2 (copy), v4 (copy)
        local l_controls_0 = v6.controls;
        return v2.createElement(v4, {
            Text = l_controls_0.Text, 
            size = l_controls_0.size, 
            isRequired = l_controls_0.isRequired, 
            RichText = l_controls_0.RichText
        });
    end, 
    controls = {
        Text = "Input Label", 
        size = v3.values(v5), 
        isRequired = {
            v2.None, 
            false, 
            true
        }, 
        RichText = false
    }
};