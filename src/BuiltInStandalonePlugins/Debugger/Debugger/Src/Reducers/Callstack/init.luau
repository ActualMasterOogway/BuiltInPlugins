local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local l_Models_0 = l_Parent_0.Src.Models;
local v5 = require(l_Actions_0.Callstack.AddCallstack);
local v6 = require(l_Actions_0.Callstack.AddThreadId);
local v7 = require(l_Actions_0.Common.Resumed);
local v8 = require(l_Actions_0.Common.ClearConnectionData);
local v9 = require(l_Actions_0.Common.SimPaused);
local v10 = require(l_Actions_0.Callstack.ColumnFilterChange);
local v11 = require(l_Models_0.ThreadInfo);
local _ = require(l_Models_0.DebuggerStateToken);
local _ = require(l_Models_0.Callstack.CallstackRow);
local v14 = require(l_Models_0.Callstack.ColumnEnum);
local v15 = {
    stateTokenToCallstackVars = {}, 
    listOfEnabledColumns = {
        v14.Frame, 
        v14.Source, 
        v14.Function, 
        v14.Line
    }
};
return v1.createReducer(v15, {
    [v6.name] = function(v16, v17) --[[ Line: 36 ]]
        -- upvalues: v2 (copy), v11 (copy)
        return v2.Dictionary.join(v16, {
            stateTokenToCallstackVars = v2.Dictionary.join(v16.stateTokenToCallstackVars, {
                [v17.debuggerStateToken] = {
                    threadList = v2.List.join(v16.stateTokenToCallstackVars[v17.debuggerStateToken].threadList, {
                        v11.fromData(v17)
                    }), 
                    threadIdToFrameList = v16.stateTokenToCallstackVars[v17.debuggerStateToken].threadIdToFrameList
                }
            })
        });
    end, 
    [v5.name] = function(v18, v19) --[[ Line: 50 ]]
        -- upvalues: v2 (copy)
        if v18.stateTokenToCallstackVars[v19.debuggerStateToken] == nil then
            assert(false);
            return v18;
        else
            return v2.Dictionary.join(v18, {
                stateTokenToCallstackVars = v2.Dictionary.join(v18.stateTokenToCallstackVars, {
                    [v19.debuggerStateToken] = {
                        threadIdToFrameList = v2.Dictionary.join(v18.stateTokenToCallstackVars[v19.debuggerStateToken].threadIdToFrameList, {
                            [v19.threadId] = v19.frameList
                        }), 
                        threadList = v18.stateTokenToCallstackVars[v19.debuggerStateToken].threadList
                    }
                })
            });
        end;
    end, 
    [v9.name] = function(v20, v21) --[[ Line: 71 ]]
        -- upvalues: v2 (copy)
        local v22 = true;
        if v20.stateTokenToCallstackVars[v21.debuggerStateToken] ~= nil then
            v22 = v20.stateTokenToCallstackVars[v21.debuggerStateToken].threadIdToFrameList[v21.threadId] == nil;
        end;
        assert(v22);
        return v2.Dictionary.join(v20, {
            stateTokenToCallstackVars = v2.Dictionary.join(v20.stateTokenToCallstackVars, {
                [v21.debuggerStateToken] = {
                    threadList = v20.stateTokenToCallstackVars[v21.debuggerStateToken] and v20.stateTokenToCallstackVars[v21.debuggerStateToken].threadList or {}, 
                    threadIdToFrameList = v20.stateTokenToCallstackVars[v21.debuggerStateToken] and v20.stateTokenToCallstackVars[v21.debuggerStateToken].threadIdToFrameList or {}
                }
            })
        });
    end, 
    [v7.name] = function(v23, v24) --[[ Line: 92 ]]
        -- upvalues: v2 (copy)
        local v25 = {};
        for _, v27 in ipairs(v23.stateTokenToCallstackVars[v24.debuggerStateToken].threadList) do
            if v27.threadId ~= v24.threadId then
                table.insert(v25, v27);
            end;
        end;
        assert(v23.stateTokenToCallstackVars[v24.debuggerStateToken] ~= nil);
        local v28 = v2.Dictionary.join(v23.stateTokenToCallstackVars[v24.debuggerStateToken].threadIdToFrameList, {});
        v28[v24.threadId] = nil;
        return v2.Dictionary.join(v23, {
            stateTokenToCallstackVars = v2.Dictionary.join(v23.stateTokenToCallstackVars, {
                [v24.debuggerStateToken] = {
                    threadIdToFrameList = v28, 
                    threadList = v25
                }
            })
        });
    end, 
    [v8.name] = function(v29, v30) --[[ Line: 116 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v29, {
            stateTokenToCallstackVars = v2.Dictionary.join(v29.stateTokenToCallstackVars, {
                [v30.debuggerStateToken] = v2.None
            })
        });
    end, 
    [v10.name] = function(v31, v32) --[[ Line: 125 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v31, {
            listOfEnabledColumns = v32.listOfEnabledColumns
        });
    end
});