local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: hasCorrectAspectRatio ]]
    -- upvalues: v1 (copy)
    local v5 = v4.X / v4.Z;
    if math.abs(v3.Width / v3.Height - v5) <= v1.AspectRatioThreshold then
        return true, "";
    else
        local function v6(v7, v8) --[[ Line: 15 ]] --[[ Name: gcd ]]
            -- upvalues: v6 (copy)
            if v8 == 0 then
                return v7;
            else
                return (v6(v8, v7 % v8));
            end;
        end;
        local l_Width_0 = v3.Width;
        local l_Height_0 = v3.Height;
        local v11 = if l_Height_0 == 0 then l_Width_0 else v6(l_Height_0, l_Width_0 % l_Height_0);
        return false, (("%*:%*"):format(v3.Width / v11, v3.Height / v11));
    end;
end;