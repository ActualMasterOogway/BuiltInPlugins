local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = {};
local l_some_0 = require(l_script_FirstAncestor_0.Packages.Dash).some;
local function v5(v4) --[[ Line: 11 ]] --[[ Name: getFlagValue ]]
    if v4:sub(1, 1) == "!" then
        return not game:GetFastFlag(v4:sub(2));
    else
        return game:GetFastFlag(v4);
    end;
end;
return function(v6) --[[ Line: 18 ]] --[[ Name: isControlEnabledFromFlags ]]
    -- upvalues: l_some_0 (copy), v2 (copy), v5 (copy)
    local l_FastFlag_0 = v6.FastFlag;
    if l_FastFlag_0 then
        if typeof(l_FastFlag_0) == "table" then
            local v9 = l_some_0(l_FastFlag_0.EnableIfAll or v2, function(v8) --[[ Line: 22 ]]
                return not if v8:sub(1, 1) == "!" then not game:GetFastFlag(v8:sub(2)) else game:GetFastFlag(v8);
            end);
            local v11 = l_some_0(l_FastFlag_0.DisableIfAny or v2, function(v10) --[[ Line: 25 ]]
                -- upvalues: v5 (ref)
                return v5(v10);
            end);
            return not (v9 or v11);
        else
            return v5(l_FastFlag_0);
        end;
    else
        return true;
    end;
end;