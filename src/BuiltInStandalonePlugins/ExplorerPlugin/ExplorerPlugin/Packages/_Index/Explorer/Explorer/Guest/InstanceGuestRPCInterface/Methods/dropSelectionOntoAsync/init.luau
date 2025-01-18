local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v4, v5) --[[ Line: 8 ]] --[[ Name: dropSelectionOntoAsync ]]
    -- upvalues: l_Selection_0 (copy)
    local v6 = v4.instanceIdsToInstance[v5];
    assert(v6 ~= nil, "Dropping selection onto unknown instance");
    local v7 = {};
    local v8 = false;
    v4.recordChanges("Moving instances", function() --[[ Line: 18 ]]
        -- upvalues: l_Selection_0 (ref), v6 (copy), v8 (ref), v7 (copy)
        for _, v10 in l_Selection_0:Get() do
            xpcall(function() --[[ Line: 20 ]]
                -- upvalues: v10 (copy), v6 (ref), v8 (ref)
                v10.Parent = v6;
                v8 = true;
            end, function(v11) --[[ Line: 23 ]]
                -- upvalues: v7 (ref)
                table.insert(v7, v11);
            end);
        end;
        if v8 then
            return Enum.FinishRecordingOperation.Commit;
        else
            return Enum.FinishRecordingOperation.Cancel;
        end;
    end);
    return v7;
end;