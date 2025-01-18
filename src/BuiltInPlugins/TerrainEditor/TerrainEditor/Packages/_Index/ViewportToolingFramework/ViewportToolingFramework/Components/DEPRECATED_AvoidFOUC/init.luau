local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Hooks.useToggleState);
return function(v3) --[[ Line: 16 ]] --[[ Name: AvoidFOUC ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2(false);
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        Visible = v4.enabled, 
        [v1.Change.BackgroundColor3] = v4.enable, 
        [v1.Tag] = "VPF-AvoidFOUC"
    }, v3.children);
end;