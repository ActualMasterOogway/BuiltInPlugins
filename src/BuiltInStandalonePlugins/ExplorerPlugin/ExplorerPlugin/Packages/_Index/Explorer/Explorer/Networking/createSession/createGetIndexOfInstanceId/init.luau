local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v3 = require(l_script_FirstAncestor_0.Util.getExplorerNodeIndex);
return function(v4) --[[ Line: 7 ]] --[[ Name: createGetIndexOfInstanceId ]]
    -- upvalues: v3 (copy)
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: v4 (copy), v3 (ref)
        local v6 = v4.getFocusedRootState().instanceIdsToNodes[v5];
        if v6 == nil then
            return nil;
        else
            return v3(v6);
        end;
    end;
end;