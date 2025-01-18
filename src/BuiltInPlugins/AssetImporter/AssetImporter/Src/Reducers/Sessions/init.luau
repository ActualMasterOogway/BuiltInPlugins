local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.AddQueueItem);
local v5 = require(l_Actions_0.ClearQueue);
local v6 = require(l_Actions_0.RemoveQueueItem);
local v7 = require(l_Actions_0.ResetQueue);
local v8 = require(l_Actions_0.DEPRECATED_SetActiveSessionCount);
local v9 = require(l_Actions_0.SetParsing);
local v10 = require(l_Actions_0.SetProgress);
local v11 = require(l_Actions_0.SetProgressGoal);
local v12 = require(l_Actions_0.SetSearchTerm);
local v13 = require(l_Actions_0.DEPRECATED_SetSessionCount);
local v14 = require(l_Actions_0.DEPRECATED_SetSessionQueue);
local v15 = require(l_Actions_0.UpdateQueueItem);
local _ = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v17 = require(l_script_FirstAncestor_0.Src.Utility.shouldImportItem);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixFileMiscount);
local v19 = {
    activeSessionCount = 0, 
    parsing = false, 
    progress = 0, 
    progressGoal = 0, 
    searchTerm = "", 
    sessionCount = 0, 
    sessionQueue = {}
};
return v1.createReducer(v19, {
    [v7.name] = function() --[[ Line: 50 ]]
        -- upvalues: v19 (copy)
        return table.clone(v19);
    end, 
    [v4.name] = v18() and function(v20, v21) --[[ Line: 56 ]]
        -- upvalues: l_join_0 (copy), v17 (copy)
        assert(v20.sessionQueue[v21.queueItem.filepath] == nil, "Session must not exist to be added");
        return l_join_0(v20, {
            activeSessionCount = if v17(v21.queueItem) then v20.activeSessionCount + 1 else v20.activeSessionCount, 
            sessionCount = v20.sessionCount + 1, 
            sessionQueue = l_join_0(v20.sessionQueue, {
                [v21.queueItem.filepath] = v21.queueItem
            })
        });
    end or nil, 
    [v15.name] = function(v22, v23) --[[ Line: 70 ]]
        -- upvalues: v18 (copy), v17 (copy), l_join_0 (copy)
        if v18() then
            local v24 = v22.sessionQueue[v23.queueItem.filepath];
            assert(v24, "Session must exist to be updated");
            local v25 = v17(v24);
            local v26 = v17(v23.queueItem);
            local l_activeSessionCount_0 = v22.activeSessionCount;
            if v25 and not v26 then
                l_activeSessionCount_0 = l_activeSessionCount_0 - 1;
            elseif not v25 and v26 then
                l_activeSessionCount_0 = l_activeSessionCount_0 + 1;
            end;
            return l_join_0(v22, {
                activeSessionCount = l_activeSessionCount_0, 
                sessionQueue = l_join_0(v22.sessionQueue, {
                    [v23.queueItem.filepath] = v23.queueItem
                })
            });
        else
            return l_join_0(v22, {
                sessionQueue = l_join_0(v22.sessionQueue, {
                    [v23.queueItem.filepath] = v23.queueItem
                })
            });
        end;
    end, 
    [v6.name] = v18() and function(v28, v29) --[[ Line: 100 ]]
        -- upvalues: v17 (copy)
        assert(v28.sessionQueue[v29.filepath], "Session must exist to be removed");
        local v30 = table.clone(v28.sessionQueue);
        local v31 = v30[v29.filepath];
        v30[v29.filepath] = nil;
        return {
            activeSessionCount = if v17(v31) then v28.activeSessionCount - 1 else v28.activeSessionCount, 
            sessionCount = v28.sessionCount - 1, 
            sessionQueue = v30
        };
    end or nil, 
    [v5.name] = v18() and function() --[[ Line: 119 ]]
        return {
            activeSessionCount = 0, 
            sessionCount = 0, 
            sessionQueue = {}
        };
    end or nil, 
    [v14.name] = not v18() and function(v32, v33) --[[ Line: 128 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v32, {
            sessionQueue = v33.sessionQueue
        });
    end or nil, 
    [v8.name] = not v18() and function(v34, v35) --[[ Line: 136 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v34, {
            activeSessionCount = v35.activeSessionCount
        });
    end or nil, 
    [v9.name] = function(v36, v37) --[[ Line: 142 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v36, {
            parsing = v37.parsing
        });
    end, 
    [v10.name] = function(v38, v39) --[[ Line: 147 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v38, {
            progress = v39.progress
        });
    end, 
    [v11.name] = function(v40, v41) --[[ Line: 152 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v40, {
            progressGoal = v41.progressGoal
        });
    end, 
    [v13.name] = not v18() and function(v42, v43) --[[ Line: 158 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v42, {
            sessionCount = v43.sessionCount
        });
    end or nil, 
    [v12.name] = function(v44, v45) --[[ Line: 164 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v44, {
            searchTerm = v45.searchTerm
        });
    end
});