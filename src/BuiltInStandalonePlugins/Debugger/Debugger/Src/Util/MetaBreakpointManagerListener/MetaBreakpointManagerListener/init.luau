local l_Parent_0 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v2 = require(l_Parent_0.Models.MetaBreakpoint);
local v3 = require(l_Actions_0.BreakpointsWindow.AddBreakpoint);
local v4 = require(l_Actions_0.BreakpointsWindow.ModifyBreakpoint);
local v5 = require(l_Actions_0.BreakpointsWindow.DeleteBreakpoint);
local v6 = require(l_Actions_0.Common.SetFilenameForGuid);
local v7 = {};
v7.__index = v7;
v7.onMetaBreakpointAdded = function(v8, v9) --[[ Line: 12 ]] --[[ Name: onMetaBreakpointAdded ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy)
    local v10 = v2.fromMetaBreakpoint(v9);
    local v11 = v8.store:getState();
    v8.store:dispatch(v3(v11.Common.currentDebuggerConnectionId, v10));
    v8.store:dispatch(v6(v9.Script, ""));
    v8:updateScriptWatcher(v9);
end;
v7.updateScriptWatcher = function(v12, v13) --[[ Line: 21 ]] --[[ Name: updateScriptWatcher ]]
    local l_v13_ContextBreakpoints_0 = v13:GetContextBreakpoints();
    for _, v16 in pairs(l_v13_ContextBreakpoints_0) do
        local l_connectionId_0 = v16.connectionId;
        local l_breakpoints_0 = v16.breakpoints;
        for _, v20 in ipairs(l_breakpoints_0) do
            v12._crossDmScriptChangeListenerService:StartWatchingScriptLine(v20.Script, l_connectionId_0, v20.Line);
        end;
    end;
end;
v7.onMetaBreakpointChanged = function(v21, v22) --[[ Line: 36 ]] --[[ Name: onMetaBreakpointChanged ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v23 = v2.fromMetaBreakpoint(v22);
    v21:updateScriptWatcher(v22);
    v21.store:dispatch(v4(v23));
end;
v7.onMetaBreakpointRemoved = function(v24, v25) --[[ Line: 42 ]] --[[ Name: onMetaBreakpointRemoved ]]
    -- upvalues: v5 (copy)
    v24.store:dispatch(v5(v25.Id));
end;
local function v35(v26, v27, v28) --[[ Line: 46 ]] --[[ Name: setUpConnections ]]
    local v29 = v27 or game:GetService("MetaBreakpointManager");
    v26._crossDmScriptChangeListenerService = v28 or game:GetService("CrossDMScriptChangeListener");
    v26._metaBreakpointAddedConnection = v29.MetaBreakpointAdded:Connect(function(v30) --[[ Line: 52 ]]
        -- upvalues: v26 (copy)
        v26:onMetaBreakpointAdded(v30);
    end);
    v26._metaBreakpointChangedConnection = v29.MetaBreakpointChanged:Connect(function(v31) --[[ Line: 57 ]]
        -- upvalues: v26 (copy)
        v26:onMetaBreakpointChanged(v31);
    end);
    v26._metaBreakpointSetChangedConnection = v29.MetaBreakpointSetChanged:Connect(function(v32, _) --[[ Line: 62 ]]
        -- upvalues: v26 (copy)
        v26:onMetaBreakpointChanged(v32);
    end);
    v26._metaBreakpointRemovedConnection = v29.MetaBreakpointRemoved:Connect(function(v34) --[[ Line: 67 ]]
        -- upvalues: v26 (copy)
        v26:onMetaBreakpointRemoved(v34);
    end);
end;
v7.destroy = function(v36) --[[ Line: 73 ]] --[[ Name: destroy ]]
    if v36._metaBreakpointAddedConnection then
        v36._metaBreakpointAddedConnection:Disconnect();
        v36._metaBreakpointAddedConnection = nil;
    end;
    if v36._metaBreakpointRemovedConnection then
        v36._metaBreakpointRemovedConnection:Disconnect();
        v36._metaBreakpointRemovedConnection = nil;
    end;
    if v36._metaBreakpointChangedConnection then
        v36._metaBreakpointChangedConnection:Disconnect();
        v36._metaBreakpointChangedConnection = nil;
    end;
    if v36._metaBreakpointSetChangedConnection then
        v36._metaBreakpointSetChangedConnection:Disconnect();
        v36._metaBreakpointSetChangedConnection = nil;
    end;
end;
v7.new = function(v37, v38, v39) --[[ Line: 95 ]] --[[ Name: new ]]
    -- upvalues: v35 (copy), v7 (copy)
    local v40 = {
        store = v37
    };
    v35(v40, v38, v39);
    setmetatable(v40, v7);
    return v40;
end;
return v7;