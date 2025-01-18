local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Observable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
return function(v4) --[[ Line: 7 ]] --[[ Name: createSessionCapabilitiesProcessor ]]
    -- upvalues: v1 (copy)
    local v5, v6 = v1.create(nil);
    local v7 = {
        openInsertObjectMenuObservable = v5, 
        canOpenScripts = false
    };
    task.spawn(function() --[[ Line: 19 ]]
        -- upvalues: v4 (copy), v6 (copy), v7 (copy)
        local v8 = v4.guestRpcInterface.getCapabilitiesAsync();
        if v8.insertObjectButton then
            v6(function() --[[ Line: 24 ]]
                -- upvalues: v4 (ref)
                return v4.guestRpcInterface.openInsertObjectMenu;
            end);
        end;
        v7.canOpenScripts = v8.scriptOpening;
    end);
    return v7;
end;