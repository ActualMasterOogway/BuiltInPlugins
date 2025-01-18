local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Components.Skeleton);
local v5 = require(l_script_FirstAncestor_0.Enums.Radius);
return {
    summary = "Skeleton component", 
    story = function(v6) --[[ Line: 11 ]] --[[ Name: story ]]
        -- upvalues: v2 (copy), v4 (copy)
        return v2.createElement(v4, {
            radius = v6.controls.radius, 
            Size = UDim2.new(0, 100, 0, 100)
        });
    end, 
    controls = {
        radius = v3.values(v5)
    }
};