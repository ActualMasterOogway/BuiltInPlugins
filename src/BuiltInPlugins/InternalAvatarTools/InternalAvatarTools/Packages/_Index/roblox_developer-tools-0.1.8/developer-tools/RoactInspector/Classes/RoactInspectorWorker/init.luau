local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RoactInspector.Utils.getChildAtKey);
local v3 = require(l_Parent_0.EventName);
local v4 = require(l_Parent_0.RoactInspector.Classes.FieldWatcher);
local v5 = require(l_Parent_0.RoactInspector.Classes.InstancePicker);
local v6 = require(l_Parent_0.RoactInspector.Classes.RoactProfiler);
local v7 = require(l_Parent_0.Classes.TargetWorker);
local v8 = require(l_Parent_0.RoactInspector.Classes.RoactTreeWatcher);
local l_Selection_0 = game:GetService("Selection");
local v10 = require(l_Parent_1.Dash);
local _ = v10.Types;
local l_map_0 = v10.map;
local l_forEach_0 = v10.forEach;
local l_last_0 = v10.last;
local l_pretty_0 = v10.pretty;
local l_reduce_0 = v10.reduce;
local _ = require(l_Parent_0.Types);
local l_insert_0 = table.insert;
local v25 = v7:extend("RoactInspectorWorker", function(v19, v20, v21, v22, v23) --[[ Line: 34 ]]
    -- upvalues: v7 (copy)
    local v24 = v7.new(v19, v20, v21);
    v24.roact = v23;
    v24.tree = v22;
    return v24;
end);
v25._init = function(v26) --[[ Line: 41 ]] --[[ Name: _init ]]
    -- upvalues: v8 (copy), v4 (copy), v5 (copy), v6 (copy)
    v26.treeWatcher = v8.new(v26.debugInterface, v26.tree, function(v27, v28) --[[ Line: 42 ]]
        -- upvalues: v26 (copy)
        v26:showChildren(v27, v28);
    end);
    v26.treeWatcher:monitor();
    v26.fieldWatcher = v4.new(function(_) --[[ Line: 47 ]]
        -- upvalues: v26 (copy)
        v26:showFields({});
    end);
    v26.picker = v5.new(v26.debugInterface, function(v30) --[[ Line: 51 ]]
        -- upvalues: v26 (copy)
        return v26:pickInstance(v30);
    end);
    v26.profiler = v6.new(v26.debugInterface, v26.treeWatcher, v26.tree, v26.roact);
    v26:connectEvents();
end;
v25.connectEvents = function(v31) --[[ Line: 60 ]] --[[ Name: connectEvents ]]
    -- upvalues: v7 (copy), v3 (copy)
    v7.connectEvents(v31);
    v31:connect({
        eventName = v3.RoactInspector.GetChildren, 
        onEvent = function(v32) --[[ Line: 64 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31:showChildren(v32.path);
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.GetBranch, 
        onEvent = function(v33) --[[ Line: 70 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31:showBranch(v33.path);
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.GetFields, 
        onEvent = function(v34) --[[ Line: 76 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31.currentPath = v34.path;
            v31.currentNodeIndex = v34.nodeIndex;
            v31:showFields(v34.fieldPath or {});
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.Highlight, 
        onEvent = function(v35) --[[ Line: 84 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            local v36 = v31.treeWatcher:getNode(v35.path);
            if not v36 then
                return;
            else
                local v37 = v31.treeWatcher:getHostNode(v36);
                if v37 and v37.hostObject then
                    v31.picker:highlight(v37.hostObject);
                    return;
                else
                    v31.picker:dehighlight();
                    return;
                end;
            end;
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.Dehighlight, 
        onEvent = function() --[[ Line: 99 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31.picker:dehighlight();
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.SetPicking, 
        onEvent = function(v38) --[[ Line: 105 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31.picker:setActive(v38.isPicking);
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.OpenPath, 
        onEvent = function(v39) --[[ Line: 111 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31:openPath(v39.path);
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.SetProfiling, 
        onEvent = function(v40) --[[ Line: 117 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31.profiler:setActive(v40.isProfiling);
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.GetProfileData, 
        onEvent = function(v41) --[[ Line: 123 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            local v42 = v31.profiler:getData(v41.componentSliceStart, v41.componentSliceEnd, v41.eventSliceStart, v41.eventSliceEnd);
            v31:showProfileData(v42);
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.ClearProfileData, 
        onEvent = function() --[[ Line: 130 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31.profiler:clearData();
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.SortProfileData, 
        onEvent = function(v43) --[[ Line: 136 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31.profiler:sortData(v43.tableName, v43.index, v43.order);
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.SelectProfileInstance, 
        onEvent = function(v44) --[[ Line: 142 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31.profiler:selectInstance(v44.instanceId);
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.SetProfileFilter, 
        onEvent = function(v45) --[[ Line: 148 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31.profiler:setFilter(v45.filter);
        end
    });
    v31:connect({
        eventName = v3.RoactInspector.SetProfileSearchTerm, 
        onEvent = function(v46) --[[ Line: 154 ]] --[[ Name: onEvent ]]
            -- upvalues: v31 (copy)
            v31.profiler:setSearchTerm(v46.searchTerm);
        end
    });
end;
v25.getNodeInfo = function(v47, v48) --[[ Line: 160 ]] --[[ Name: getNodeInfo ]]
    local v49 = "";
    local v50 = "";
    if v48.currentElement.source then
        local v51 = v48.currentElement.source:find("\n");
        if v51 then
            v49 = v49:sub(1, v51 - 1);
            v50 = v49:match("[A-Za-z0-9_]+%.[A-Za-z0-9_]+:[0-9]+") or "";
        end;
    end;
    return {
        Name = v47.treeWatcher:getNodeName(v48), 
        Source = v49, 
        Link = v50, 
        Icon = v47.treeWatcher:getNodeIcon(v48)
    };
end;
v25.pickInstance = function(v52, v53) --[[ Line: 178 ]] --[[ Name: pickInstance ]]
    v52.picker:setActive(false);
    v52:openPath((v52.treeWatcher:getPath(v53)));
end;
v25.openPath = function(v54, v55) --[[ Line: 185 ]] --[[ Name: openPath ]]
    -- upvalues: l_forEach_0 (copy), l_insert_0 (copy), v3 (copy)
    local v56 = {};
    l_forEach_0(v55, function(v57) --[[ Line: 189 ]]
        -- upvalues: v56 (copy), l_insert_0 (ref), v54 (copy)
        l_insert_0(v56, v57);
        v54:showChildren(v56);
    end);
    v54:send({
        eventName = v3.RoactInspector.PickInstance, 
        path = v55
    });
    v54:showBranch(v55);
end;
v25.showChildren = function(v58, v59, v60) --[[ Line: 203 ]] --[[ Name: showChildren ]]
    -- upvalues: l_pretty_0 (copy), v3 (copy)
    local v61 = v58.treeWatcher:getNode(v59);
    if not v61 then
        warn("[DeveloperInspector - Roact] Missing path " .. l_pretty_0(v59));
        return;
    else
        v58.treeWatcher:watchPath(v59);
        local v62 = v58.treeWatcher:getChildren(v59, v61, 2);
        v58:send({
            eventName = v3.RoactInspector.ShowChildren, 
            path = v59, 
            children = v62, 
            updatedIndexes = v60
        });
        return;
    end;
end;
v25.showBranch = function(v63, v64) --[[ Line: 221 ]] --[[ Name: showBranch ]]
    -- upvalues: l_last_0 (copy), l_Selection_0 (copy), l_map_0 (copy), v3 (copy)
    local v65 = v63.treeWatcher:getNodes(v64);
    if not v65 then
        return;
    else
        local v66 = l_last_0(v65);
        if v66 and v66.hostObject then
            l_Selection_0:Set({
                v66.hostObject
            });
        end;
        local v68 = l_map_0(v65, function(v67) --[[ Line: 230 ]]
            -- upvalues: v63 (copy)
            return v63:getNodeInfo(v67);
        end);
        v63:send({
            eventName = v3.RoactInspector.ShowBranch, 
            path = v64, 
            branch = v68
        });
        return;
    end;
end;
v25.showFields = function(v69, v70) --[[ Line: 240 ]] --[[ Name: showFields ]]
    -- upvalues: l_reduce_0 (copy), v2 (copy), v3 (copy)
    local v71 = v69.treeWatcher:getNodes(v69.currentPath);
    if not v71 then
        return;
    else
        local v72 = v71[v69.currentNodeIndex];
        if not v72 then
            return;
        else
            local v73 = v72.instance or v72.currentElement;
            v69.fieldWatcher:setRoot(v73);
            v69.fieldWatcher:addPath(v70);
            local v78 = l_reduce_0(v70, function(v74, v75) --[[ Line: 255 ]]
                -- upvalues: v2 (ref)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 256 ]]
                    -- upvalues: v2 (ref), v74 (copy), v75 (copy)
                    return v2(v74, v75);
                end);
                if l_status_0 then
                    return l_result_0;
                else
                    return nil;
                end;
            end, v73);
            if v78 == nil then
                return;
            else
                v69:send({
                    eventName = v3.RoactInspector.ShowFields, 
                    path = v69.currentPath, 
                    nodeIndex = v69.currentNodeIndex, 
                    fieldPath = v70, 
                    fields = v69.fieldWatcher:collect(v78, 2, v70)
                });
                return;
            end;
        end;
    end;
end;
v25.showProfileData = function(v79, v80) --[[ Line: 279 ]] --[[ Name: showProfileData ]]
    -- upvalues: v3 (copy)
    v79:send({
        eventName = v3.RoactInspector.ShowProfileData, 
        data = v80
    });
end;
v25.destroy = function(v81) --[[ Line: 286 ]] --[[ Name: destroy ]]
    -- upvalues: v7 (copy)
    v7.destroy(v81);
    v81.picker:destroy();
    v81.treeWatcher:destroy();
    v81.fieldWatcher:destroy();
    v81.treeWatcher = nil;
end;
return v25;