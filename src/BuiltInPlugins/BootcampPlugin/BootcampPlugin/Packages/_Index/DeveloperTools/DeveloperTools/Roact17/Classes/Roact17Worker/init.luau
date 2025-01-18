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
local _ = v9.mapOne;
local l_forEach_0 = v9.forEach;
local l_filter_0 = v9.filter;
local l_last_0 = v9.last;
local l_reduce_0 = v9.reduce;
local l_reverse_0 = v9.reverse;
local l_startsWith_0 = v9.startsWith;
local _ = require(l_Parent_0.Types);
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local v28 = v8:extend("Roact17Worker", function(v22, v23, v24, v25, v26) --[[ Line: 40 ]]
    -- upvalues: v8 (copy)
    local v27 = v8.new(v22, v23, v24);
    v27.devtools = v25;
    v27.root = v26;
    v27.pendingFields = {};
    return v27;
end);
v28._init = function(v29) --[[ Line: 48 ]] --[[ Name: _init ]]
    -- upvalues: v5 (copy), v7 (copy), l_forEach_0 (copy), l_last_0 (copy), v6 (copy)
    v29.picker = v5.new(v29.debugInterface, function(v30) --[[ Line: 49 ]]
        -- upvalues: v29 (copy)
        return v29:pickInstance(v30);
    end);
    v29.fieldWatcher = v7.new(function(v31) --[[ Line: 52 ]]
        -- upvalues: l_forEach_0 (ref), v29 (copy)
        l_forEach_0(v31, function(v32) --[[ Line: 53 ]]
            -- upvalues: v29 (ref)
            v29:reduceAndSendFields(v29.fieldWatcher.root, v32);
        end);
    end, "data");
    v29.fieldWatcher.onPoll = function() --[[ Line: 57 ]]
        -- upvalues: v29 (copy), l_last_0 (ref)
        if not v29.fieldWatcher.polling then
            return;
        elseif not v29.currentPath then
            return;
        else
            local v33 = v29:getNodes(l_last_0(v29.currentPath));
            if not v33 then
                return;
            else
                local v34 = v33[v29.currentNodeIndex];
                if not v34 then
                    return;
                else
                    v29.devtools.agent:inspectElement({
                        id = v34.id, 
                        rendererID = v29.devtools.store:getRendererIDForElement(v29.root), 
                        path = {}
                    });
                    delay(0.5, v29.fieldWatcher.onPoll);
                    return;
                end;
            end;
        end;
    end;
    v29.profiler = v6.new(v29);
    v29:connectEvents();
    v29:connectDevtools();
end;
v28.connectEvents = function(v35) --[[ Line: 84 ]] --[[ Name: connectEvents ]]
    -- upvalues: v8 (copy), v4 (copy), l_last_0 (copy)
    v8.connectEvents(v35);
    v35:connect({
        eventName = v4.RoactInspector.GetChildren, 
        onEvent = function(v36) --[[ Line: 88 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35:showChildren(v36.path);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.GetBranch, 
        onEvent = function(v37) --[[ Line: 94 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35:showBranch(v37.path);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.GetFields, 
        onEvent = function(v38) --[[ Line: 100 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35.fieldWatcher:clear();
            v35.currentPath = v38.path;
            v35.currentNodeIndex = v38.nodeIndex;
            v35:showFields(v38.fieldPath or {});
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.Highlight, 
        onEvent = function(v39) --[[ Line: 109 ]] --[[ Name: onEvent ]]
            -- upvalues: l_last_0 (ref), v35 (copy)
            if #v39.path == 0 then
                return;
            else
                local v40 = tonumber(l_last_0(l_last_0(v39.path):split(".")));
                local v41 = v35:getHostNode(v40);
                local v42 = v35:getHostInstance(v40);
                if v41 and v42 then
                    v35.picker:highlight(v42);
                    return;
                else
                    v35.picker:dehighlight();
                    return;
                end;
            end;
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.Dehighlight, 
        onEvent = function() --[[ Line: 125 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35.picker:dehighlight();
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SetPicking, 
        onEvent = function(v43) --[[ Line: 131 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35.picker:setActive(v43.isPicking);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.OpenPath, 
        onEvent = function(v44) --[[ Line: 137 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35:openPath(v44.path);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SetProfiling, 
        onEvent = function(v45) --[[ Line: 143 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35.profiler:setActive(v45.isProfiling);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.GetProfileData, 
        onEvent = function(v46) --[[ Line: 149 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35.profiler:getData(v46, function(v47) --[[ Line: 150 ]]
                -- upvalues: v35 (ref)
                v35:showProfileData(v47);
            end);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.ClearProfileData, 
        onEvent = function() --[[ Line: 157 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35.profiler:clearData();
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SortProfileData, 
        onEvent = function(v48) --[[ Line: 163 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35.profiler:sortData(v48.tableName, v48.index, v48.order);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SelectProfileInstance, 
        onEvent = function(v49) --[[ Line: 169 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35.profiler:selectInstance(v49.instanceId);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SetProfileFilter, 
        onEvent = function(v50) --[[ Line: 175 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35.profiler:setFilter(v50.filter);
        end
    });
    v35:connect({
        eventName = v4.RoactInspector.SetProfileSearchTerm, 
        onEvent = function(v51) --[[ Line: 181 ]] --[[ Name: onEvent ]]
            -- upvalues: v35 (copy)
            v35.profiler:setSearchTerm(v51.searchTerm);
        end
    });
end;
v28.getNodeInfo = function(v52, v53) --[[ Line: 187 ]] --[[ Name: getNodeInfo ]]
    -- upvalues: v3 (copy)
    if v53.type == v3.ElementType.Root then
        return {
            Name = "Root", 
            Source = "", 
            Link = "", 
            Icon = "Branch"
        };
    else
        local v54 = "Branch";
        if v53.type == v3.ElementType.HostComponent then
            local v55 = v52:getHostInstance(v53.id);
            if v55 then
                v54 = v55.ClassName;
            end;
        end;
        local l_displayName_0 = v53.displayName;
        if #v53.key > 0 and v53.displayName ~= v53.key then
            l_displayName_0 = v53.key .. ": " .. v53.displayName;
        end;
        return {
            Name = l_displayName_0, 
            Source = "", 
            Link = "", 
            Icon = v54
        };
    end;
end;
v28.connectDevtools = function(v57) --[[ Line: 217 ]] --[[ Name: connectDevtools ]]
    -- upvalues: l_forEach_0 (copy), l_concat_0 (copy), l_filter_0 (copy), l_startsWith_0 (copy), v4 (copy)
    v57.devtools.bridge:addListener("inspectedElement", function(v58) --[[ Line: 218 ]]
        -- upvalues: v57 (copy), l_forEach_0 (ref), l_concat_0 (ref), l_filter_0 (ref), l_startsWith_0 (ref), v4 (ref)
        if v58.type == "full-data" then
            v57.fieldWatcher:setRoot(v58.value);
            v57.fieldWatcher:checkFields();
            l_forEach_0(v57.pendingFields, function(v59) --[[ Line: 224 ]]
                -- upvalues: v57 (ref), v58 (copy)
                v57.fieldWatcher:addPath(v59);
                v57:reduceAndSendFields(v58.value, v59);
            end);
            v57.pendingFields = {};
            return;
        else
            if v58.value ~= nil and #v58.path > 0 then
                if #v58.path > 0 then
                    v57.fieldWatcher:addPath(v58.path);
                    local v60 = l_concat_0(v58.path, ",");
                    v57.pendingFields = l_filter_0(v57.pendingFields, function(v61) --[[ Line: 237 ]]
                        -- upvalues: l_concat_0 (ref), v60 (copy), l_startsWith_0 (ref)
                        local v62 = l_concat_0(v61, ",");
                        local v63 = true;
                        if v62 ~= v60 then
                            v63 = l_startsWith_0(v62, v60 .. ",");
                        end;
                        return v63;
                    end);
                    v57:send({
                        eventName = v4.RoactInspector.ShowFields, 
                        path = v57.currentPath, 
                        nodeIndex = v57.currentNodeIndex, 
                        fieldPath = v58.path, 
                        fields = v57.fieldWatcher:collect(v58.value.data, 2, v58.path)
                    });
                else
                    v57.fieldWatcher:setRoot(v58.value.data);
                    return;
                end;
            end;
            return;
        end;
    end);
    v57.devtools.bridge:addListener("operations", function(_) --[[ Line: 250 ]]

    end);
    v57.devtools.bridge:addListener("shutdown", function(_) --[[ Line: 253 ]]
        -- upvalues: v57 (copy), v4 (ref)
        v57:send({
            eventName = v4.CloseTarget
        });
        v57.debugInterface:removeWorker(v57.targetId);
        v57:destroy();
    end);
end;
v28.reduceAndSendFields = function(v66, v67, v68) --[[ Line: 263 ]] --[[ Name: reduceAndSendFields ]]
    -- upvalues: l_reduce_0 (copy), v2 (copy), v4 (copy)
    local v74 = l_reduce_0(v68, function(v69, v70, v71) --[[ Line: 264 ]]
        -- upvalues: v2 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 265 ]]
            -- upvalues: v2 (ref), v69 (copy), v70 (copy)
            return v2(v69, v70);
        end);
        if l_status_0 and l_result_0 ~= nil then
            if v71 == 1 then
                return l_result_0.data;
            else
                return l_result_0;
            end;
        else
            return nil;
        end;
    end, v67);
    if v74 == nil then
        return;
    else
        local v75 = v66.fieldWatcher:collect(v74, 2, v68);
        v66:send({
            eventName = v4.RoactInspector.ShowFields, 
            path = v66.currentPath, 
            nodeIndex = v66.currentNodeIndex, 
            fieldPath = v68, 
            fields = v75
        });
        return;
    end;
end;
v28.pickInstance = function(v76, v77) --[[ Line: 290 ]] --[[ Name: pickInstance ]]
    local v78 = v76:getPath(v77);
    v76.picker:setActive(false);
    v76:openPath(v78);
end;
v28.getPath = function(v79, v80) --[[ Line: 296 ]] --[[ Name: getPath ]]
    -- upvalues: v3 (copy), l_concat_0 (copy), l_reverse_0 (copy), l_insert_0 (copy)
    local v81 = v79:getRenderer().getFiberIDForNative(v80);
    if not v81 then
        return nil;
    else
        local v82 = {};
        local v83 = {};
        while v81 ~= v79.root do
            local v84 = v79.devtools.store:getElementByID(v81);
            if v84.type == v3.ElementType.HostComponent and #v83 > 0 then
                l_insert_0(v82, l_concat_0(l_reverse_0(v83), "."));
                v83 = {};
            end;
            l_insert_0(v83, v81);
            v81 = v84.parentID;
        end;
        if #v83 > 0 then
            l_insert_0(v83, v79.root);
            l_insert_0(v82, l_concat_0(l_reverse_0(v83), "."));
        end;
        return l_reverse_0(v82);
    end;
end;
v28.openPath = function(v85, v86) --[[ Line: 321 ]] --[[ Name: openPath ]]
    -- upvalues: l_forEach_0 (copy), l_insert_0 (copy), l_append_0 (copy), v4 (copy)
    local v87 = {};
    l_forEach_0(v86, function(v88) --[[ Line: 325 ]]
        -- upvalues: v87 (copy), l_insert_0 (ref), v85 (copy), l_append_0 (ref)
        l_insert_0(v87, v88);
        v85:showChildren(l_append_0({}, v87));
    end);
    v85:send({
        eventName = v4.RoactInspector.PickInstance, 
        path = v86
    });
    v85:showBranch(v86);
end;
v28.showChildren = function(v89, v90, v91) --[[ Line: 339 ]] --[[ Name: showChildren ]]
    -- upvalues: v4 (copy), l_last_0 (copy)
    if #v90 == 0 then
        local v92, v93 = v89:getHostNode(v89.root);
        local v94 = if v92 then v89:getHostInstance(v92.id) else nil;
        local v95 = {
            v93
        };
        local v96 = v89:getChildren(v95, v89.root, 1);
        v89:send({
            eventName = v4.RoactInspector.ShowChildren, 
            path = v90, 
            children = {
                [v93 or "None"] = {
                    Name = if v94 then v94.Name else if v92 then v92.displayName else "<None>", 
                    Icon = "Branch", 
                    Children = v96, 
                    Path = v95
                }
            }, 
            updatedIndexes = v91
        });
        return;
    else
        local v97 = v89:getChildren(v90, tonumber(l_last_0(l_last_0(v90):split("."))), 2);
        v89:send({
            eventName = v4.RoactInspector.ShowChildren, 
            path = v90, 
            children = v97, 
            updatedIndexes = v91
        });
        return;
    end;
end;
v28.getChildren = function(v98, v99, v100, v101) --[[ Line: 372 ]] --[[ Name: getChildren ]]
    -- upvalues: l_forEach_0 (copy)
    if v101 == 0 then
        return nil;
    else
        local v102 = v98:getHostNode(v100);
        if not v102 then
            return nil;
        else
            local v103 = {};
            l_forEach_0(v102.children, function(v104) --[[ Line: 384 ]]
                -- upvalues: v98 (copy), v99 (copy), v101 (copy), v103 (copy)
                v98:_collectChildren(v104, v99, "", v101, v103);
            end);
            return v103;
        end;
    end;
end;
v28._collectChildren = function(v105, v106, v107, v108, v109, v110) --[[ Line: 397 ]] --[[ Name: _collectChildren ]]
    -- upvalues: v3 (copy), l_append_0 (copy), l_forEach_0 (copy)
    local v111 = tostring(v106);
    local v112 = #v108 == 0 and v111 or ("%s.%s"):format(v108, v111);
    local v113 = v105.devtools.store:getElementByID(v106);
    if v113.type == v3.ElementType.HostComponent then
        local v114 = v105:getHostInstance(v106);
        local v115 = v114 and v114.Name or v113.displayName;
        if #v113.key > 0 and v115 ~= v113.key then
            v115 = ("%s: %s"):format(v113.key, v115);
        end;
        local v116 = l_append_0({}, v107, {
            v112
        });
        v110[v112] = {
            Name = v115, 
            Icon = v114 and v114.ClassName or "Branch", 
            Children = v105:getChildren(v116, v106, v109 - 1), 
            Path = v116
        };
        return;
    else
        l_forEach_0(v113.children, function(v117) --[[ Line: 417 ]]
            -- upvalues: v105 (copy), v107 (copy), v112 (copy), v109 (copy), v110 (copy)
            v105:_collectChildren(v117, v107, v112, v109, v110);
        end);
        return;
    end;
end;
v28.getHostNode = function(v118, v119, v120, v121) --[[ Line: 423 ]] --[[ Name: getHostNode ]]
    -- upvalues: v3 (copy)
    local v122 = tostring(v119);
    local v123 = if v121 then ("%s.%s"):format(v121, v122) else v122;
    if v119 then
        local v124 = v118.devtools.store:getElementByID(v119);
        if not v124 then
            return nil;
        elseif v124.type == v3.ElementType.HostComponent then
            return v124, v123;
        else
            for v125 = 1, #v124.children do
                local v126, v127 = v118:getHostNode(v124.children[v125], v120, v123);
                if v126 then
                    return v126, v127;
                end;
            end;
        end;
    end;
    return nil;
end;
v28.getRenderer = function(v128) --[[ Line: 444 ]] --[[ Name: getRenderer ]]
    local v129 = v128.devtools.store:getRendererIDForElement(v128.root);
    return v128.devtools.hook.rendererInterfaces[v129];
end;
v28.getHostInstance = function(v130, v131) --[[ Line: 449 ]] --[[ Name: getHostInstance ]]
    local v132 = v130:getRenderer();
    local v133 = v130:getHostNode(v131);
    if not v133 then
        return;
    else
        local v134 = v132.findNativeNodesForFiberID(v133.id);
        return v134 and v134[1] or nil;
    end;
end;
v28.showBranch = function(v135, v136) --[[ Line: 460 ]] --[[ Name: showBranch ]]
    -- upvalues: l_last_0 (copy), l_map_0 (copy), v4 (copy)
    local v137 = v135:getNodes(l_last_0(v136));
    if not v137 then
        return;
    else
        local v138 = nil;
        local v139 = l_last_0(v137);
        if v139 then
            v138 = v135:getHostInstance(v139.id);
        end;
        local v141 = l_map_0(v137, function(v140) --[[ Line: 470 ]]
            -- upvalues: v135 (copy)
            return v135:getNodeInfo(v140);
        end);
        v135:send({
            eventName = v4.RoactInspector.ShowBranch, 
            path = v136, 
            branch = v141, 
            instance = v138
        });
        return;
    end;
end;
v28.showFields = function(v142, v143) --[[ Line: 481 ]] --[[ Name: showFields ]]
    -- upvalues: l_last_0 (copy), l_insert_0 (copy)
    local v144 = v142:getNodes(l_last_0(v142.currentPath));
    if not v144 then
        return;
    else
        local v145 = v144[v142.currentNodeIndex];
        if not v145 then
            return;
        elseif v143[1] == "_context" then
            return;
        else
            l_insert_0(v142.pendingFields, v143);
            v142.devtools.agent:inspectElement({
                id = v145.id, 
                rendererID = v142.devtools.store:getRendererIDForElement(v142.root), 
                path = v143
            });
            return;
        end;
    end;
end;
v28.getNodes = function(v146, v147) --[[ Line: 502 ]] --[[ Name: getNodes ]]
    -- upvalues: l_map_0 (copy)
    local v148 = v147:split(".");
    return l_map_0(v148, function(v149) --[[ Line: 504 ]]
        -- upvalues: v146 (copy)
        local v150 = tonumber(v149);
        return v146.devtools.store:getElementByID(v150);
    end);
end;
v28.showProfileData = function(v151, v152) --[[ Line: 510 ]] --[[ Name: showProfileData ]]
    -- upvalues: v4 (copy)
    v151:send({
        eventName = v4.RoactInspector.ShowProfileData, 
        data = v152
    });
end;
v28.destroy = function(v153) --[[ Line: 517 ]] --[[ Name: destroy ]]
    -- upvalues: v8 (copy)
    v8.destroy(v153);
    v153.picker:destroy();
    v153.profiler:destroy();
    v153.fieldWatcher:destroy();
end;
return v28;