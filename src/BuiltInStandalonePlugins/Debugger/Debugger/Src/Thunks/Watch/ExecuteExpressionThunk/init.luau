local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.Watch.ExpressionEvaluated);
local l_Models_0 = l_Parent_0.Src.Models;
local _ = require(l_Models_0.StepStateBundle);
local v4 = require(l_Models_0.Watch.WatchRow);
local v5 = require(l_Parent_0.Src.Util.WatchHelperFunctions);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v7 = require(l_Thunks_0.Common.AddChildRowsToVars);
return function(v8, v9, v10) --[[ Line: 11 ]]
    -- upvalues: v5 (copy), v4 (copy), v1 (copy), v7 (copy)
    return function(v11, _) --[[ Line: 12 ]]
        -- upvalues: v5 (ref), v8 (copy), v9 (copy), v10 (copy), v4 (ref), v1 (ref), v7 (ref)
        v5.evaluateWatchWithCallback(v8, v9, v10, v11, function(v13) --[[ Line: 18 ]]
            -- upvalues: v4 (ref), v8 (ref), v11 (copy), v1 (ref), v9 (ref), v7 (ref), v10 (ref)
            if v13 ~= nil then
                local v14 = v4.fromInstance(v13, v8);
                v11:dispatch(v1(v9, v14));
                v11:dispatch(v7("", {
                    v13
                }, v9, false, v10));
            end;
        end);
    end;
end;