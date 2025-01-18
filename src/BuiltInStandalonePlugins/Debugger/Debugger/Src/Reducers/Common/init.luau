local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.Callstack.SetCurrentThread);
local v6 = require(l_Actions_0.Callstack.SetCurrentFrameNumber);
local v7 = require(l_Actions_0.Common.Resumed);
local v8 = require(l_Actions_0.Common.SetPausedState);
local v9 = require(l_Actions_0.Common.SimPaused);
local v10 = require(l_Actions_0.Common.SetCurrentBreakpointId);
local v11 = require(l_Actions_0.Common.ClearConnectionData);
local v12 = require(l_Actions_0.Callstack.AddThreadId);
local v13 = require(l_Actions_0.Common.SetFocusedDebuggerConnection);
local l_deepCopy_0 = require(l_Parent_0.Packages.Framework).Util.deepCopy;
local _ = require(l_Parent_0.Src.Models.DebuggerStateToken);
local v16 = {
    debuggerConnectionIdToDST = {}, 
    currentDebuggerConnectionId = v3.kInvalidDebuggerConnectionId, 
    debuggerConnectionIdToCurrentThreadId = {}, 
    currentFrameMap = {}, 
    currentBreakpointId = nil, 
    isPaused = false, 
    hitException = {}, 
    pausedDebuggerConnectionIds = {}
};
return v1.createReducer(v16, {
    [v5.name] = function(v17, v18) --[[ Line: 54 ]]
        -- upvalues: l_deepCopy_0 (copy), v2 (copy)
        local v19 = l_deepCopy_0(v17.debuggerConnectionIdToCurrentThreadId);
        v19[v17.currentDebuggerConnectionId] = v18.currentThreadId;
        return v2.Dictionary.join(v17, {
            debuggerConnectionIdToCurrentThreadId = v19
        });
    end, 
    [v6.name] = function(v20, v21) --[[ Line: 63 ]]
        -- upvalues: l_deepCopy_0 (copy), v2 (copy)
        local v22 = l_deepCopy_0(v20.currentFrameMap);
        assert(v22[v20.currentDebuggerConnectionId] ~= nil);
        v22[v20.currentDebuggerConnectionId][v21.threadId] = v21.currentFrame;
        return v2.Dictionary.join(v20, {
            currentFrameMap = v22
        });
    end, 
    [v7.name] = function(v23, v24) --[[ Line: 75 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v23, {
            debuggerConnectionIdToDST = v2.Dictionary.join(v23.debuggerConnectionIdToDST, {
                [v24.debuggerStateToken.debuggerConnectionId] = v2.None
            }), 
            debuggerConnectionIdToCurrentThreadId = {}, 
            currentFrameMap = {}, 
            isPaused = false, 
            hitException = {}, 
            pausedDebuggerConnectionIds = v2.Dictionary.join(v23.pausedDebuggerConnectionIds, {
                [v24.debuggerStateToken.debuggerConnectionId] = v2.None
            })
        });
    end, 
    [v11.name] = function(v25, v26) --[[ Line: 92 ]]
        -- upvalues: v3 (copy), v2 (copy), l_deepCopy_0 (copy)
        local l_debuggerConnectionId_0 = v26.debuggerStateToken.debuggerConnectionId;
        local l_isPaused_0 = v25.isPaused;
        local l_currentDebuggerConnectionId_0 = v25.currentDebuggerConnectionId;
        if l_debuggerConnectionId_0 == v25.currentDebuggerConnectionId then
            l_currentDebuggerConnectionId_0 = v3.kInvalidDebuggerConnectionId;
            l_isPaused_0 = false;
        end;
        local v30 = v2.Dictionary.join(v25.pausedDebuggerConnectionIds, {
            [l_debuggerConnectionId_0] = v2.None
        });
        if next(v30) == nil then
            l_isPaused_0 = false;
        end;
        local v31 = l_deepCopy_0(v25.hitException);
        if v25.currentFrameMap[l_debuggerConnectionId_0] then
            for v32, _ in pairs(v25.currentFrameMap[l_debuggerConnectionId_0]) do
                v31 = v2.Dictionary.join(v31, {
                    [v32] = v2.None
                });
            end;
        end;
        return v2.Dictionary.join(v25, {
            debuggerConnectionIdToDST = v2.Dictionary.join(v25.debuggerConnectionIdToDST, {
                [l_debuggerConnectionId_0] = v2.None
            }), 
            currentDebuggerConnectionId = l_currentDebuggerConnectionId_0, 
            debuggerConnectionIdToCurrentThreadId = v2.List.removeValue(v25.debuggerConnectionIdToCurrentThreadId, l_debuggerConnectionId_0), 
            currentFrameMap = v2.List.removeValue(v25.currentFrameMap, l_debuggerConnectionId_0), 
            isPaused = l_isPaused_0, 
            hitException = v31, 
            pausedDebuggerConnectionIds = v30
        });
    end, 
    [v9.name] = function(v34, v35) --[[ Line: 131 ]]
        -- upvalues: v2 (copy)
        local l_debuggerConnectionId_1 = v35.debuggerStateToken.debuggerConnectionId;
        return v2.Dictionary.join(v34, {
            debuggerConnectionIdToDST = v2.Dictionary.join(v34.debuggerConnectionIdToDST, {
                [v35.debuggerStateToken.debuggerConnectionId] = v35.debuggerStateToken
            }), 
            isPaused = true, 
            hitException = v2.Dictionary.join(v34.hitException, {
                [v35.threadId] = v35.hitException
            }), 
            pausedDebuggerConnectionIds = v2.Dictionary.join(v34.pausedDebuggerConnectionIds, {
                [l_debuggerConnectionId_1] = l_debuggerConnectionId_1
            }), 
            debuggerConnectionIdToCurrentThreadId = v2.Dictionary.join(v34.debuggerConnectionIdToCurrentThreadId, {
                [l_debuggerConnectionId_1] = nil
            }), 
            currentFrameMap = v2.Dictionary.join(v34.currentFrameMap, {
                [l_debuggerConnectionId_1] = nil
            })
        });
    end, 
    [v10.name] = function(v37, v38) --[[ Line: 152 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v37, {
            currentBreakpointId = v38.breakpointId
        });
    end, 
    [v8.name] = function(v39, v40) --[[ Line: 156 ]]
        -- upvalues: v2 (copy)
        if v40.pause then
            return v2.Dictionary.join(v39, {
                isPaused = v40.pause
            });
        else
            return v2.Dictionary.join(v39, {
                isPaused = v40.pause, 
                debuggerConnectionIdToCurrentThreadId = {}
            });
        end;
    end, 
    [v12.name] = function(v41, v42) --[[ Line: 164 ]]
        -- upvalues: l_deepCopy_0 (copy), v2 (copy)
        local v43 = {
            debuggerConnectionIdToCurrentThreadId = l_deepCopy_0(v41.debuggerConnectionIdToCurrentThreadId)
        };
        if v43.debuggerConnectionIdToCurrentThreadId[v41.currentDebuggerConnectionId] == nil then
            v43.debuggerConnectionIdToCurrentThreadId[v41.currentDebuggerConnectionId] = v42.threadId;
        end;
        v43.currentFrameMap = l_deepCopy_0(v41.currentFrameMap);
        if v43.currentFrameMap[v41.currentDebuggerConnectionId] == nil then
            v43.currentFrameMap[v41.currentDebuggerConnectionId] = {};
        end;
        v43.currentFrameMap[v41.currentDebuggerConnectionId][v42.threadId] = 1;
        return v2.Dictionary.join(v41, v43);
    end, 
    [v13.name] = function(v44, v45) --[[ Line: 181 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v44, {
            currentDebuggerConnectionId = v45.debuggerConnectionId
        });
    end
});