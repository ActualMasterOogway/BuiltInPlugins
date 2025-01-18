local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = game:DefineFastFlag("DebugExplorerMoreDetailedInstanceId", false);
return function(v5, v6) --[[ Line: 9 ]] --[[ Name: getInstanceId ]]
    -- upvalues: v1 (copy), v4 (copy)
    if v6 == v5.root then
        return v1.rootId;
    else
        local v7 = v5.instancesToInstanceId[v6];
        if v7 ~= nil then
            return v7;
        else
            local v8 = v5.nextNonce();
            if v4 then
                v8 = ("%*_%*_%*"):format(v6.ClassName, v6:GetFullName():gsub("%.", "/"), v8);
            end;
            v5.instanceIdsToInstance[v8] = v6;
            v5.instancesToInstanceId[v6] = v8;
            return v8;
        end;
    end;
end;