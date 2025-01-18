local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.Types);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagViewportToolingFrameworkSplitButtons);
return function(v4) --[[ Line: 17 ]] --[[ Name: Icon ]]
    -- upvalues: v1 (copy), v3 (copy)
    if typeof(v4.Icon) == "string" then
        return (v1.createElement("ImageLabel", {
            Image = v4.Icon, 
            LayoutOrder = v4.LayoutOrder, 
            [v1.Tag] = "VPF-Icon"
        }));
    else
        return (v1.createElement("Frame", {
            LayoutOrder = v4.LayoutOrder, 
            [v1.Tag] = v3() and "X-Fill VPF-X-Square" or "X-Fill"
        }, {
            Icon = v4.Icon
        }));
    end;
end;