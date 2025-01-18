local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Map_0 = v1.Map;
local l_Profiler_0 = script.Parent.views.Profiler;
local v5 = require(l_Profiler_0.CommitTreeBuilder);
local l_getCommitTree_0 = v5.getCommitTree;
local l_invalidateCommitTrees_0 = v5.invalidateCommitTrees;
local v8 = require(l_Profiler_0.FlamegraphChartBuilder);
local l_getChartData_0 = v8.getChartData;
local l_invalidateChartData_0 = v8.invalidateChartData;
local v11 = require(l_Profiler_0.InteractionsChartBuilder);
local l_getChartData_1 = v11.getChartData;
local l_invalidateChartData_1 = v11.invalidateChartData;
local v14 = require(l_Profiler_0.RankedChartBuilder);
local l_getChartData_2 = v14.getChartData;
local l_invalidateChartData_2 = v14.invalidateChartData;
local _ = require(l_Profiler_0.types);
local _ = require(script.Parent.types);
local v19 = {};
v19.__index = v19;
v19.new = function(v20) --[[ Line: 52 ]] --[[ Name: new ]]
    -- upvalues: v19 (copy), l_Map_0 (copy), l_getCommitTree_0 (copy), l_Array_0 (copy), l_getChartData_0 (copy), l_getChartData_1 (copy), l_getChartData_2 (copy)
    local v21 = setmetatable({}, v19);
    v21._fiberCommits = l_Map_0.new();
    v21._profilerStore = v20;
    v21.getCommitTree = function(v22, v23) --[[ Line: 59 ]] --[[ Name: getCommitTree ]]
        -- upvalues: l_getCommitTree_0 (ref)
        local l_commitIndex_0 = v23.commitIndex;
        local l_rootID_0 = v23.rootID;
        return l_getCommitTree_0({
            commitIndex = l_commitIndex_0, 
            profilerStore = v22._profilerStore, 
            rootID = l_rootID_0
        });
    end;
    v21.getFiberCommits = function(v26, v27) --[[ Line: 67 ]] --[[ Name: getFiberCommits ]]
        -- upvalues: l_Array_0 (ref)
        local l_fiberID_0 = v27.fiberID;
        local l_rootID_1 = v27.rootID;
        local v30 = v26._fiberCommits:get(l_fiberID_0);
        if v30 ~= nil then
            return v30;
        else
            local v31 = {};
            local v32 = v26._profilerStore:getDataForRoot(l_rootID_1);
            l_Array_0.forEach(v32.commitData, function(v33, v34) --[[ Line: 77 ]]
                -- upvalues: l_fiberID_0 (copy), v31 (copy)
                if v33.fiberActualDurations:has(l_fiberID_0) then
                    table.insert(v31, v34);
                end;
            end);
            v26._fiberCommits:set(l_fiberID_0, v31);
            return v31;
        end;
    end;
    v21.getFlamegraphChartData = function(v35, v36) --[[ Line: 85 ]] --[[ Name: getFlamegraphChartData ]]
        -- upvalues: l_getChartData_0 (ref)
        local l_commitIndex_1 = v36.commitIndex;
        local l_commitTree_0 = v36.commitTree;
        local l_rootID_2 = v36.rootID;
        return l_getChartData_0({
            commitIndex = l_commitIndex_1, 
            commitTree = l_commitTree_0, 
            profilerStore = v35._profilerStore, 
            rootID = l_rootID_2
        });
    end;
    v21.getInteractionsChartData = function(v40, v41) --[[ Line: 99 ]] --[[ Name: getInteractionsChartData ]]
        -- upvalues: l_getChartData_1 (ref)
        local l_rootID_3 = v41.rootID;
        return l_getChartData_1({
            profilerStore = v40._profilerStore, 
            rootID = l_rootID_3
        });
    end;
    v21.getRankedChartData = function(v43, v44) --[[ Line: 108 ]] --[[ Name: getRankedChartData ]]
        -- upvalues: l_getChartData_2 (ref)
        local l_commitIndex_2 = v44.commitIndex;
        local l_commitTree_1 = v44.commitTree;
        local l_rootID_4 = v44.rootID;
        return l_getChartData_2({
            commitIndex = l_commitIndex_2, 
            commitTree = l_commitTree_1, 
            profilerStore = v43._profilerStore, 
            rootID = l_rootID_4
        });
    end;
    return v21;
end;
v19.invalidate = function(v48) --[[ Line: 125 ]] --[[ Name: invalidate ]]
    -- upvalues: l_invalidateCommitTrees_0 (copy), l_invalidateChartData_0 (copy), l_invalidateChartData_1 (copy), l_invalidateChartData_2 (copy)
    v48._fiberCommits:clear();
    l_invalidateCommitTrees_0();
    l_invalidateChartData_0();
    l_invalidateChartData_1();
    l_invalidateChartData_2();
end;
return v19;