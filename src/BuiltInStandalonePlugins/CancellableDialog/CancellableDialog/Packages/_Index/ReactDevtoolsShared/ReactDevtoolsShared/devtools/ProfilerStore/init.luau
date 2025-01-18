local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Map_0 = v1.Map;
local l_Set_0 = v1.Set;
local l_console_0 = v1.console;
local v6 = require(script.Parent.Parent.events);
local l_prepareProfilingDataFrontendFromBackendAndStore_0 = require(script.Parent.views.Profiler.utils).prepareProfilingDataFrontendFromBackendAndStore;
local _ = require(script.Parent.types);
local _ = require(script.Parent.Parent.bridge);
local _ = require(script.Parent.Parent.backend.types);
local _ = require(script.Parent.views.Profiler.types);
local v12 = require(script.Parent.ProfilingCache);
local v13 = setmetatable({}, {
    __index = v6
});
v13.__index = v13;
v13.new = function(v14, v15, v16) --[[ Line: 62 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v13 (copy), l_Set_0 (copy), l_Map_0 (copy), l_Array_0 (copy), l_prepareProfilingDataFrontendFromBackendAndStore_0 (copy), v12 (copy)
    local v17 = setmetatable(v6.new(), v13);
    v17._dataBackends = {};
    v17._dataFrontend = nil;
    v17._initialRendererIDs = l_Set_0.new();
    v17._initialSnapshotsByRootID = l_Map_0.new();
    v17._inProgressOperationsByRootID = l_Map_0.new();
    v17._isProfiling = v16;
    v17._rendererIDsThatReportedProfilingData = l_Set_0.new();
    v17._rendererQueue = l_Set_0.new();
    v17._bridge = v14;
    v17._store = v15;
    v17._takeProfilingSnapshotRecursive = function(v18, v19, v20) --[[ Line: 80 ]] --[[ Name: _takeProfilingSnapshotRecursive ]]
        -- upvalues: l_Array_0 (ref)
        local v21 = v18._store:getElementByID(v19);
        if v21 ~= nil then
            v20:set(v19, {
                id = v19, 
                children = l_Array_0.slice(v21.children, 0), 
                displayName = v21.displayName, 
                hocDisplayNames = v21.hocDisplayNames, 
                key = v21.key, 
                type = v21.type
            });
            l_Array_0.forEach(v21.children, function(v22) --[[ Line: 95 ]]
                -- upvalues: v18 (copy), v20 (copy)
                return v18:_takeProfilingSnapshotRecursive(v22, v20);
            end);
        end;
    end;
    v17.onBridgeOperations = function(v23, v24) --[[ Line: 100 ]] --[[ Name: onBridgeOperations ]]
        -- upvalues: l_Map_0 (ref)
        local v25 = v24[1];
        local v26 = v24[2];
        if v23._isProfiling then
            local v27 = v23._inProgressOperationsByRootID:get(v26);
            if v27 == nil then
                v23._inProgressOperationsByRootID:set(v26, {
                    v24
                });
            else
                table.insert(v27, v24);
            end;
            if not v23._initialRendererIDs:has(v25) then
                v23._initialRendererIDs:add(v25);
            end;
            if not v23._initialSnapshotsByRootID:has(v26) then
                v23._initialSnapshotsByRootID:set(v26, l_Map_0.new());
            end;
            v23._rendererIDsThatReportedProfilingData:add(v25);
        end;
    end;
    v17.onBridgeProfilingData = function(v28, v29) --[[ Line: 131 ]] --[[ Name: onBridgeProfilingData ]]
        -- upvalues: l_prepareProfilingDataFrontendFromBackendAndStore_0 (ref), l_Array_0 (ref)
        if v28._isProfiling then
            return;
        else
            local l_rendererID_0 = v29.rendererID;
            if not v28._rendererQueue:has(l_rendererID_0) then
                error(string.format("Unexpected profiling data update from renderer \"%s\"", (tostring(l_rendererID_0))));
            end;
            table.insert(v28._dataBackends, v29);
            v28._rendererQueue:delete(l_rendererID_0);
            if v28._rendererQueue.size == 0 then
                v28._dataFrontend = l_prepareProfilingDataFrontendFromBackendAndStore_0(v28._dataBackends, v28._inProgressOperationsByRootID, v28._initialSnapshotsByRootID);
                l_Array_0.splice(v28._dataBackends, 0);
                v28:emit("isProcessingData");
            end;
            return;
        end;
    end;
    v17.onBridgeShutdown = function(v31) --[[ Line: 157 ]] --[[ Name: onBridgeShutdown ]]
        v31._bridge:removeListener("operations", v31.onBridgeOperations);
        v31._bridge:removeListener("profilingData", v31.onBridgeProfilingData);
        v31._bridge:removeListener("profilingStatus", v31.onProfilingStatus);
        v31._bridge:removeListener("shutdown", v31.onBridgeShutdown);
    end;
    v17.onProfilingStatus = function(v32, v33) --[[ Line: 163 ]] --[[ Name: onProfilingStatus ]]
        -- upvalues: l_Array_0 (ref), l_Map_0 (ref)
        if v33 then
            l_Array_0.splice(v32._dataBackends, 0);
            v32._dataFrontend = nil;
            v32._initialRendererIDs:clear();
            v32._initialSnapshotsByRootID:clear();
            v32._inProgressOperationsByRootID:clear();
            v32._rendererIDsThatReportedProfilingData:clear();
            v32._rendererQueue:clear();
            for _, v35 in v32._store:getRootIDToRendererID() do
                if not v32._initialRendererIDs:has(v35) then
                    v32._initialRendererIDs:add(v35);
                end;
            end;
            for _, v37 in v32._store:getRoots() do
                local v38 = l_Map_0.new();
                v32._initialSnapshotsByRootID:set(v37, v38);
                v32:_takeProfilingSnapshotRecursive(v37, v38);
            end;
        end;
        if v32._isProfiling ~= v33 then
            v32._isProfiling = v33;
            v32._cache:invalidate();
            v32:emit("isProfiling");
            if not v33 then
                l_Array_0.splice(v32._dataBackends, 0);
                v32._rendererQueue:clear();
                for _, v40 in v32._rendererIDsThatReportedProfilingData do
                    if not v32._rendererQueue:has(v40) then
                        v32._rendererQueue:add(v40);
                        v32._bridge:send("getProfilingData", {
                            rendererID = v40
                        });
                    end;
                end;
                v32:emit("isProcessingData");
            end;
        end;
    end;
    v14:addListener("operations", function(...) --[[ Line: 213 ]]
        -- upvalues: v17 (copy)
        return v17:onBridgeOperations(...);
    end);
    v14:addListener("profilingData", function(...) --[[ Line: 216 ]]
        -- upvalues: v17 (copy)
        return v17:onBridgeProfilingData(...);
    end);
    v14:addListener("profilingStatus", function(...) --[[ Line: 219 ]]
        -- upvalues: v17 (copy)
        return v17:onProfilingStatus(...);
    end);
    v14:addListener("shutdown", function(...) --[[ Line: 222 ]]
        -- upvalues: v17 (copy)
        return v17:onBridgeShutdown(...);
    end);
    v14:send("getProfilingStatus");
    v17._cache = v12.new(v17);
    return v17;
end;
v13.getCommitData = function(v41, v42, v43) --[[ Line: 233 ]] --[[ Name: getCommitData ]]
    if v41._dataFrontend ~= nil then
        local v44 = v41._dataFrontend.dataForRoots:get(v42);
        if v44 ~= nil then
            local v45 = v44.commitData[v43];
            if v45 ~= nil then
                return v45;
            end;
        end;
    end;
    error(string.format("Could not find commit data for root \"%s\" and commit %s", tostring(v42), (tostring(v43))));
end;
v13.getDataForRoot = function(v46, v47) --[[ Line: 254 ]] --[[ Name: getDataForRoot ]]
    if v46._dataFrontend ~= nil then
        local v48 = v46._dataFrontend.dataForRoots:get(v47);
        if v48 ~= nil then
            return v48;
        end;
    end;
    error(string.format("Could not find commit data for root \"%s\"", (tostring(v47))));
end;
v13.didRecordCommits = function(v49) --[[ Line: 263 ]] --[[ Name: didRecordCommits ]]
    local v50 = false;
    if v49._dataFrontend ~= nil then
        v50 = v49._dataFrontend.dataForRoots.size > 0;
    end;
    return v50;
end;
v13.isProcessingData = function(v51) --[[ Line: 266 ]] --[[ Name: isProcessingData ]]
    local v52 = true;
    if v51._rendererQueue.size <= 0 then
        v52 = #v51._dataBackends > 0;
    end;
    return v52;
end;
v13.isProfiling = function(v53) --[[ Line: 269 ]] --[[ Name: isProfiling ]]
    return v53._isProfiling;
end;
v13.profilingCache = function(v54) --[[ Line: 272 ]] --[[ Name: profilingCache ]]
    return v54._cache;
end;
v13.profilingData = function(v55, v56) --[[ Line: 275 ]] --[[ Name: profilingData ]]
    -- upvalues: l_console_0 (copy), l_Array_0 (copy)
    if v56 == nil then
        return v55._dataFrontend;
    elseif v55._isProfiling then
        l_console_0.warn("Profiling data cannot be updated while profiling is in progress.");
        return;
    else
        l_Array_0.splice(v55._dataBackends, 0);
        v55._dataFrontend = v56;
        v55._initialRendererIDs:clear();
        v55._initialSnapshotsByRootID:clear();
        v55._inProgressOperationsByRootID:clear();
        v55._cache:invalidate();
        v55:emit("profilingData");
        return;
    end;
end;
v13.clear = function(v57) --[[ Line: 295 ]] --[[ Name: clear ]]
    -- upvalues: l_Array_0 (copy)
    l_Array_0.splice(v57._dataBackends, 0);
    v57._dataFrontend = nil;
    v57._initialRendererIDs:clear();
    v57._initialSnapshotsByRootID:clear();
    v57._inProgressOperationsByRootID:clear();
    v57._rendererQueue:clear();
    v57._cache:invalidate();
    v57:emit("profilingData");
end;
v13.startProfiling = function(v58) --[[ Line: 306 ]] --[[ Name: startProfiling ]]
    v58._bridge:send("startProfiling", v58._store:getRecordChangeDescriptions());
end;
v13.stopProfiling = function(v59) --[[ Line: 312 ]] --[[ Name: stopProfiling ]]
    v59._bridge:send("stopProfiling");
end;
return v13;