local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: createGuestFocusing ]]
    local v4 = nil;
    local function v6(v5) --[[ Line: 15 ]] --[[ Name: setListenForFocus ]]
        -- upvalues: v3 (copy), v4 (ref), v2 (copy)
        if v3 == nil then
            return;
        elseif v5 and not v4 then
            v4 = v3(v2.hostRpcInterface.fireFocusRequested);
            return;
        else
            if not v5 and v4 then
                v4();
                v4 = nil;
            end;
            return;
        end;
    end;
    local function v7() --[[ Line: 28 ]] --[[ Name: destroy ]]
        -- upvalues: v4 (ref)
        if v4 then
            v4();
            v4 = nil;
        end;
    end;
    return {
        setListenForFocus = v6, 
        destroy = v7
    };
end;