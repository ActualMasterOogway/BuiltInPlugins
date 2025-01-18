local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Util.createDebugLogger)("stopListening");
return function(_, v5) --[[ Line: 9 ]] --[[ Name: stopListening ]]
    -- upvalues: v3 (copy)
    v3("Stopped listening to %*", v5);
    assert(typeof(v5) == "string", "Instance ID is not a string");
end;