local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Networking.createSession.RootStateUpdating);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v5 = v3("RootStateUpdating");
return function(v6, v7) --[[ Line: 10 ]] --[[ Name: createSessionDataModelUpdating ]]
    -- upvalues: v1 (copy), v5 (copy)
    local function v9(v8) --[[ Line: 17 ]] --[[ Name: instanceAdded ]]
        -- upvalues: v1 (ref), v6 (copy)
        v8 = table.freeze(v8);
        v1.instanceAdded(v6.rootState, v8);
        v6.rootState.fireRootChanged();
    end;
    local function v11(v10) --[[ Line: 24 ]] --[[ Name: instanceReplaced ]]
        -- upvalues: v5 (ref), v1 (ref), v6 (copy), v7 (copy)
        v10 = table.freeze(v10);
        v5("%s (%s, ID = %s) replaced", v10.name, v10.className, v10.id);
        v1.instanceReplaced(v6.rootState, v10);
        v6.rootState.fireRootChanged();
        if v6.searchRootState ~= nil then
            v7(v10);
        end;
    end;
    return {
        instanceAdded = v9, 
        instanceReplaced = v11
    };
end;