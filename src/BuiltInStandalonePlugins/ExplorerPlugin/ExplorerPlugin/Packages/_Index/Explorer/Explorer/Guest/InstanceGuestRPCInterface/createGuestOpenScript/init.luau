local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v3, v4) --[[ Line: 6 ]] --[[ Name: createGuestOpenScript ]]
    if v4 == nil then
        return function(_) --[[ Line: 11 ]]
            error("openScript called when the guest does not support opening it");
        end;
    else
        return function(v6) --[[ Line: 16 ]]
            -- upvalues: v3 (copy), v4 (copy)
            local v7 = v3.instanceIdsToInstance[v6];
            assert(v7 ~= nil, "openScript called on unknown instance");
            assert(v7:IsA("LuaSourceContainer"), "Opening instance that is not a LuaSourceContainer");
            v4(v7);
        end;
    end;
end;