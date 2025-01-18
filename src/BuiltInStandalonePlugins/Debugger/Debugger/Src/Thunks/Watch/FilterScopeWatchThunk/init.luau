local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Models_0 = l_Parent_0.Src.Models;
local v2 = require(l_Models_0.StepStateBundle);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.Watch.SetVariablesScopeFilteredOut);
local v5 = require(l_Actions_0.Watch.ScopeFilterChange);
local v6 = require(l_Parent_0.Src.Util.WatchHelperFunctions);
return function(v7) --[[ Line: 11 ]]
    -- upvalues: v5 (copy), v2 (copy), v6 (copy), v4 (copy)
    return function(v8, _) --[[ Line: 12 ]]
        -- upvalues: v5 (ref), v7 (copy), v2 (ref), v6 (ref), v4 (ref)
        v8:dispatch(v5(v7));
        local v10 = v8:getState();
        local l_Common_0 = v10.Common;
        local l_Watch_0 = v10.Watch;
        local v13 = l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId];
        local v14 = l_Common_0.debuggerConnectionIdToCurrentThreadId[l_Common_0.currentDebuggerConnectionId];
        if v14 == nil then
            return;
        else
            local v15 = l_Common_0.currentFrameMap[l_Common_0.currentDebuggerConnectionId][v14];
            local v16 = v2.ctor(v13, v14, v15);
            local l_stateTokenToRoots_0 = l_Watch_0.stateTokenToRoots;
            local l_stateTokenToFlattenedTree_0 = l_Watch_0.stateTokenToFlattenedTree;
            local v19 = l_stateTokenToRoots_0[v13] and l_stateTokenToRoots_0[v13][v14] and l_stateTokenToRoots_0[v13][v14][v15];
            if v19 == nil then
                return;
            else
                local v20 = l_stateTokenToFlattenedTree_0[v13] and l_stateTokenToFlattenedTree_0[v13][v14] and l_stateTokenToFlattenedTree_0[v13][v14][v15];
                if v20 == nil then
                    warn("unexpected nil in filter thunk");
                    return;
                else
                    local l_Variables_0 = v19.Variables;
                    local l_Variables_1 = v20.Variables;
                    local v23 = {};
                    for _, v25 in pairs(l_Variables_0) do
                        v23[v25] = v6.isScopeFiltered(v7, l_Variables_1[v25]);
                    end;
                    v8:dispatch(v4(v16, v23));
                    return;
                end;
            end;
        end;
    end;
end;