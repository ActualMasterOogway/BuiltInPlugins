local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Observable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
return function(v4) --[[ Line: 7 ]] --[[ Name: createSessionInstancePicker ]]
    -- upvalues: v1 (copy)
    local v5, v6 = v1.create(false);
    return {
        instancePickerActivated = function() --[[ Line: 16 ]] --[[ Name: instancePickerActivated ]]
            -- upvalues: v6 (copy)
            v6(true);
        end, 
        instancePickerDeactivated = function() --[[ Line: 20 ]] --[[ Name: instancePickerDeactivated ]]
            -- upvalues: v6 (copy)
            v6(false);
        end, 
        instancePickerActiveObservable = v5, 
        instancePickerSubmitInstance = function(v7) --[[ Line: 24 ]] --[[ Name: instancePickerSubmitInstance ]]
            -- upvalues: v4 (copy), v6 (copy)
            v4.guestRpcInterface.instancePickerSubmitInstance(v7);
            v6(false);
        end
    };
end;