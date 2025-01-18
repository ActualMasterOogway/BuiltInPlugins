local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local l_Models_0 = l_Parent_0.Src.Models;
local v5 = require(l_Actions_0.BreakpointsWindow.AddBreakpoint);
local v6 = require(l_Actions_0.BreakpointsWindow.DeleteBreakpoint);
local v7 = require(l_Actions_0.BreakpointsWindow.ModifyBreakpoint);
local v8 = require(l_Actions_0.BreakpointsWindow.SetBreakpointSortState);
local v9 = require(l_Actions_0.BreakpointsWindow.BreakpointColumnFilter);
local _ = require(l_Models_0.MetaBreakpoint);
local l_deepCopy_0 = require(l_Parent_0.Packages.Framework).Util.deepCopy;
local v12 = {
    BreakpointIdsInDebuggerConnection = {}, 
    MetaBreakpoints = {}, 
    SortDirection = nil, 
    ColumnIndex = nil, 
    listOfEnabledColumns = {}
};
return v1.createReducer(v12, {
    [v5.name] = function(v13, v14) --[[ Line: 46 ]]
        -- upvalues: v2 (copy)
        if v13.BreakpointIdsInDebuggerConnection and v13.BreakpointIdsInDebuggerConnection[v14.debuggerConnectionId] and v13.BreakpointIdsInDebuggerConnection[v14.debuggerConnectionId][v14.metaBreakpoint.id] then
            assert(false);
        end;
        local v15 = v2.Dictionary.join(v13.BreakpointIdsInDebuggerConnection, {
            [v14.debuggerConnectionId] = v2.Dictionary.join(v13.BreakpointIdsInDebuggerConnection and v13.BreakpointIdsInDebuggerConnection[v14.debuggerConnectionId] or {}, {
                [v14.metaBreakpoint.id] = v14.metaBreakpoint.id
            })
        });
        local v16 = v2.Dictionary.join(v13.MetaBreakpoints, {
            [v14.metaBreakpoint.id] = v14.metaBreakpoint
        });
        return v2.Dictionary.join(v13, {
            BreakpointIdsInDebuggerConnection = v15
        }, {
            MetaBreakpoints = v16
        });
    end, 
    [v7.name] = function(v17, v18) --[[ Line: 74 ]]
        -- upvalues: v2 (copy)
        assert(v17.BreakpointIdsInDebuggerConnection);
        assert(v17.MetaBreakpoints[v18.metaBreakpoint.id]);
        local v19 = v2.Dictionary.join(v17.MetaBreakpoints, {
            [v18.metaBreakpoint.id] = v18.metaBreakpoint
        });
        return v2.Dictionary.join(v17, {
            MetaBreakpoints = v19
        });
    end, 
    [v8.name] = function(v20, v21) --[[ Line: 84 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v20, {
            SortDirection = v21.sortDirection, 
            ColumnIndex = v21.columnIndex
        });
    end, 
    [v6.name] = function(v22, v23) --[[ Line: 88 ]]
        -- upvalues: l_deepCopy_0 (copy), v2 (copy)
        if not v22.MetaBreakpoints or not v22.MetaBreakpoints[v23.metaBreakpointId] then
            assert(false);
        end;
        local v24 = l_deepCopy_0(v22.MetaBreakpoints);
        v24[v23.metaBreakpointId] = nil;
        local v25 = l_deepCopy_0(v22.BreakpointIdsInDebuggerConnection);
        for _, v27 in pairs(v25) do
            v27[v23.metaBreakpointId] = nil;
        end;
        return v2.Dictionary.join(v22, {
            BreakpointIdsInDebuggerConnection = v25
        }, {
            MetaBreakpoints = v24
        });
    end, 
    [v9.name] = function(v28, v29) --[[ Line: 105 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v28, {
            listOfEnabledColumns = v29.listOfEnabledColumns
        });
    end
});