local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: findWrapTargetWithName ]]
    local l_v2_FirstChild_0 = v2:FindFirstChild(v3, true);
    if l_v2_FirstChild_0 == nil then
        return nil;
    elseif l_v2_FirstChild_0:IsA("WrapTarget") then
        return l_v2_FirstChild_0;
    else
        local l_l_v2_FirstChild_0_FirstChild_0 = l_v2_FirstChild_0:FindFirstChild(v3);
        if l_l_v2_FirstChild_0_FirstChild_0 == nil or not l_l_v2_FirstChild_0_FirstChild_0:IsA("WrapTarget") then
            return nil;
        else
            return l_l_v2_FirstChild_0_FirstChild_0;
        end;
    end;
end;