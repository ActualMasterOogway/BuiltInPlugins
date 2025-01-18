local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local l_class_0 = v2.class;
local l_slice_0 = v2.slice;
local l_filter_0 = v2.filter;
local l_forEach_0 = v2.forEach;
local l_keys_0 = v2.keys;
local l_some_0 = v2.some;
local l_values_0 = v2.values;
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local v13 = require(l_Parent_0.RoactInspector.Utils.getSymbol);
local v14 = require(l_Parent_0.RoactInspector.Utils.sanitizeRoactLog);
local _ = require(l_Parent_0.Types);
local v51 = l_class_0("RoactProfiler", function(v16, v17, v18, v19) --[[ Line: 26 ]]
    -- upvalues: l_insert_0 (copy)
    local v20 = {
        active = false, 
        events = {}, 
        rows = {}, 
        instanceEvents = {}, 
        selectedEvents = {}, 
        indent = 0, 
        eventCount = 0, 
        debugInterface = v16, 
        registeredFnProxies = {}, 
        registeredComponents = {}, 
        instanceIndices = {}, 
        nextInstanceIndex = 1, 
        nextEventId = 1, 
        renderTimes = {}, 
        filter = {}, 
        searchTerm = nil, 
        roact = v19, 
        treeWatcher = v17, 
        tree = v18, 
        startTime = 0, 
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
        }
    };
    v20.resolveUpdateProxy = function(v21, ...) --[[ Line: 84 ]]
        -- upvalues: v20 (copy), l_insert_0 (ref)
        local v22 = debug.traceback();
        local v23 = os.clock();
        local v24 = {
            ...
        };
        local l_v20_0 = v20;
        l_v20_0.indent = l_v20_0.indent + 1;
        l_v20_0 = v21.props;
        local l_state_0 = v21.state;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 91 ]]
            -- upvalues: v21 (copy), v24 (copy)
            return v21:__resolveUpdateHidden(unpack(v24));
        end);
        if l_status_0 and l_result_0 then
            local v29 = v21.shouldUpdate == v20.roact.PureComponent.shouldUpdate;
            local v30 = l_state_0 ~= v21.state;
            local v31 = l_v20_0 ~= v21.props;
            local v32 = v20.renderTimes[v20.indent] or 0;
            local v33 = os.clock();
            l_insert_0(v20.events, {
                instance = v21, 
                depth = v20.indent, 
                renderTime = v32, 
                startTime = v23, 
                endTime = v33, 
                updateTrace = v22, 
                isPure = v29, 
                oldState = v30 and l_state_0 or nil, 
                newState = v30 and v21.state or nil, 
                oldProps = v31 and l_v20_0 or nil, 
                newProps = v31 and v21.props or nil
            });
        end;
        v20.renderTimes[v20.indent] = nil;
        local l_v20_1 = v20;
        l_v20_1.indent = l_v20_1.indent - 1;
        if not l_status_0 then
            warn("Update error during profiling", l_result_0);
        end;
        return l_result_0;
    end;
    v20.mountProxy = function(v35, ...) --[[ Line: 126 ]]
        -- upvalues: v20 (copy), l_insert_0 (ref)
        local v36 = os.clock();
        local v37 = debug.traceback();
        local v38 = {
            ...
        };
        local l_v20_2 = v20;
        l_v20_2.indent = l_v20_2.indent + 1;
        local v40;
        l_v20_2, v40 = pcall(function() --[[ Line: 131 ]]
            -- upvalues: v35 (copy), v38 (copy)
            return v35:__mountHidden(unpack(v38));
        end);
        if l_v20_2 then
            local v41 = v20.renderTimes[v20.indent] or 0;
            local v42 = os.clock();
            l_insert_0(v20.events, {
                depth = v20.indent, 
                instance = v35, 
                renderTime = v41, 
                startTime = v36, 
                endTime = v42, 
                isMount = true, 
                updateTrace = v37
            });
        end;
        v20.renderTimes[v20.indent] = nil;
        local l_v20_3 = v20;
        l_v20_3.indent = l_v20_3.indent - 1;
        if not l_v20_2 then
            warn("Mount error during profiling", v40);
            return false;
        else
            return v40;
        end;
    end;
    v20.renderProxy = function(v44, ...) --[[ Line: 160 ]]
        -- upvalues: v20 (copy)
        local v45 = os.clock();
        local v46 = {
            ...
        };
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 163 ]]
            -- upvalues: v44 (copy), v46 (copy)
            return v44:__renderHidden(unpack(v46));
        end);
        if l_status_1 then
            local v49 = (os.clock() - v45) * 1000;
            local v50 = v20.renderTimes[v20.indent] or 0;
            v20.renderTimes[v20.indent] = v50 + v49;
        end;
        if not l_status_1 then
            warn("Render error during profiling", l_result_1);
            return false;
        else
            return l_result_1;
        end;
    end;
    return v20;
end);
v51.getRootNode = function(v52) --[[ Line: 182 ]] --[[ Name: getRootNode ]]
    -- upvalues: v13 (copy)
    return v13(v52.tree, "InternalData").rootNode;
end;
v51.sortData = function(v53, v54, v55, v56) --[[ Line: 189 ]] --[[ Name: sortData ]]
    v53[v54].sortIndex = v55;
    v53[v54].sortOrder = v56;
end;
v51.getData = function(v57, v58, v59, v60, v61) --[[ Line: 197 ]] --[[ Name: getData ]]
    -- upvalues: l_slice_0 (copy), l_forEach_0 (copy), v14 (copy)
    v57:updateRows();
    local v62 = v57:getComponentRows();
    local v63 = v57:getEventRows();
    local v64 = l_slice_0(v63, v60, v61);
    l_forEach_0(v64, function(v65) --[[ Line: 202 ]]
        -- upvalues: v14 (ref)
        if not v65.log then
            v65.log = v14(v65.updateTrace);
        end;
    end);
    return {
        componentRows = l_slice_0(v62, v58, v59), 
        eventRows = v64, 
        rowCount = #v62, 
        eventCount = v57.eventCount, 
        instanceEventCount = #v57.selectedEvents
    };
end;
v51.updateRows = function(v66) --[[ Line: 223 ]] --[[ Name: updateRows ]]
    -- upvalues: l_forEach_0 (copy), v13 (copy), l_concat_0 (copy), l_insert_0 (copy)
    l_forEach_0(v66.events, function(v67) --[[ Line: 224 ]]
        -- upvalues: v66 (copy), v13 (ref), l_concat_0 (ref), l_insert_0 (ref)
        local v68 = v66.instanceIndices[v67.instance];
        if not v66.instanceIndices[v67.instance] then
            v68 = v66.nextInstanceIndex;
            v66.instanceIndices[v67.instance] = v66.nextInstanceIndex;
            local l_v66_0 = v66;
            l_v66_0.nextInstanceIndex = l_v66_0.nextInstanceIndex + 1;
        end;
        local v70 = v13(v67.instance, "InternalData");
        local v71 = v70 and v70.virtualNode;
        local v72 = v71 and v66.treeWatcher:getHostNode(v71);
        local v73 = v72 and v66.treeWatcher:getPath(v72.hostObject);
        local v74 = tostring(v68);
        local v75 = v66.rows[v74] or {
            instanceId = v74, 
            count = 0, 
            depth = v67.depth, 
            path = v73, 
            pathString = v73 and "Path: " .. l_concat_0(v73, "."), 
            instanceName = v67.instance.__componentName, 
            time = 0, 
            renderTime = 0
        };
        v66.rows[v74] = v75;
        v75.count = v75.count + 1;
        if not v66.instanceEvents[v74] then
            v66.instanceEvents[v74] = {};
        end;
        l_insert_0(v66.instanceEvents[v74], v66:getEventInfo(v67));
        v75.time = v75.time + (v67.endTime - v67.startTime) * 1000;
        v75.renderTime = v75.renderTime + v67.renderTime;
    end, {});
    v66.eventCount = v66.eventCount + #v66.events;
    v66.events = {};
end;
v51.selectInstance = function(v76, v77) --[[ Line: 262 ]] --[[ Name: selectInstance ]]
    v76.selectedEvents = v76.instanceEvents[v77] or {};
end;
v51.getComponentRows = function(v78) --[[ Line: 270 ]] --[[ Name: getComponentRows ]]
    -- upvalues: l_values_0 (copy), l_filter_0 (copy), l_some_0 (copy)
    local v79 = l_values_0(v78.rows);
    if v78.filter or v78.searchTerm then
        v79 = l_filter_0(v79, function(v80) --[[ Line: 273 ]]
            -- upvalues: v78 (copy), l_some_0 (ref)
            if v78.searchTerm and not v80.instanceName:lower():find(v78.searchTerm) then
                return false;
            else
                return not l_some_0(v78.filter, function(v81) --[[ Line: 277 ]]
                    -- upvalues: v80 (copy)
                    return v80.instanceName:find(v81);
                end);
            end;
        end);
    end;
    return v78:getSortedData(v79, v78.profileComponents);
end;
v51.getEventRows = function(v82) --[[ Line: 285 ]] --[[ Name: getEventRows ]]
    return v82:getSortedData(v82.selectedEvents, v82.profileEvents);
end;
v51.getSortedData = function(v83, v84, v85) --[[ Line: 293 ]] --[[ Name: getSortedData ]]
    -- upvalues: l_sort_0 (copy)
    if v85.sortIndex then
        l_sort_0(v84, function(v86, v87) --[[ Line: 295 ]]
            -- upvalues: v85 (copy), v83 (copy)
            local v88 = v85.columns[v85.sortIndex];
            if v83.profileComponents.sortOrder == Enum.SortDirection.Descending then
                return v86[v88] < v87[v88];
            else
                return v86[v88] > v87[v88];
            end;
        end);
    end;
    return v84;
end;
v51.getEventInfo = function(v89, v90) --[[ Line: 312 ]] --[[ Name: getEventInfo ]]
    local v91 = "";
    local v92 = "";
    local v93 = "";
    if v90.isMount then
        v91 = "Mount";
    end;
    if v90.oldState then
        v91 = v91 .. "State";
        local v94, v95 = v89:getChangedKeys(v90.oldState, v90.newState);
        v92 = v94;
        v93 = v95;
    end;
    if v90.oldProps then
        v91 = v91 .. "Props";
        local v96, v97 = v89:getChangedKeys(v90.oldProps, v90.newProps);
        v92 = v96;
        v93 = v97;
    end;
    return {
        startTime = v90.startTime - v89.startTime, 
        renderTime = v90.renderTime, 
        time = (v90.endTime - v90.startTime) * 1000, 
        cause = v91, 
        updateTrace = v90.updateTrace, 
        details = v92, 
        detailsTip = v93
    };
end;
v51.getChangedKeys = function(_, v99, v100) --[[ Line: 343 ]] --[[ Name: getChangedKeys ]]
    -- upvalues: l_forEach_0 (copy), l_keys_0 (copy), l_concat_0 (copy)
    local v101 = {};
    l_forEach_0(v99, function(v102, v103) --[[ Line: 345 ]]
        -- upvalues: v100 (copy), v101 (copy)
        if v102 ~= v100[v103] then
            v101[tostring(v103)] = true;
        end;
    end);
    l_forEach_0(v100, function(v104, v105) --[[ Line: 351 ]]
        -- upvalues: v99 (copy), v101 (copy)
        if v104 ~= v99[v105] then
            v101[tostring(v105)] = true;
        end;
    end);
    local v106 = l_keys_0(v101);
    local v107 = nil;
    if #v106 == 0 then
        v107 = "No values changed";
    else
        v107 = "";
        l_forEach_0(v106, function(v108) --[[ Line: 363 ]]
            -- upvalues: v107 (ref), v99 (copy), v100 (copy)
            v107 = v107 .. ("%s: %s -> %s\n"):format(tostring(v108), tostring(v99[v108]), (tostring(v100[v108])));
        end);
    end;
    return l_concat_0(v106, ", "), v107;
end;
v51.clearData = function(v109) --[[ Line: 373 ]] --[[ Name: clearData ]]
    v109.events = {};
    v109.eventCount = 0;
    v109.nextInstanceIndex = 0;
    v109.instanceIndices = {};
    v109.renderTimes = {};
    v109.rows = {};
    v109.instanceEvents = {};
    v109.selectedEvents = {};
end;
v51.setActive = function(v110, v111) --[[ Line: 387 ]] --[[ Name: setActive ]]
    if v110.active == v111 then
        return;
    else
        v110.active = v111;
        local v112 = v110:getRootNode();
        if v111 then
            v110.startTime = os.clock();
            v110:start(v112);
            return;
        else
            v110:stop(v112);
            return;
        end;
    end;
end;
v51.start = function(v113, v114) --[[ Line: 405 ]] --[[ Name: start ]]
    assert(v113.createElementHidden == nil, "Roact Profiler already started");
    v113.createElementHidden = v113.roact.createElement;
    v113.roact.createElement = function(v115, ...) --[[ Line: 408 ]]
        -- upvalues: v113 (copy)
        local v116 = v113:registerComponent(v115);
        return v113.createElementHidden(v116, ...);
    end;
    v113:registerNode(v114);
end;
v51.registerNode = function(v117, v118) --[[ Line: 418 ]] --[[ Name: registerNode ]]
    -- upvalues: l_forEach_0 (copy)
    v117:registerComponent(v118.currentElement and v118.currentElement.component);
    l_forEach_0(v118.children, function(v119) --[[ Line: 421 ]]
        -- upvalues: v117 (copy)
        v117:registerNode(v119);
    end);
end;
v51.registerComponent = function(v120, v121) --[[ Line: 429 ]] --[[ Name: registerComponent ]]
    if not v120.registeredComponents[v121] then
        if typeof(v121) == "table" then
            v120:registerComponentClass(v121);
        elseif typeof(v121) == "function" then
            v120:registerComponentFn(v121);
        else
            return v121;
        end;
    end;
    return v120.registeredComponents[v121];
end;
v51.registerComponentClass = function(v122, v123) --[[ Line: 442 ]] --[[ Name: registerComponentClass ]]
    v122.registeredComponents[v123] = v123;
    v123.__resolveUpdateHidden = v123.__resolveUpdate;
    v123.__resolveUpdate = v122.resolveUpdateProxy;
    v123.__mountHidden = v123.__mount;
    v123.__mount = v122.mountProxy;
    v123.__renderHidden = v123.render;
    v123.render = v122.renderProxy;
end;
v51.registerComponentFn = function(v124, v125) --[[ Line: 453 ]] --[[ Name: registerComponentFn ]]
    local function v132(...) --[[ Line: 455 ]] --[[ Name: fnProxy ]]
        -- upvalues: v125 (copy), v124 (copy)
        local v126 = os.clock();
        local v127 = {
            ...
        };
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 458 ]]
            -- upvalues: v125 (ref), v127 (copy)
            return v125(unpack(v127));
        end);
        if not l_status_2 then
            warn("Render fn error during profiling", l_result_2);
            return false;
        else
            local v130 = (os.clock() - v126) * 1000;
            local v131 = v124.renderTimes[v124.indent] or 0;
            v124.renderTimes[v124.indent] = v131 + v130;
            return l_result_2;
        end;
    end;
    v124.registeredComponents[v125] = v132;
    v124.registeredComponents[v132] = v132;
    v124.registeredFnProxies[v132] = v125;
end;
v51.setFilter = function(v133, v134) --[[ Line: 480 ]] --[[ Name: setFilter ]]
    v133.filter = v134;
end;
v51.setSearchTerm = function(v135, v136) --[[ Line: 484 ]] --[[ Name: setSearchTerm ]]
    v135.searchTerm = v136:lower();
end;
v51.stop = function(v137, v138) --[[ Line: 493 ]] --[[ Name: stop ]]
    -- upvalues: l_forEach_0 (copy)
    v137.roact.createElement = v137.createElementHidden;
    v137.createElementHidden = nil;
    l_forEach_0(v137.registeredComponents, function(_, v140) --[[ Line: 496 ]]
        if typeof(v140) == "table" then
            v140.__mount = v140.__mountHidden;
            v140.__mountHidden = nil;
            v140.__resolveUpdate = v140.__resolveUpdateHidden;
            v140.__resolveUpdateHidden = nil;
            v140.render = v140.__renderHidden;
            v140.__renderHidden = nil;
        end;
    end);
    v137:unregisterNode(v138);
    v137.registeredComponents = {};
    v137.registeredFnProxies = {};
    v137.componentIds = {};
end;
v51.destroy = function(v141) --[[ Line: 512 ]] --[[ Name: destroy ]]
    v141:setActive(false);
    v141:clearData();
end;
v51.unregisterNode = function(v142, v143) --[[ Line: 517 ]] --[[ Name: unregisterNode ]]
    -- upvalues: l_forEach_0 (copy)
    local v144 = v143.currentElement and v143.currentElement.component;
    if v142.registeredFnProxies[v144] then
        v143.currentElement.component = v142.registeredFnProxies[v144];
    end;
    l_forEach_0(v143.children, function(v145) --[[ Line: 523 ]]
        -- upvalues: v142 (copy)
        v142:unregisterNode(v145);
    end);
end;
return v51;