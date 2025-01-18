local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetPinnedParts);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 6 ]]
        -- upvalues: v1 (ref), v3 (copy), v2 (ref)
        local l_PinnedParts_0 = v4:getState().Status.PinnedParts;
        local v6 = v1.Dictionary.join(l_PinnedParts_0);
        if v6[v3] ~= nil then
            v6[v3] = not v6[v3];
        else
            v6[v3] = true;
        end;
        v4:dispatch(v2(v6));
    end;
end;