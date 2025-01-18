local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RoactInspector.Utils.getChildAtKey);
local v3 = require(l_Parent_0.Roact17.types);
local v4 = require(l_Parent_0.EventName);
local v5 = require(l_Parent_0.RoactInspector.Classes.InstancePicker);
local v6 = require(l_Parent_0.Roact17.Classes.Roact17Profiler);
local v7 = require(l_Parent_0.RoactInspector.Classes.FieldWatcher);
local v8 = require(l_Parent_0.Classes.TargetWorker);
local v9 = require(l_Parent_1.Dash);
local l_append_0 = v9.append;
local l_map_0 = v9.map;
local l_mapOne_0 = v9.mapOne;
local l_forEach_0 = v9.forEach;
local l_filter_0 = v9.filter;
local l_last_0 = v9.last;
local l_reduce_0 = v9.reduce;
local l_startsWith_0 = v9.startsWith;
local __ = require(l_Parent_0.Types);
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local v27 = v8:extend("Roact17Worker", function(v21, v22, v23, v24, v25) --[[ Line: 39 ]]
    -- upvalues: v8 (copy)
    local v26 = v8.new(v21, v22, v23);
    v26.devtools = v24;
    v26.root = v25;
    v26.pendingFields = {};
    return v26;
end);
v27._init = function(v28) --[[ Line: 47 ]] --[[ Name: _init ]]
    -- upvalues: v5 (copy), v7 (copy), l_forEach_0 (copy), l_last_0 (copy), v6 (copy)
    v28.picker = v5.new(v28.debugInterface, function(v29) --[[ Line: 48 ]]
        -- upvalues: v28 (copy)
        return v28:pickInstance(v29);
    end);
    v28.picker.getRoot = function() --[[ Line: 52 ]]
        -- upvalues: v28 (copy)
        return v28:getHostInstance(v28.root);
    end;
    v28.fieldWatcher = v7.new(function(v30) --[[ Line: 55 ]]
        -- upvalues: l_forEach_0 (ref), v28 (copy)
        l_forEach_0(v30, function(v31) --[[ Line: 56 ]]
            -- upvalues: v28 (ref)
            v28:reduceAndSendFields(v28.fieldWatcher.root, v31);
        end);
    end, "data");
    v28.fieldWatcher.onPoll = function() --[[ Line: 60 ]]
        -- upvalues: v28 (copy), l_last_0 (ref)
        if not v28.fieldWatcher.polling then
            return;
        elseif not v28.currentPath then
            return;
        else
            local v32 = v28:getNodes(l_last_0(v28.currentPath));
            if not v32 then
                return;
            else
                local v33 = v32[v28.currentNodeIndex];
                if not v33 then
                    return;
                else
                    v28.devtools.agent:inspectElement({
                        id = v33.id, 
                        rendererID = v28.devtools.store:getRendererIDForElement(v28.root), 
                        path = {}
                    });
                    delay(0.5, v28.fieldWatcher.onPoll);
                    return;
                end;
            end;
        end;
    end;
    v28.profiler = v6.new(v28);
    v28:connectEvents();
    v28:connectDevtools();
end;
v27.connectEvents = function(v34) --[[ Line: 87 ]] --[[ Name: connectEvents ]]
    -- upvalues: v8 (copy), v4 (copy), l_last_0 (copy)
    v8.connectEvents(v34);
    v34:connect({
        eventName = v4.RoactInspector.GetChildren, 
        onEvent = function(v35) --[[ Line: 91 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34:showChildren(v35.path);
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.GetBranch, 
        onEvent = function(v36) --[[ Line: 97 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34:showBranch(v36.path);
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.GetFields, 
        onEvent = function(v37) --[[ Line: 103 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34.fieldWatcher:clear();
            v34.currentPath = v37.path;
            v34.currentNodeIndex = v37.nodeIndex;
            v34:showFields(v37.fieldPath or {});
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.Highlight, 
        onEvent = function(v38) --[[ Line: 112 ]] --[[ Name: onEvent ]]
            -- upvalues: l_last_0 (ref), v34 (copy)
            if #v38.path == 0 then
                return;
            else
                local v39 = tonumber(l_last_0(l_last_0(v38.path):split(".")));
                local v40 = v34:getHostNode(v39);
                local v41 = v34:getHostInstance(v39);
                if v40 and v41 then
                    v34.picker:highlight(v41);
                    return;
                else
                    v34.picker:dehighlight();
                    return;
                end;
            end;
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.Dehighlight, 
        onEvent = function() --[[ Line: 128 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34.picker:dehighlight();
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.SetPicking, 
        onEvent = function(v42) --[[ Line: 134 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34.picker:setActive(v42.isPicking);
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.OpenPath, 
        onEvent = function(v43) --[[ Line: 140 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34:openPath(v43.path);
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.SetProfiling, 
        onEvent = function(v44) --[[ Line: 146 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34.profiler:setActive(v44.isProfiling);
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.GetProfileData, 
        onEvent = function(v45) --[[ Line: 152 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34.profiler:getData(v45, function(v46) --[[ Line: 153 ]]
                -- upvalues: v34 (ref)
                v34:showProfileData(v46);
            end);
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.ClearProfileData, 
        onEvent = function() --[[ Line: 160 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34.profiler:clearData();
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.SortProfileData, 
        onEvent = function(v47) --[[ Line: 166 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34.profiler:sortData(v47.tableName, v47.index, v47.order);
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.SelectProfileInstance, 
        onEvent = function(v48) --[[ Line: 172 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34.profiler:selectInstance(v48.instanceId);
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.SetProfileFilter, 
        onEvent = function(v49) --[[ Line: 178 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34.profiler:setFilter(v49.filter);
        end
    });
    v34:connect({
        eventName = v4.RoactInspector.SetProfileSearchTerm, 
        onEvent = function(v50) --[[ Line: 184 ]] --[[ Name: onEvent ]]
            -- upvalues: v34 (copy)
            v34.profiler:setSearchTerm(v50.searchTerm);
        end
    });
end;
v27.getNodeInfo = function(v51, v52) --[[ Line: 190 ]] --[[ Name: getNodeInfo ]]
    -- upvalues: v3 (copy)
    if v52.type == v3.ElementType.Root then
        return {
            Name = "Root", 
            Source = "", 
            Link = "", 
            Icon = "Branch"
        };
    else
        local v53 = "Branch";
        if v52.type == v3.ElementType.HostComponent then
            local v54 = v51:getHostInstance(v52.id);
            if v54 then
                v53 = v54.ClassName;
            end;
        end;
        local l_displayName_0 = v52.displayName;
        if #v52.key > 0 and v52.displayName ~= v52.key then
            l_displayName_0 = v52.key .. ": " .. v52.displayName;
        end;
        return {
            Name = l_displayName_0, 
            Source = "", 
            Link = "", 
            Icon = v53
        };
    end;
end;
v27.connectDevtools = function(v56) --[[ Line: 220 ]] --[[ Name: connectDevtools ]]
    -- upvalues: l_forEach_0 (copy), l_concat_0 (copy), l_filter_0 (copy), l_startsWith_0 (copy), v4 (copy)
    v56.devtools.bridge:addListener("inspectedElement", function(v57) --[[ Line: 221 ]]
        -- upvalues: v56 (copy), l_forEach_0 (ref), l_concat_0 (ref), l_filter_0 (ref), l_startsWith_0 (ref), v4 (ref)
        if v57.type == "full-data" then
            v56.fieldWatcher:setRoot(v57.value);
            v56.fieldWatcher:checkFields();
            l_forEach_0(v56.pendingFields, function(v58) --[[ Line: 227 ]]
                -- upvalues: v56 (ref), v57 (copy)
                v56.fieldWatcher:addPath(v58);
                v56:reduceAndSendFields(v57.value, v58);
            end);
            v56.pendingFields = {};
            return;
        else
            if v57.value ~= nil and #v57.path > 0 then
                if #v57.path > 0 then
                    v56.fieldWatcher:addPath(v57.path);
                    local v59 = l_concat_0(v57.path, ",");
                    v56.pendingFields = l_filter_0(v56.pendingFields, function(v60) --[[ Line: 240 ]]
                        -- upvalues: l_concat_0 (ref), v59 (copy), l_startsWith_0 (ref)
                        local v61 = l_concat_0(v60, ",");
                        local v62 = true;
                        if v61 ~= v59 then
                            v62 = l_startsWith_0(v61, v59 .. ",");
                        end;
                        return v62;
                    end);
                    v56:send({
                        eventName = v4.RoactInspector.ShowFields, 
                        path = v56.currentPath, 
                        nodeIndex = v56.currentNodeIndex, 
                        fieldPath = v57.path, 
                        fields = v56.fieldWatcher:collect(v57.value.data, 2, v57.path)
                    });
                else
                    v56.fieldWatcher:setRoot(v57.value.data);
                    return;
                end;
            end;
            return;
        end;
    end);
    v56.devtools.bridge:addListener("operations", function(__) --[[ Line: 253 ]]

    end);
    v56.devtools.bridge:addListener("shutdown", function(__) --[[ Line: 256 ]]
        -- upvalues: v56 (copy), v4 (ref)
        v56:send({
            eventName = v4.CloseTarget
        });
        v56.debugInterface:removeWorker(v56.targetId);
        v56:destroy();
    end);
end;
v27.reduceAndSendFields = function(v65, v66, v67) --[[ Line: 266 ]] --[[ Name: reduceAndSendFields ]]
    -- upvalues: l_reduce_0 (copy), v2 (copy), v4 (copy)
    local v73 = l_reduce_0(v67, function(v68, v69, v70) --[[ Line: 267 ]]
        -- upvalues: v2 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 268 ]]
            -- upvalues: v2 (ref), v68 (copy), v69 (copy)
            return v2(v68, v69);
        end);
        if l_status_0 and l_result_0 ~= nil then
            if v70 == 1 then
                return l_result_0.data;
            else
                return l_result_0;
            end;
        else
            return nil;
        end;
    end, v66);
    if v73 == nil then
        return;
    else
        local v74 = v65.fieldWatcher:collect(v73, 2, v67);
        v65:send({
            eventName = v4.RoactInspector.ShowFields, 
            path = v65.currentPath, 
            nodeIndex = v65.currentNodeIndex, 
            fieldPath = v67, 
            fields = v74
        });
        return;
    end;
end;
v27.pickInstance = function(v75, v76) --[[ Line: 293 ]] --[[ Name: pickInstance ]]
    local v77 = v75:getPath(v76);
    v75.picker:setActive(false);
    v75:openPath(v77);
end;
v27.getPath = function(v78, v79) --[[ Line: 299 ]] --[[ Name: getPath ]]
    -- upvalues: l_insert_0 (copy), l_concat_0 (copy), l_last_0 (copy)
    local v80 = v78:getHostInstance(v78.root);
    local v81 = {};
    if v80 ~= v79 then
        l_insert_0(v81, v79);
        local l_v79_0 = v79;
        while l_v79_0 and l_v79_0.Parent ~= v80 do
            l_insert_0(v81, l_v79_0.Parent);
            l_v79_0 = l_v79_0.Parent;
        end;
        if l_v79_0.Parent ~= v80 then
            return;
        end;
    end;
    local v83, v84 = v78:getHostNode(v78.root);
    local l_id_0 = v83.id;
    local v86 = {
        v84
    };
    for v87 = #v81, 1, -1 do
        local v88 = v78.devtools.store:getElementByID(l_id_0);
        if not v88 then
            return nil;
        else
            local v89 = v78:_findChildKeyForInstance(v88, {}, v81[v87]);
            l_insert_0(v86, l_concat_0(v89, "."));
            l_id_0 = l_last_0(v89);
        end;
    end;
    local v90, v91 = v78:getHostNode(l_id_0);
    _ = v90;
    l_insert_0(v86, v91);
    return v86;
end;
v27._findChildKeyForInstance = function(v92, v93, v94, v95) --[[ Line: 334 ]] --[[ Name: _findChildKeyForInstance ]]
    -- upvalues: l_mapOne_0 (copy), l_append_0 (copy), v3 (copy)
    return l_mapOne_0(v93.children, function(v96) --[[ Line: 335 ]]
        -- upvalues: v92 (copy), l_append_0 (ref), v94 (copy), v3 (ref), v95 (copy)
        local v97 = v92.devtools.store:getElementByID(v96);
        local v98 = l_append_0({}, v94, {
            v96
        });
        if v97.type == v3.ElementType.HostComponent then
            if v92:getHostInstance(v96) == v95 then
                return v98;
            else
                return nil;
            end;
        else
            return v92:_findChildKeyForInstance(v97, v98, v95);
        end;
    end);
end;
v27.openPath = function(v99, v100) --[[ Line: 351 ]] --[[ Name: openPath ]]
    -- upvalues: l_forEach_0 (copy), l_insert_0 (copy), l_append_0 (copy), v4 (copy)
    local v101 = {};
    l_forEach_0(v100, function(v102) --[[ Line: 355 ]]
        -- upvalues: v101 (copy), l_insert_0 (ref), v99 (copy), l_append_0 (ref)
        l_insert_0(v101, v102);
        v99:showChildren(l_append_0({}, v101));
    end);
    v99:send({
        eventName = v4.RoactInspector.PickInstance, 
        path = v100
    });
    v99:showBranch(v100);
end;
v27.showChildren = function(v103, v104, v105) --[[ Line: 369 ]] --[[ Name: showChildren ]]
    -- upvalues: v4 (copy), l_last_0 (copy)
    if #v104 == 0 then
        local v106, v107 = v103:getHostNode(v103.root);
        local v108 = v103:getHostInstance(v106.id);
        local v109 = {
            v107
        };
        local v110 = v103:getChildren(v109, v103.root, 1);
        v103:send({
            eventName = v4.RoactInspector.ShowChildren, 
            path = v104, 
            children = {
                [v107] = {
                    Name = v108 and v108.Name or v106.displayName, 
                    Icon = "Branch", 
                    Children = v110, 
                    Path = v109
                }
            }, 
            updatedIndexes = v105
        });
        return;
    else
        local v111 = v103:getChildren(v104, tonumber(l_last_0(l_last_0(v104):split("."))), 2);
        v103:send({
            eventName = v4.RoactInspector.ShowChildren, 
            path = v104, 
            children = v111, 
            updatedIndexes = v105
        });
        return;
    end;
end;
v27.getChildren = function(v112, v113, v114, v115) --[[ Line: 402 ]] --[[ Name: getChildren ]]
    -- upvalues: l_forEach_0 (copy)
    if v115 == 0 then
        return nil;
    else
        local v116 = v112:getHostNode(v114);
        if not v116 then
            return nil;
        else
            local v117 = {};
            l_forEach_0(v116.children, function(v118) --[[ Line: 414 ]]
                -- upvalues: v112 (copy), v113 (copy), v115 (copy), v117 (copy)
                v112:_collectChildren(v118, v113, "", v115, v117);
            end);
            return v117;
        end;
    end;
end;
v27._collectChildren = function(v119, v120, v121, v122, v123, v124) --[[ Line: 427 ]] --[[ Name: _collectChildren ]]
    -- upvalues: v3 (copy), l_append_0 (copy), l_forEach_0 (copy)
    local v125 = tostring(v120);
    local v126 = #v122 == 0 and v125 or ("%s.%s"):format(v122, v125);
    local v127 = v119.devtools.store:getElementByID(v120);
    if v127.type == v3.ElementType.HostComponent then
        local v128 = v119:getHostInstance(v120);
        local v129 = v128 and v128.Name or v127.displayName;
        if #v127.key > 0 and v129 ~= v127.key then
            v129 = ("%s: %s"):format(v127.key, v129);
        end;
        local v130 = l_append_0({}, v121, {
            v126
        });
        v124[v126] = {
            Name = v129, 
            Icon = v128 and v128.ClassName or "Branch", 
            Children = v119:getChildren(v130, v120, v123 - 1), 
            Path = v130
        };
        return;
    else
        l_forEach_0(v127.children, function(v131) --[[ Line: 447 ]]
            -- upvalues: v119 (copy), v121 (copy), v126 (copy), v123 (copy), v124 (copy)
            v119:_collectChildren(v131, v121, v126, v123, v124);
        end);
        return;
    end;
end;
v27.getHostNode = function(v132, v133, __) --[[ Line: 453 ]] --[[ Name: getHostNode ]]
    -- upvalues: v3 (copy)
    local v135 = tostring(v133);
    local v136 = nil;
    while true do
        if v133 then
            v136 = v132.devtools.store:getElementByID(v133);
            if not v136 then
                return nil;
            elseif v136.type == v3.ElementType.HostComponent then
                return v136, v135;
            elseif #v136.children == 0 then
                return nil;
            else
                v133 = v136.children[1];
                v135 = v135 .. "." .. tostring(v133);
            end;
        else
            return nil;
        end;
    end;
end;
v27.getRenderer = function(v137) --[[ Line: 473 ]] --[[ Name: getRenderer ]]
    local v138 = v137.devtools.store:getRendererIDForElement(v137.root);
    return v137.devtools.hook.rendererInterfaces[v138];
end;
v27.getHostInstance = function(v139, v140) --[[ Line: 478 ]] --[[ Name: getHostInstance ]]
    local v141 = v139:getRenderer();
    local v142 = v139:getHostNode(v140);
    if not v142 then
        return;
    else
        local v143 = v141.findNativeNodesForFiberID(v142.id);
        return v143 and v143[1] or nil;
    end;
end;
v27.showBranch = function(v144, v145) --[[ Line: 489 ]] --[[ Name: showBranch ]]
    -- upvalues: l_last_0 (copy), l_map_0 (copy), v4 (copy)
    local v146 = v144:getNodes(l_last_0(v145));
    if not v146 then
        return;
    else
        local v147 = nil;
        local v148 = l_last_0(v146);
        if v148 then
            v147 = v144:getHostInstance(v148.id);
        end;
        local v150 = l_map_0(v146, function(v149) --[[ Line: 499 ]]
            -- upvalues: v144 (copy)
            return v144:getNodeInfo(v149);
        end);
        v144:send({
            eventName = v4.RoactInspector.ShowBranch, 
            path = v145, 
            branch = v150, 
            instance = v147
        });
        return;
    end;
end;
v27.showFields = function(v151, v152) --[[ Line: 510 ]] --[[ Name: showFields ]]
    -- upvalues: l_last_0 (copy), l_insert_0 (copy)
    local v153 = v151:getNodes(l_last_0(v151.currentPath));
    if not v153 then
        return;
    else
        local v154 = v153[v151.currentNodeIndex];
        if not v154 then
            return;
        elseif v152[1] == "_context" then
            return;
        else
            l_insert_0(v151.pendingFields, v152);
            v151.devtools.agent:inspectElement({
                id = v154.id, 
                rendererID = v151.devtools.store:getRendererIDForElement(v151.root), 
                path = v152
            });
            return;
        end;
    end;
end;
v27.getNodes = function(v155, v156) --[[ Line: 531 ]] --[[ Name: getNodes ]]
    -- upvalues: l_map_0 (copy)
    local v157 = v156:split(".");
    return l_map_0(v157, function(v158) --[[ Line: 533 ]]
        -- upvalues: v155 (copy)
        local v159 = tonumber(v158);
        return v155.devtools.store:getElementByID(v159);
    end);
end;
v27.showProfileData = function(v160, v161) --[[ Line: 539 ]] --[[ Name: showProfileData ]]
    -- upvalues: v4 (copy)
    v160:send({
        eventName = v4.RoactInspector.ShowProfileData, 
        data = v161
    });
end;
v27.destroy = function(v162) --[[ Line: 546 ]] --[[ Name: destroy ]]
    -- upvalues: v8 (copy)
    v8.destroy(v162);
    v162.picker:destroy();
    v162.profiler:destroy();
    v162.fieldWatcher:destroy();
end;
return v27;