local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local _ = require(l_script_FirstAncestor_0.Types);
return function(v2) --[[ Line: 6 ]] --[[ Name: getToolbarItems ]]
    return v2.HorizontalItems or v2.VerticalItems;
end;