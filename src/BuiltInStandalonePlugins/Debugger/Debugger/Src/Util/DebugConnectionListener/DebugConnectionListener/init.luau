local l_Parent_0 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v2 = require(l_Actions_0.Callstack.AddThreadId);
local v3 = require(l_Actions_0.Common.Resumed);
local v4 = require(l_Actions_0.Common.SimPaused);
local v5 = require(l_Actions_0.Callstack.SetCurrentThread);
local v6 = require(l_Actions_0.Common.SetCurrentBreakpointId);
local v7 = require(l_Actions_0.Common.SetFocusedDebuggerConnection);
local v8 = require(l_Actions_0.Common.ClearConnectionData);
local v9 = require(l_Parent_0.Thunks.Watch.LoadAllVariablesForThreadAndFrame);
local v10 = require(l_Parent_0.Thunks.Callstack.PopulateCallstackThreadThunk);
local l_Models_0 = l_Parent_0.Models;
local v12 = require(l_Models_0.DebuggerStateToken);
local v13 = require(l_Parent_0.Util.Constants);
local v14 = {};
v14.__index = v14;
v14.bufferedPauseEvents = {};
v14.onExecutionPaused = function(v15, v16, v17, v18, v19, v20) --[[ Line: 24 ]] --[[ Name: onExecutionPaused ]]
    -- upvalues: v7 (copy), v12 (copy), v13 (copy), v6 (copy), v4 (copy), v9 (copy), v5 (copy), v2 (copy), v10 (copy)
    v15.bufferedPauseEvents[v18] = v17;
    wait(0.1);
    if v15.bufferedPauseEvents[v18] ~= v17 then
        return;
    elseif v15.debuggerConnections[v16.Id] == nil then
        return;
    else
        v15.store:dispatch(v7(v16.Id));
        local l_Common_0 = v15.store:getState().Common;
        local v22 = v12.fromData({
            debuggerConnectionId = v16.Id
        });
        if tostring(v18) == v13.DebuggerPauseReason.Breakpoint and v17.Breakpoint ~= nil then
            v15.store:dispatch(v6(v17.Breakpoint.MetaBreakpointId));
        end;
        local function _() --[[ Line: 57 ]] --[[ Name: isThreadIdValid ]]
            -- upvalues: v22 (copy), v15 (copy)
            return v22 == v15.store:getState().Common.debuggerConnectionIdToDST[v22.debuggerConnectionId];
        end;
        local v24 = tostring(v18) == v13.DebuggerPauseReason.Exception;
        v15.store:dispatch(v4(v22, v17.ThreadId, v24));
        v16:GetThreads(function(v25) --[[ Line: 65 ]]
            -- upvalues: v22 (copy), v15 (copy), v9 (ref), v16 (copy), v19 (copy), v5 (ref), l_Common_0 (copy), v24 (copy), v17 (copy), v2 (ref), v10 (ref), v20 (copy)
            if not (v22 == v15.store:getState().Common.debuggerConnectionIdToDST[v22.debuggerConnectionId]) then
                return;
            else
                local function _(v26) --[[ Line: 70 ]]
                    -- upvalues: v22 (ref), v15 (ref), v9 (ref), v16 (ref), v19 (ref), v5 (ref), l_Common_0 (ref), v24 (ref), v17 (ref)
                    if not (v22 == v15.store:getState().Common.debuggerConnectionIdToDST[v22.debuggerConnectionId]) then
                        return;
                    else
                        (function() --[[ Line: 75 ]]
                            -- upvalues: v15 (ref), v9 (ref), v26 (copy), v16 (ref), v19 (ref), v5 (ref), l_Common_0 (ref), v24 (ref), v17 (ref)
                            v15.store:dispatch(v9(v26.ThreadId, v16, 0, v19));
                            v15.store:dispatch(v5(v26.ThreadId));
                            local l_v26_Frame_0 = v26:GetFrame(0);
                            v19:SetScriptLineMarker(l_v26_Frame_0.Script, l_Common_0.currentDebuggerConnectionId, l_v26_Frame_0.Line, true);
                            v19:OpenScriptAtLine(l_v26_Frame_0.Script, l_Common_0.currentDebuggerConnectionId, l_v26_Frame_0.Line, false);
                            if v24 then
                                v19:OpenExceptionMessagePopup(v17.ExceptionText, l_v26_Frame_0.Line);
                            end;
                        end)();
                        return;
                    end;
                end;
                local l_v25_Arg_0 = v25:GetArg();
                local v30 = if #l_v25_Arg_0 > 0 then l_v25_Arg_0[1] else nil;
                for _, v32 in pairs(l_v25_Arg_0) do
                    v15.store:dispatch(v2(v32.ThreadId, v32.ThreadName, v22));
                    if v32.ThreadId == v17.ThreadId then
                        v30 = v32;
                    end;
                end;
                if #l_v25_Arg_0 > 0 then
                    v15.store:dispatch(v10(v30, v16, v22, v20, function() --[[ Line: 113 ]]
                        -- upvalues: v30 (ref), v22 (ref), v15 (ref), v9 (ref), v16 (ref), v19 (ref), v5 (ref), l_Common_0 (ref), v24 (ref), v17 (ref)
                        local l_v30_0 = v30;
                        if not (v22 == v15.store:getState().Common.debuggerConnectionIdToDST[v22.debuggerConnectionId]) then
                            return;
                        else
                            (function() --[[ Line: 75 ]]
                                -- upvalues: v15 (ref), v9 (ref), l_v30_0 (copy), v16 (ref), v19 (ref), v5 (ref), l_Common_0 (ref), v24 (ref), v17 (ref)
                                v15.store:dispatch(v9(l_v30_0.ThreadId, v16, 0, v19));
                                v15.store:dispatch(v5(l_v30_0.ThreadId));
                                local l_l_v30_0_Frame_0 = l_v30_0:GetFrame(0);
                                v19:SetScriptLineMarker(l_l_v30_0_Frame_0.Script, l_Common_0.currentDebuggerConnectionId, l_l_v30_0_Frame_0.Line, true);
                                v19:OpenScriptAtLine(l_l_v30_0_Frame_0.Script, l_Common_0.currentDebuggerConnectionId, l_l_v30_0_Frame_0.Line, false);
                                if v24 then
                                    v19:OpenExceptionMessagePopup(v17.ExceptionText, l_l_v30_0_Frame_0.Line);
                                end;
                            end)();
                            return;
                        end;
                    end));
                end;
                return;
            end;
        end);
        return;
    end;
end;
v14.onExecutionResumed = function(v35, v36, v37, v38) --[[ Line: 121 ]] --[[ Name: onExecutionResumed ]]
    -- upvalues: v3 (copy)
    local v39 = v35.store:getState().Common.debuggerConnectionIdToDST[v36.Id];
    if v39 then
        v38:RemoveScriptLineMarkers(v36.Id, true);
        v35.store:dispatch(v3(v39, v37.ThreadId));
    end;
end;
v14.connectEvents = function(v40, v41, v42, v43, v44) --[[ Line: 132 ]] --[[ Name: connectEvents ]]
    -- upvalues: v7 (copy)
    v40.store:dispatch(v7(v42.Id));
    local v48 = {
        paused = v42.Paused:Connect(function(v45, v46) --[[ Line: 135 ]]
            -- upvalues: v40 (copy), v42 (copy), v43 (copy), v44 (copy)
            v40:onExecutionPaused(v42, v45, v46, v43, v44);
        end), 
        resumed = v42.Resumed:Connect(function(v47) --[[ Line: 138 ]]
            -- upvalues: v40 (copy), v42 (copy), v43 (copy)
            v40:onExecutionResumed(v42, v47, v43);
        end)
    };
    v40.connectionEventConnections[v41] = v48;
end;
v14.onConnectionStarted = function(v49, v50, v51, v52) --[[ Line: 145 ]] --[[ Name: onConnectionStarted ]]
    assert(v50 and v50.Id ~= 0);
    v49.debuggerConnections[v50.Id] = v50;
    v49:connectEvents(v50.Id, v50, v51, v52);
end;
v14.onConnectionEnded = function(v53, v54, _, v56) --[[ Line: 151 ]] --[[ Name: onConnectionEnded ]]
    -- upvalues: v8 (copy)
    assert(v54 and v54.Id ~= 0);
    if v56 ~= nil then
        v56:RemoveScriptLineMarkers(v54.Id, true);
    end;
    local v57 = v53.store:getState().Common.debuggerConnectionIdToDST[v54.Id];
    if v57 then
        v53.store:dispatch(v8(v57));
    end;
    if v53.connectionEventConnections[v54.Id] then
        for _, v59 in pairs(v53.connectionEventConnections[v54.Id]) do
            v59:Disconnect();
        end;
    end;
    v53.connectionEventConnections[v54.Id] = nil;
    v53.debuggerConnections[v54.Id] = nil;
end;
v14.onFocusChanged = function(v60, v61) --[[ Line: 172 ]] --[[ Name: onFocusChanged ]]
    -- upvalues: v13 (copy), v7 (copy)
    local v62 = if v61 ~= nil then v61.Id else v13.kInvalidDebuggerConnectionId;
    v60.store:dispatch(v7(v62));
end;
local function v74(v63, v64, v65, v66) --[[ Line: 179 ]] --[[ Name: setUpConnections ]]
    local v67 = v64 or game:GetService("DebuggerConnectionManager");
    local v68 = v65 or game:GetService("DebuggerUIService");
    local v69 = v66 or game:GetService("CrossDMScriptChangeListener");
    v63._connectionStartedConnection = v67.ConnectionStarted:Connect(function(v70) --[[ Line: 190 ]]
        -- upvalues: v63 (copy), v68 (copy), v69 (copy)
        v63:onConnectionStarted(v70, v68, v69);
    end);
    v63._connectionEndedConnection = v67.ConnectionEnded:Connect(function(v71, v72) --[[ Line: 195 ]]
        -- upvalues: v63 (copy), v68 (copy)
        v63:onConnectionEnded(v71, v72, v68);
    end);
    v63._focusChangedConnection = v67.FocusChanged:Connect(function(v73) --[[ Line: 200 ]]
        -- upvalues: v63 (copy)
        v63:onFocusChanged(v73);
    end);
end;
v14.new = function(v75, v76, v77, v78) --[[ Line: 206 ]] --[[ Name: new ]]
    -- upvalues: v74 (copy), v14 (copy)
    local v79 = {
        store = v75, 
        debuggerConnections = {}, 
        connectionEventConnections = {}
    };
    v74(v79, v76, v77, v78);
    setmetatable(v79, v14);
    local v80 = (v76 or game:GetService("DebuggerConnectionManager")):getAvailableConnection();
    if v80 then
        v79:onConnectionStarted(v80, v77 or game:GetService("DebuggerUIService"), v78 or game:GetService("CrossDMScriptChangeListener"));
    end;
    return v79;
end;
v14.destroy = function(v81) --[[ Line: 224 ]] --[[ Name: destroy ]]
    -- upvalues: v7 (copy), v13 (copy)
    v81.store:dispatch(v7(v13.kInvalidDebuggerConnectionId));
    if v81._connectionStartedConnection then
        v81._connectionStartedConnection:Disconnect();
        v81._connectionStartedConnection = nil;
    end;
    if v81._connectionEndedConnection then
        v81._connectionEndedConnection:Disconnect();
        v81._connectionEndedConnection = nil;
    end;
    if v81._focusChangedConnection then
        v81._focusChangedConnection:Disconnect();
        v81._focusChangedConnection = nil;
    end;
    for _, v83 in pairs(v81.debuggerConnections) do
        v81:onConnectionEnded(v83, 0);
    end;
end;
return v14;