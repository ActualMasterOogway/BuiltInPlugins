local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local _ = require(l_script_FirstAncestor_0.Types);
return function(v2) --[[ Line: 8 ]] --[[ Name: getToolbarDirection ]]
    if v2.HorizontalItems == nil then
        return "Vertical";
    else
        return "Horizontal";
    end;
end;