local l_Parent_0 = script.Parent.Parent;
local l_Models_0 = l_Parent_0.Models;
local v2 = require(l_Models_0.Watch.WatchRow);
local v3 = require(l_Models_0.Watch.VariableRow);
local v4 = require(l_Models_0.Watch.ScopeEnum);
local v5 = require(l_Models_0.StepStateBundle);
local v6 = require(l_Models_0.MetaBreakpoint);
local l_Mocks_0 = l_Parent_0.Mocks;
local v8 = require(l_Mocks_0.ThreadState);
local v9 = require(l_Mocks_0.StackFrame);
local v10 = require(l_Mocks_0.ScriptRef);
local v11 = require(l_Mocks_0.PausedState);
local v12 = require(l_Mocks_0.DebuggerVariable);
local v13 = require(l_Mocks_0.MockDebuggerConnection);
local v14 = require(l_Mocks_0.MockDebuggerConnectionManager);
local v15 = require(l_Mocks_0.MockDebuggerUIService);
local v16 = require(l_Mocks_0.MockCrossDMScriptChangeListenerService);
local l_Actions_0 = l_Parent_0.Actions;
local v18 = require(l_Actions_0.Watch.AddExpression);
local v19 = require(l_Actions_0.Watch.ExpressionEvaluated);
local v20 = require(l_Actions_0.BreakpointsWindow.AddBreakpoint);
local v21 = require(l_Actions_0.Watch.AddChildVariables);
local v22 = require(l_Parent_0.Util.DebugConnectionListener.DebugConnectionListener);
local v23 = require(l_Parent_0.Util.Constants);
return function(v24) --[[ Line: 30 ]]
    -- upvalues: v4 (copy), v2 (copy), v12 (copy), v3 (copy), v10 (copy), v9 (copy), v8 (copy), v11 (copy), v23 (copy), v13 (copy), v14 (copy), v22 (copy), v15 (copy), v16 (copy), v5 (copy), v18 (copy), v19 (copy), v20 (copy), v6 (copy), v21 (copy)
    local v25 = {
        expression = "Expression 1", 
        path = "3", 
        scope = v4.Local, 
        value = "somePreview", 
        dataType = "string", 
        childPaths = {}
    };
    local v26 = v2.fromData(v25);
    local v27 = v12.new(1, "Alex", "somePreview", "map");
    local v28 = {
        name = "Heesoo", 
        path = "Alex_Heesoo", 
        scope = v4.Local, 
        value = "somePreview", 
        dataType = "map"
    };
    local v29 = {
        name = "Austin", 
        path = "Alex_Austin", 
        scope = v4.Local, 
        value = "somePreview", 
        dataType = "string"
    };
    local v30 = {
        name = "Raul", 
        path = "Alex_Heesoo_Raul", 
        scope = v4.Local, 
        value = "somePreview", 
        dataType = "string"
    };
    local v31 = {
        name = "Karan", 
        path = "Alex_Austin_Karan", 
        scope = v4.Local, 
        value = "somePreview", 
        dataType = "string"
    };
    local v32 = v12.new(2, "UnitedStates", "somePreview2", "map");
    local v33 = {
        name = "Wisconsin", 
        path = "UnitedStates_Wisconsin", 
        scope = v4.Local, 
        value = "somePreview2", 
        dataType = "map"
    };
    local v34 = {
        name = "GreenBay", 
        path = "UnitedStates_Wisconsin_GreenBay", 
        scope = v4.Local, 
        value = "somePreview2", 
        dataType = "string"
    };
    local v35 = v3.fromData(v28);
    local v36 = v3.fromData(v29);
    local v37 = v3.fromData(v30);
    local v38 = v3.fromData(v31);
    local v39 = v3.fromData(v33);
    local v40 = v3.fromData(v34);
    local v41 = v10.new();
    local v42 = v10.new();
    local v43 = v9.new(10, v41, "TestFrame1", "C");
    local v44 = v9.new(20, v42, "TestFrame2", "C");
    local v45 = {
        [0] = v43, 
        [1] = v44
    };
    local v46 = {
        [0] = v44, 
        [1] = v43
    };
    local v47 = v8.new(1, v41, true);
    local v48 = v8.new(2, v42, true);
    local v49 = nil;
    v49 = v11.new(v23.DebuggerPauseReason.Requested, 1, true);
    local v50 = v13.new(1);
    local v51 = v14.new();
    local _ = v22.new(v24, v51, v15.new(), v16.new());
    v50.MockSetThreadStateById(1, v47);
    v50.MockSetThreadStateById(2, v48);
    v50.MockSetCallstackByThreadId(1, v45);
    v50.MockSetCallstackByThreadId(2, v46);
    local v53 = v12.GetDefaultFrameVariables();
    v53.Locals:MockSetChildren({
        v27, 
        v32
    });
    v50.MockSetDebuggerVariablesByCallstackFrame(v43, v53);
    local v54 = v12.GetDefaultFrameVariables();
    v54.Locals:MockSetChildren({
        v32, 
        v27
    });
    v50.MockSetDebuggerVariablesByCallstackFrame(v44, v54);
    v51.ConnectionStarted:Fire(v50);
    v50.Paused:Fire(v49, v49.Reason);
    local l_Common_0 = v24:getState().Common;
    local v56 = l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId];
    local v57 = v5.ctor(v56, 1, 1);
    v24:dispatch(v18("Expression 1"));
    v24:dispatch(v19(v57, v26));
    local v58 = 0;
    for _, v60 in ipairs({
        1, 
        2, 
        3, 
        4, 
        5, 
        6, 
        7, 
        8, 
        9, 
        10, 
        11, 
        12, 
        14
    }) do
        v24:dispatch(v20(123, v6.mockMetaBreakpoint({
            isEnabled = v58 >= 6
        }, v60)));
        v58 = v58 + 1;
    end;
    v24:dispatch(v21(v57, "Alex", {
        v35, 
        v36
    }));
    v24:dispatch(v21(v57, "Alex_Heesoo", {
        v37
    }));
    v24:dispatch(v21(v57, "Alex_Austin", {
        v38
    }));
    v24:dispatch(v21(v57, "UnitedStates", {
        v39
    }));
    v24:dispatch(v21(v57, "UnitedStates_Wisconsin", {
        v40
    }));
    return v24;
end;