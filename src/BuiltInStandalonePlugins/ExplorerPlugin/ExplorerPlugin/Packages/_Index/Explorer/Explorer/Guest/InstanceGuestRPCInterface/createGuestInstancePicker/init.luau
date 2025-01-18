local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Parent.Signal);
return function(v4, v5) --[[ Line: 13 ]] --[[ Name: createGuestInstancePicker ]]
    local v6 = v5.activatedSignal:Connect(function() --[[ Line: 20 ]]
        -- upvalues: v4 (copy)
        v4.hostRpcInterface.instancePickerActivated();
    end);
    local v7 = v5.deactivatedSignal:Connect(function() --[[ Line: 24 ]]
        -- upvalues: v4 (copy)
        v4.hostRpcInterface.instancePickerDeactivated();
    end);
    return {
        instancePickerSubmitInstance = function(v8) --[[ Line: 28 ]] --[[ Name: instancePickerSubmitInstance ]]
            -- upvalues: v5 (copy), v4 (copy)
            v5.submitPickedInstance(v8 and v4.instanceIdsToInstance[v8]);
        end, 
        destroy = function() --[[ Line: 34 ]] --[[ Name: destroy ]]
            -- upvalues: v6 (copy), v7 (copy)
            v6:Disconnect();
            v7:Disconnect();
        end
    };
end;