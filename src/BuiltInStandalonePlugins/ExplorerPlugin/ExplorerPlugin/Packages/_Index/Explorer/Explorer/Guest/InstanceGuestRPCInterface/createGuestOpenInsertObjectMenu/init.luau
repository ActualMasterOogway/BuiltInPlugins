local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v3, v4) --[[ Line: 6 ]] --[[ Name: createGuestOpenInsertObjectMenu ]]
    if v4 == nil then
        return function(_) --[[ Line: 11 ]]
            error("openInsertObjectMenu called when the guest does not support opening it");
        end;
    else
        return function(v6, v7) --[[ Line: 16 ]]
            -- upvalues: v3 (copy), v4 (copy)
            local v8 = v3.instanceIdsToInstance[v6];
            assert(v8 ~= nil, "openInsertObjectMenu called on unknown instance");
            v4(v8, v7);
        end;
    end;
end;