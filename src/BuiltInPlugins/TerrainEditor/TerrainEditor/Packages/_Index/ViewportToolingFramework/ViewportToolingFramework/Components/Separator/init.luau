local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
return function(v2) --[[ Line: 10 ]] --[[ Name: Separator ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        LayoutOrder = v2.NextOrder(), 
        [v1.Tag] = "VPF-Separator"
    }, {
        SeparatorBar = v1.createElement("Frame", {
            [v1.Tag] = "VPF-SeparatorBar"
        })
    });
end;