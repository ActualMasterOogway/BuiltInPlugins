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
local l_find_0 = v2.find;
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local _ = require(l_Parent_0.Types);
local _ = require(l_Parent_0.Roact17.types);
local v17 = l_class_0("Roact17Profiler", function(v16) --[[ Line: 26 ]]
    return {
        active = false, 
        devtools = v16.devtools, 
        root = v16.root, 
        rows = {}, 
        instanceEvents = {}, 
        selectedEvents = {}, 
        commitCount = 0, 
        eventCount = 0, 
        worker = v16, 
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
v17._init = function(v18) --[[ Line: 73 ]] --[[ Name: _init ]]
    v18.devtools.bridge:addListener("profilingData", function(v19) --[[ Line: 74 ]]
        -- upvalues: v18 (copy)
        v18:updateRows(v19);
    end);
end;
v17.sortData = function(v20, v21, v22, v23) --[[ Line: 82 ]] --[[ Name: sortData ]]
    v20[v21].sortIndex = v22;
    v20[v21].sortOrder = v23;
end;
v17.getData = function(v24, v25) --[[ Line: 90 ]] --[[ Name: getData ]]
    v24.slices = v25;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 92 ]]
        -- upvalues: v24 (copy)
        v24.devtools.agent:getProfilingData({
            rendererID = v24.devtools.store:getRendererIDForElement(v24.root)
        });
    end);
    if not l_status_0 and not l_result_0:find("getProfilingData%(%) called before any profiling data was recorded") then
        warn(l_result_0);
    end;
end;
v17.updateRows = function(v28, v29) --[[ Line: 107 ]] --[[ Name: updateRows ]]
    -- upvalues: l_find_0 (copy), l_forEach_0 (copy), l_insert_0 (copy), l_concat_0 (copy), l_reverse_0 (copy), l_pretty_0 (copy), l_slice_0 (copy)
    local v31 = l_find_0(v29.dataForRoots, function(v30) --[[ Line: 108 ]]
        -- upvalues: v28 (copy)
        return v30.rootID == v28.root;
    end);
    if not v31 then
        return;
    else
        local v32 = v28.worker:getHostInstance(v28.root);
        local l_commitData_0 = v31.commitData;
        while v28.commitCount < #l_commitData_0 do
            v28.commitCount = v28.commitCount + 1;
            local v34 = l_commitData_0[v28.commitCount];
            l_forEach_0(v34.changeDescriptions, function(v35) --[[ Line: 119 ]]
                -- upvalues: v28 (copy), v32 (copy), l_insert_0 (ref), l_concat_0 (ref), l_reverse_0 (ref), l_pretty_0 (ref), v34 (copy)
                local v36 = v35[1];
                local v37 = v28.devtools.store:getElementByID(v36);
                local v38 = v35[2];
                local v39 = v28.worker:getHostNode(v36);
                local v40 = if v39 then v28.worker:getHostInstance(v39.id) else nil;
                local v41 = if v40 then v28.worker:getPath(v40) else nil;
                local v42 = nil;
                if v41 then
                    local v43 = {};
                    while v40 ~= nil and v40 ~= v32 do
                        l_insert_0(v43, v40.Name);
                        v40 = v40.Parent;
                    end;
                    l_insert_0(v43, v32.Name);
                    v42 = l_concat_0(l_reverse_0(v43), ".");
                else
                    v42 = "Unknown";
                end;
                local v44 = if v37 then v37.displayName else "Unknown";
                if v37 and #v37.key > 0 and v37.key ~= v37.displayName then
                    v44 = ("%s: %s"):format(v37.key, v44);
                end;
                local v45 = v28.rows[v36] or {
                    instanceId = v36, 
                    count = 0, 
                    depth = if v41 then #v41 else 0, 
                    path = v41 or {}, 
                    pathString = v42, 
                    instanceName = v44, 
                    time = 0, 
                    renderTime = 0
                };
                v28.rows[v36] = v45;
                local l_v28_0 = v28;
                l_v28_0.eventCount = l_v28_0.eventCount + 1;
                v45.count = v45.count + 1;
                if not v28.instanceEvents[v36] then
                    v28.instanceEvents[v36] = {};
                end;
                l_v28_0 = {};
                if v38.isFirstMount then
                    l_insert_0(l_v28_0, "mount");
                else
                    if v38.props then
                        l_insert_0(l_v28_0, "props");
                    end;
                    if v38.state then
                        l_insert_0(l_v28_0, "state");
                    end;
                end;
                local v47 = (if v38.props then l_pretty_0(v38.props) else "") .. " " .. if v38.state then l_pretty_0(v38.state) else "";
                local v48 = {
                    startTime = v34.timestamp, 
                    renderTime = 0, 
                    time = 0, 
                    cause = l_concat_0(l_v28_0, ", "), 
                    updateTrace = "", 
                    log = "", 
                    details = v47, 
                    detailsTip = v47
                };
                v28.currentEvents[v36] = v48;
                l_insert_0(v28.instanceEvents[v36], v48);
            end);
            l_forEach_0(v34.fiberActualDurations, function(v49) --[[ Line: 185 ]]
                -- upvalues: v28 (copy)
                local v50 = v49[1];
                local v51 = v28.currentEvents[v50];
                if not v51 then
                    return;
                else
                    v51.time = v51.time + v49[2];
                    local v52 = v28.rows[v50];
                    v52.time = v52.time + v49[2];
                    return;
                end;
            end);
            l_forEach_0(v34.fiberSelfDurations, function(v53) --[[ Line: 194 ]]
                -- upvalues: v28 (copy)
                local v54 = v53[1];
                local v55 = v28.currentEvents[v54];
                if not v55 then
                    return;
                else
                    v55.renderTime = v55.renderTime + v53[2];
                    local v56 = v28.rows[v54];
                    v56.renderTime = v56.renderTime + v53[2];
                    return;
                end;
            end);
            for v57 in pairs(v28.currentEvents) do
                v28.currentEvents[v57] = nil;
            end;
        end;
        local v58 = v28:getComponentRows();
        local v59 = v28:getEventRows();
        local v60 = l_slice_0(v59, v28.slices.eventSliceStart, v28.slices.eventSliceEnd);
        v28.worker:showProfileData({
            componentRows = l_slice_0(v58, v28.slices.componentSliceStart, v28.slices.componentSliceEnd), 
            eventRows = v60, 
            rowCount = #v58, 
            eventCount = v28.eventCount, 
            instanceEventCount = #v28.selectedEvents
        });
        return;
    end;
end;
v17.selectInstance = function(v61, v62) --[[ Line: 224 ]] --[[ Name: selectInstance ]]
    v61.instanceEvents[v62] = v61.instanceEvents[v62] or {};
    v61.selectedEvents = v61.instanceEvents[v62];
end;
v17.getComponentRows = function(v63) --[[ Line: 233 ]] --[[ Name: getComponentRows ]]
    -- upvalues: l_insert_0 (copy), l_filter_0 (copy), l_some_0 (copy)
    local v64 = {};
    for _, v66 in pairs(v63.rows) do
        l_insert_0(v64, v66);
    end;
    if v63.filter or v63.searchTerm then
        v64 = l_filter_0(v64, function(v67) --[[ Line: 239 ]]
            -- upvalues: v63 (copy), l_some_0 (ref)
            if v63.searchTerm and not v67.instanceName:lower():find(v63.searchTerm) then
                return false;
            else
                return not l_some_0(v63.filter, function(v68) --[[ Line: 243 ]]
                    -- upvalues: v67 (copy)
                    return v67.instanceName:find(v68);
                end);
            end;
        end);
    end;
    return v63:getSortedData(v64, v63.profileComponents);
end;
v17.getEventRows = function(v69) --[[ Line: 251 ]] --[[ Name: getEventRows ]]
    return v69:getSortedData(v69.selectedEvents, v69.profileEvents);
end;
v17.getSortedData = function(v70, v71, v72) --[[ Line: 259 ]] --[[ Name: getSortedData ]]
    -- upvalues: l_sort_0 (copy)
    if v72.sortIndex then
        l_sort_0(v71, function(v73, v74) --[[ Line: 261 ]]
            -- upvalues: v72 (copy), v70 (copy)
            local v75 = v72.columns[v72.sortIndex];
            if v70.profileComponents.sortOrder == Enum.SortDirection.Descending then
                return v73[v75] < v74[v75];
            else
                return v73[v75] > v74[v75];
            end;
        end);
    end;
    return v71;
end;
v17.setSearchTerm = function(v76, v77) --[[ Line: 273 ]] --[[ Name: setSearchTerm ]]
    v76.searchTerm = v77:lower();
end;
v17.clearData = function(v78) --[[ Line: 281 ]] --[[ Name: clearData ]]
    v78.events = {};
    v78.eventCount = 0;
    v78.commitCount = 0;
    v78.rows = {};
    v78.instanceEvents = {};
    v78.selectedEvents = {};
end;
v17.setActive = function(v79, v80) --[[ Line: 293 ]] --[[ Name: setActive ]]
    if v79.active == v80 then
        return;
    else
        v79.active = v80;
        if v80 then
            v79.devtools.agent:startProfiling(true);
            return;
        else
            v79.devtools.agent:stopProfiling(true);
            return;
        end;
    end;
end;
v17.destroy = function(v81) --[[ Line: 308 ]] --[[ Name: destroy ]]
    v81:setActive(false);
    v81:clearData();
end;
return v17;