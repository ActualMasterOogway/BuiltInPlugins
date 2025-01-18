local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_Signal_0 = v1.Util.Signal;
local _ = require(script.Parent.ThreadState);
local _ = require(script.Parent.StackFrame);
local v5 = require(script.Parent.DebuggerVariable);
local v6 = require(script.Parent.MockDebuggerLuaResponse);
local v7 = require(script.Parent.Parent.Util.Constants);
local l_Promise_0 = v1.Util.Promise;
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_Signal_0 (copy), v9 (copy)
    local v11 = {};
    local v12 = v5.new(1, "Alex", "Instance", "Map");
    local v13 = v5.new(3, "Alex2", "somePreview", "map");
    v12:MockSetChildren({
        v13
    });
    local v14 = v5.new(2, "UnitedStates", "Instance", "Map");
    local v15 = v5.new(4, "Wisconsin", "Instance", "Map");
    local v16 = v5.new(5, "Madison", "somePreview", "map");
    v15:MockSetChildren({
        v16
    });
    v14:MockSetChildren({
        v15
    });
    v11.VariableMap = {
        [1] = v12, 
        [2] = v14, 
        [3] = v13, 
        [4] = v15, 
        [5] = v16
    };
    v11.watchMap = {
        Alex = v12, 
        UnitedStatesMockDebugger = v14
    };
    v11.MockThreadMap = {};
    v11.MockThreadIdToCallstackMap = {};
    v11.MockCallstackFrameToDebuggerVariables = {};
    v11.Id = v10;
    v11.Paused = l_Signal_0.new();
    v11.Resumed = l_Signal_0.new();
    v11.MockSetThreadStateById = function(v17, v18) --[[ Line: 46 ]]
        -- upvalues: v11 (copy)
        v11.MockThreadMap[v17] = v18;
    end;
    v11.MockSetCallstackByThreadId = function(v19, v20) --[[ Line: 50 ]]
        -- upvalues: v11 (copy)
        assert(v20);
        assert(v20[0]);
        v11.MockThreadIdToCallstackMap[v19] = v20;
    end;
    v11.MockSetDebuggerVariablesByCallstackFrame = function(v21, v22) --[[ Line: 56 ]]
        -- upvalues: v11 (copy)
        v11.MockCallstackFrameToDebuggerVariables[v21] = v22;
    end;
    setmetatable(v11, v9);
    return v11;
end;
v9.GetThreadById = function(v23, v24) --[[ Line: 64 ]] --[[ Name: GetThreadById ]]
    return v23.MockThreadMap[v24];
end;
v9.EvaluateWatch = function(v25, v26, _, v28) --[[ Line: 68 ]] --[[ Name: EvaluateWatch ]]
    -- upvalues: l_Promise_0 (copy), v6 (copy), v7 (copy)
    l_Promise_0.new(function(v29, _, _) --[[ Line: 69 ]]
        -- upvalues: v28 (copy)
        v29(v28);
    end):andThen(function(v32) --[[ Line: 73 ]]
        -- upvalues: v25 (copy), v26 (copy), v6 (ref), v7 (ref)
        local v33 = nil;
        v33 = if v25.watchMap[v26] ~= nil then v25.watchMap[v26] else {
            VariableId = 1
        };
        v32((v6.new(v33, v7.DebuggerStatus.Success)));
    end);
    return 0;
end;
v9.GetThreads = function(v34, v35) --[[ Line: 87 ]] --[[ Name: GetThreads ]]
    -- upvalues: l_Promise_0 (copy), v6 (copy), v7 (copy)
    l_Promise_0.new(function(v36, _, _) --[[ Line: 88 ]]
        -- upvalues: v35 (copy)
        v36(v35);
    end):andThen(function(v39) --[[ Line: 92 ]]
        -- upvalues: v6 (ref), v34 (copy), v7 (ref)
        v39((v6.new(v34.MockThreadMap, v7.DebuggerStatus.Success)));
    end);
    return 0;
end;
v9.Populate = function(v40, v41, v42) --[[ Line: 99 ]] --[[ Name: Populate ]]
    -- upvalues: l_Promise_0 (copy)
    if not v41.Populated then
        if v41.PopulatableType == "ThreadState" then
            v41:MockSetChildren(v40.MockThreadIdToCallstackMap[v41.ThreadId]);
        elseif v41.PopulatableType == "StackFrame" then
            v41:MockSetChildren(v40.MockCallstackFrameToDebuggerVariables[v41]);
        end;
    end;
    l_Promise_0.new(function(v43, _, _) --[[ Line: 108 ]]
        -- upvalues: v42 (copy)
        v43(v42);
    end):andThen(function(v46) --[[ Line: 112 ]]
        v46({});
    end);
    return 0;
end;
v9.GetVariableById = function(v47, v48) --[[ Line: 119 ]] --[[ Name: GetVariableById ]]
    return v47.VariableMap[v48];
end;
v9.UpdateSelectedFrame = function(v49, v50, v51) --[[ Line: 123 ]] --[[ Name: UpdateSelectedFrame ]]
    v49.selectedThreadId = v50;
    v49.selectedFrameNumber = v51;
end;
return v9;