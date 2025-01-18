local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Models_0 = l_Parent_0.Src.Models;
local v2 = require(l_Models_0.StepStateBundle);
local v3 = require(l_Models_0.Watch.WatchRow);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v5 = require(l_Thunks_0.Callstack.LoadStackFrameVariables);
local v6 = require(l_Thunks_0.Common.AddChildRowsToVars);
local v7 = require(l_Parent_0.Src.Actions.Callstack.SetCurrentThread);
local v8 = require(l_Parent_0.Src.Actions.Watch.ExpressionsEvaluated);
local v9 = require(l_Parent_0.Src.Util.WatchHelperFunctions);
return function(v10, v11, v12, v13) --[[ Line: 14 ]]
    -- upvalues: v7 (copy), v2 (copy), v5 (copy), v9 (copy), v3 (copy), v8 (copy), v6 (copy)
    return function(v14, _) --[[ Line: 15 ]]
        -- upvalues: v11 (copy), v10 (copy), v12 (copy), v13 (copy), v7 (ref), v2 (ref), v5 (ref), v9 (ref), v3 (ref), v8 (ref), v6 (ref)
        if not v11 then
            return;
        else
            v11:UpdateSelectedFrame(v10, v12);
            v13:SetCurrentThreadId(v10);
            v14:dispatch(v7(v10));
            local v16 = v14:getState().Common.debuggerConnectionIdToDST[v11.Id];
            local l_Children_0 = v11:GetThreadById(v10):GetChildren();
            local v18 = v2.ctor(v16, v10, v12 + 1);
            v14:dispatch(v5(v11, l_Children_0[v12 + 1], v18));
            local l_listOfExpressions_0 = v14:getState().Watch.listOfExpressions;
            local v20 = {};
            local v21 = {};
            local v22 = #l_listOfExpressions_0;
            for _, v24 in ipairs(l_listOfExpressions_0) do
                v9.evaluateWatchWithCallback(v24, v18, v11, v14, function(v25) --[[ Line: 44 ]]
                    -- upvalues: v20 (copy), v21 (copy), v3 (ref), v24 (copy), v22 (ref), v14 (copy), v8 (ref), v18 (copy), v6 (ref), v11 (ref)
                    if v25 ~= nil then
                        table.insert(v20, v25);
                        table.insert(v21, v3.fromInstance(v25, v24));
                    end;
                    v22 = v22 - 1;
                    if v22 == 0 then
                        v14:dispatch(v8(v18, v21));
                        v14:dispatch(v6("", v20, v18, false, v11));
                    end;
                end);
            end;
            return;
        end;
    end;
end;