local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.lerp);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: getBackgroundStyleWithStateLayer ]]
    -- upvalues: v1 (copy)
    if v4.Transparency == 1 then
        return {
            Color3 = v3.Color3, 
            Transparency = v3.Transparency
        };
    elseif v3.Color3 == nil or v3.Transparency == 1 then
        return {
            Color3 = v4.Color3, 
            Transparency = v4.Transparency
        };
    else
        local v5 = v3.Transparency or 0;
        return {
            Color3 = v3.Color3:Lerp(v4.Color3, 1 - v4.Transparency), 
            Transparency = v1(v5, v4.Transparency, v5)
        };
    end;
end;