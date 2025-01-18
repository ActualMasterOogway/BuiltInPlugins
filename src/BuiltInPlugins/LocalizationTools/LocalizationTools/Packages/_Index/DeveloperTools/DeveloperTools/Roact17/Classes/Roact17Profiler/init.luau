local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local l_class_0 = v2.class;
local l_slice_0 = v2.slice;
local l_filter_0 = v2.filter;
local l_forEach_0 = v2.forEach;
local l_pretty_0 = v2.pretty;
local l_reverse_0 = v2.reverse;
local l_some_0 = v2.some;
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local _ = require(l_Parent_0.Types);
local _ = require(l_Parent_0.Roact17.types);
local v16 = l_class_0("Roact17Profiler", function(v15) --[[ Line: 25 ]]
    return {
        active = false, 
        devtools = v15.devtools, 
        root = v15.root, 
        rows = {}, 
        instanceEvents = {}, 
        selectedEvents = {}, 
        commitCount = 0, 
        eventCount = 0, 
        worker = v15, 
        currentEvents = {}, 
        filter = {}, 
        searchTerm = nil, 
        profileComponents = {
            sortIndex = nil, 
            sortOrder = nil, 
            columns = {
                "instanceName", 
                "depth", 
                "count", 
                "renderTime", 
                "time"
            }
        }, 
        profileEvents = {
            sortIndex = nil, 
            sortOrder = nil, 
            columns = {
                "startTime", 
                "renderTime", 
                "time", 
                "cause", 
                "details"
            }
        }, 
        slices = {
            componentSliceStart = -1, 
            componentSliceEnd = -1, 
            eventSliceStart = -1, 
            eventSliceEnd = -1
        }
    };
end);
v16._init = function(v17) --[[ Line: 72 ]] --[[ Name: _init ]]
    v17.devtools.bridge:addListener("profilingData", function(v18) --[[ Line: 73 ]]
        -- upvalues: v17 (copy)
        v17:updateRows(v18);
    end);
end;
v16.sortData = function(v19, v20, v21, v22) --[[ Line: 81 ]] --[[ Name: sortData ]]
    v19[v20].sortIndex = v21;
    v19[v20].sortOrder = v22;
end;
v16.getData = function(v23, v24) --[[ Line: 89 ]] --[[ Name: getData ]]
    v23.slices = v24;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 91 ]]
        -- upvalues: v23 (copy)
        v23.devtools.agent:getProfilingData({
            rendererID = v23.devtools.store:getRendererIDForElement(v23.root)
        });
    end);
    if not l_status_0 and not l_result_0:find("getProfilingData%(%) called before any profiling data was recorded") then
        warn(l_result_0);
    end;
end;
v16.updateRows = function(v27, v28) --[[ Line: 106 ]] --[[ Name: updateRows ]]
    -- upvalues: l_forEach_0 (copy), l_insert_0 (copy), l_concat_0 (copy), l_reverse_0 (copy), l_pretty_0 (copy), l_slice_0 (copy)
    local v29 = v28.dataForRoots[v27.root];
    if not v29 then
        return;
    else
        local v30 = v27.worker:getHostInstance(v27.root);
        local l_commitData_0 = v29.commitData;
        while v27.commitCount < #l_commitData_0 do
            v27.commitCount = v27.commitCount + 1;
            local v32 = l_commitData_0[v27.commitCount];
            l_forEach_0(v32.changeDescriptions, function(v33) --[[ Line: 116 ]]
                -- upvalues: v27 (copy), v30 (copy), l_insert_0 (ref), l_concat_0 (ref), l_reverse_0 (ref), l_pretty_0 (ref), v32 (copy)
                local v34 = v33[1];
                local v35 = v27.devtools.store:getElementByID(v34);
                local v36 = v33[2];
                local v37 = v27.worker:getHostNode(v34);
                local v38 = v37 and v27.worker:getHostInstance(v37.id) or nil;
                local v39 = v38 and v27.worker:getPath(v38) or nil;
                local v40 = nil;
                if v39 then
                    local v41 = {};
                    while v38 ~= v30 do
                        l_insert_0(v41, v38.Name);
                        v38 = v38.Parent;
                    end;
                    l_insert_0(v41, v30.Name);
                    v40 = l_concat_0(l_reverse_0(v41), ".");
                else
                    v40 = "Unknown";
                end;
                local v42 = v35 and v35.displayName or "Unknown";
                if v35 and #v35.key > 0 and v35.key ~= v35.displayName then
                    v42 = ("%s: %s"):format(v35.key, v42);
                end;
                local v43 = v27.rows[v34] or {
                    instanceId = v34, 
                    count = 0, 
                    depth = v39 and #v39 or 0, 
                    path = v39 or {}, 
                    pathString = v40, 
                    instanceName = v42, 
                    time = 0, 
                    renderTime = 0
                };
                v27.rows[v34] = v43;
                local l_v27_0 = v27;
                l_v27_0.eventCount = l_v27_0.eventCount + 1;
                v43.count = v43.count + 1;
                if not v27.instanceEvents[v34] then
                    v27.instanceEvents[v34] = {};
                end;
                l_v27_0 = {};
                if v36.isFirstMount then
                    l_insert_0(l_v27_0, "mount");
                else
                    if v36.props then
                        l_insert_0(l_v27_0, "props");
                    end;
                    if v36.state then
                        l_insert_0(l_v27_0, "state");
                    end;
                end;
                local v45 = (v36.props and l_pretty_0(v36.props) or "") .. " " .. (v36.state and l_pretty_0(v36.state) or "");
                local v46 = {
                    startTime = v32.timestamp, 
                    renderTime = 0, 
                    time = 0, 
                    cause = l_concat_0(l_v27_0, ", "), 
                    updateTrace = "", 
                    log = "", 
                    details = v45, 
                    detailsTip = v45
                };
                v27.currentEvents[v34] = v46;
                l_insert_0(v27.instanceEvents[v34], v46);
            end);
            l_forEach_0(v32.fiberActualDurations, function(v47) --[[ Line: 182 ]]
                -- upvalues: v27 (copy)
                local v48 = v47[1];
                local v49 = v27.currentEvents[v48];
                if not v49 then
                    return;
                else
                    v49.time = v49.time + v47[2];
                    local v50 = v27.rows[v48];
                    v50.time = v50.time + v47[2];
                    return;
                end;
            end);
            l_forEach_0(v32.fiberSelfDurations, function(v51) --[[ Line: 191 ]]
                -- upvalues: v27 (copy)
                local v52 = v51[1];
                local v53 = v27.currentEvents[v52];
                if not v53 then
                    return;
                else
                    v53.renderTime = v53.renderTime + v51[2];
                    local v54 = v27.rows[v52];
                    v54.renderTime = v54.renderTime + v51[2];
                    return;
                end;
            end);
            for v55 in pairs(v27.currentEvents) do
                v27.currentEvents[v55] = nil;
            end;
        end;
        local v56 = v27:getComponentRows();
        local v57 = v27:getEventRows();
        local v58 = l_slice_0(v57, v27.slices.eventSliceStart, v27.slices.eventSliceEnd);
        v27.worker:showProfileData({
            componentRows = l_slice_0(v56, v27.slices.componentSliceStart, v27.slices.componentSliceEnd), 
            eventRows = v58, 
            rowCount = #v56, 
            eventCount = v27.eventCount, 
            instanceEventCount = #v27.selectedEvents
        });
        return;
    end;
end;
v16.selectInstance = function(v59, v60) --[[ Line: 221 ]] --[[ Name: selectInstance ]]
    v59.instanceEvents[v60] = v59.instanceEvents[v60] or {};
    v59.selectedEvents = v59.instanceEvents[v60];
end;
v16.getComponentRows = function(v61) --[[ Line: 230 ]] --[[ Name: getComponentRows ]]
    -- upvalues: l_insert_0 (copy), l_filter_0 (copy), l_some_0 (copy)
    local v62 = {};
    for _, v64 in pairs(v61.rows) do
        l_insert_0(v62, v64);
    end;
    if v61.filter or v61.searchTerm then
        v62 = l_filter_0(v62, function(v65) --[[ Line: 236 ]]
            -- upvalues: v61 (copy), l_some_0 (ref)
            if v61.searchTerm and not v65.instanceName:lower():find(v61.searchTerm) then
                return false;
            else
                return not l_some_0(v61.filter, function(v66) --[[ Line: 240 ]]
                    -- upvalues: v65 (copy)
                    return v65.instanceName:find(v66);
                end);
            end;
        end);
    end;
    return v61:getSortedData(v62, v61.profileComponents);
end;
v16.getEventRows = function(v67) --[[ Line: 248 ]] --[[ Name: getEventRows ]]
    return v67:getSortedData(v67.selectedEvents, v67.profileEvents);
end;
v16.getSortedData = function(v68, v69, v70) --[[ Line: 256 ]] --[[ Name: getSortedData ]]
    -- upvalues: l_sort_0 (copy)
    if v70.sortIndex then
        l_sort_0(v69, function(v71, v72) --[[ Line: 258 ]]
            -- upvalues: v70 (copy), v68 (copy)
            local v73 = v70.columns[v70.sortIndex];
            if v68.profileComponents.sortOrder == Enum.SortDirection.Descending then
                return v71[v73] < v72[v73];
            else
                return v71[v73] > v72[v73];
            end;
        end);
    end;
    return v69;
end;
v16.setSearchTerm = function(v74, v75) --[[ Line: 270 ]] --[[ Name: setSearchTerm ]]
    v74.searchTerm = v75:lower();
end;
v16.clearData = function(v76) --[[ Line: 278 ]] --[[ Name: clearData ]]
    v76.events = {};
    v76.eventCount = 0;
    v76.commitCount = 0;
    v76.rows = {};
    v76.instanceEvents = {};
    v76.selectedEvents = {};
end;
v16.setActive = function(v77, v78) --[[ Line: 290 ]] --[[ Name: setActive ]]
    if v77.active == v78 then
        return;
    else
        v77.active = v78;
        if v78 then
            v77.devtools.agent:startProfiling(true);
            return;
        else
            v77.devtools.agent:stopProfiling(true);
            return;
        end;
    end;
end;
v16.destroy = function(v79) --[[ Line: 305 ]] --[[ Name: destroy ]]
    v79:setActive(false);
    v79:clearData();
end;
return v16;