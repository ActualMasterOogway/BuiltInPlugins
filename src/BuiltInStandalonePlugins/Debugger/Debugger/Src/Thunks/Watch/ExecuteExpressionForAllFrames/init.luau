local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Models_0 = l_Parent_0.Src.Models;
local v2 = require(l_Models_0.StepStateBundle);
local _ = require(l_Models_0.DebuggerStateToken);
local v4 = require(l_Parent_0.Src.Thunks.Watch.ExecuteExpressionThunk);
return function(v5, v6, v7, v8) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v4 (copy)
    return function(v9, _) --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v8 (copy), v2 (ref), v7 (copy), v4 (ref), v5 (copy)
        assert(v6);
        local l_v6_ThreadById_0 = v6:GetThreadById(v8);
        assert(l_v6_ThreadById_0);
        for v12 = 1, l_v6_ThreadById_0.FrameCount do
            local v13 = v2.ctor(v7, v8, v12);
            v9:dispatch(v4(v5, v13, v6));
        end;
    end;
end;