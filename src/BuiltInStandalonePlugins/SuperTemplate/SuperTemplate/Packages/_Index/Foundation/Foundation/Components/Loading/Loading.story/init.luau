local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Loading);
local v4 = require(l_script_FirstAncestor_0.Enums.IconSize);
return {
    summary = "Loading component", 
    story = function(v5) --[[ Line: 10 ]] --[[ Name: story ]]
        -- upvalues: v2 (copy), v3 (copy)
        local l_controls_0 = v5.controls;
        return v2.createElement(v3, {
            size = l_controls_0.size
        });
    end, 
    controls = {
        size = {
            v4.Large, 
            v4.Medium, 
            v4.Small
        }
    }
};