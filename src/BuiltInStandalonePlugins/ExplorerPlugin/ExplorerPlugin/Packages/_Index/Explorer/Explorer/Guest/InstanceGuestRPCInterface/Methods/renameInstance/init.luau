local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Util.createDebugLogger)("renameInstance");
return function(v4, v5, v6) --[[ Line: 11 ]] --[[ Name: renameInstance ]]
    -- upvalues: v3 (copy)
    v3("Renaming %s to %s", v5, v6);
    assert(typeof(v5) == "string", "Instance ID is not a string");
    assert(typeof(v6) == "string", "New name is not a string");
    v6 = v6:sub(1, 100);
    local v7 = v4.instanceIdsToInstance[v5];
    assert(v7 ~= nil, "Host renaming instance that doesn't exist");
    v4.recordChanges(("Renaming %* to %*"):format(v7.Name, v6), function() --[[ Line: 25 ]]
        -- upvalues: v7 (copy), v6 (ref)
        v7.Name = v6;
        return Enum.FinishRecordingOperation.Commit;
    end);
end;