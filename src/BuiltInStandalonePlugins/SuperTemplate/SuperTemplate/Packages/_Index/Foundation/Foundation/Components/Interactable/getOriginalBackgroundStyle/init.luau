local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v5, v6) --[[ Line: 11 ]] --[[ Name: getOriginalBackgroundStyle ]]
    -- upvalues: v3 (copy), v2 (copy)
    if v3.isBinding(v5) and v3.isBinding(v6) then
        return v2.joinBindings({
            backgroundColor3 = v5, 
            backgroundTransparency = v6
        }):map(function(v7) --[[ Line: 19 ]]
            return {
                Color3 = v7.backgroundColor3, 
                Transparency = v7.backgroundTransparency
            };
        end);
    elseif v3.isBinding(v5) then
        return v5:map(function(v8) --[[ Line: 23 ]]
            -- upvalues: v6 (copy)
            return {
                Color3 = v8, 
                Transparency = v6
            };
        end);
    elseif v3.isBinding(v6) then
        return v6:map(function(v9) --[[ Line: 27 ]]
            -- upvalues: v5 (copy)
            return {
                Color3 = v5, 
                Transparency = v9
            };
        end);
    else
        return {
            Color3 = v5, 
            Transparency = v6
        };
    end;
end;