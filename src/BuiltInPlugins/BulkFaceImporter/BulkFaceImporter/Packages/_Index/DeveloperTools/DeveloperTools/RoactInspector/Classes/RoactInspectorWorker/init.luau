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
local l_map_0 = v10.map;
local l_forEach_0 = v10.forEach;
local l_last_0 = v10.last;
local l_pretty_0 = v10.pretty;
local l_reduce_0 = v10.reduce;
local _ = require(l_Parent_0.Types);
local l_insert_0 = table.insert;
local v24 = v7:extend("RoactInspectorWorker", function(v18, v19, v20, v21, v22) --[[ Line: 34 ]]
    -- upvalues: v7 (copy)
    local v23 = v7.new(v18, v19, v20);
    v23.roact = v22;
    v23.tree = v21;
    return v23;
end);
v24._init = function(v25) --[[ Line: 41 ]] --[[ Name: _init ]]
    -- upvalues: v8 (copy), v4 (copy), v5 (copy), v6 (copy)
    v25.treeWatcher = v8.new(v25.debugInterface, v25.tree, function(v26, v27) --[[ Line: 42 ]]
        -- upvalues: v25 (copy)
        v25:showChildren(v26, v27);
    end);
    v25.treeWatcher:monitor();
    v25.fieldWatcher = v4.new(function(_) --[[ Line: 47 ]]
        -- upvalues: v25 (copy)
        v25:showFields({});
    end);
    v25.picker = v5.new(v25.debugInterface, function(v29) --[[ Line: 51 ]]
        -- upvalues: v25 (copy)
        return v25:pickInstance(v29);
    end);
    v25.profiler = v6.new(v25.debugInterface, v25.treeWatcher, v25.tree, v25.roact);
    v25:connectEvents();
end;
v24.connectEvents = function(v30) --[[ Line: 60 ]] --[[ Name: connectEvents ]]
    -- upvalues: v7 (copy), v3 (copy)
    v7.connectEvents(v30);
    v30:connect({
        eventName = v3.RoactInspector.GetChildren, 
        onEvent = function(v31) --[[ Line: 64 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30:showChildren(v31.path);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.GetBranch, 
        onEvent = function(v32) --[[ Line: 70 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30:showBranch(v32.path);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.GetFields, 
        onEvent = function(v33) --[[ Line: 76 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30.currentPath = v33.path;
            v30.currentNodeIndex = v33.nodeIndex;
            v30:showFields(v33.fieldPath or {});
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.Highlight, 
        onEvent = function(v34) --[[ Line: 84 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            local v35 = v30.treeWatcher:getNode(v34.path);
            if not v35 then
                return;
            else
                local v36 = v30.treeWatcher:getHostNode(v35);
                if v36 and v36.hostObject then
                    v30.picker:highlight(v36.hostObject);
                    return;
                else
                    v30.picker:dehighlight();
                    return;
                end;
            end;
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.Dehighlight, 
        onEvent = function() --[[ Line: 99 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30.picker:dehighlight();
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SetPicking, 
        onEvent = function(v37) --[[ Line: 105 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30.picker:setActive(v37.isPicking);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.OpenPath, 
        onEvent = function(v38) --[[ Line: 111 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30:openPath(v38.path);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SetProfiling, 
        onEvent = function(v39) --[[ Line: 117 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30.profiler:setActive(v39.isProfiling);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.GetProfileData, 
        onEvent = function(v40) --[[ Line: 123 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            local v41 = v30.profiler:getData(v40.componentSliceStart, v40.componentSliceEnd, v40.eventSliceStart, v40.eventSliceEnd);
            v30:showProfileData(v41);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.ClearProfileData, 
        onEvent = function() --[[ Line: 130 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30.profiler:clearData();
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SortProfileData, 
        onEvent = function(v42) --[[ Line: 136 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30.profiler:sortData(v42.tableName, v42.index, v42.order);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SelectProfileInstance, 
        onEvent = function(v43) --[[ Line: 142 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30.profiler:selectInstance(v43.instanceId);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SetProfileFilter, 
        onEvent = function(v44) --[[ Line: 148 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30.profiler:setFilter(v44.filter);
        end
    });
    v30:connect({
        eventName = v3.RoactInspector.SetProfileSearchTerm, 
        onEvent = function(v45) --[[ Line: 154 ]] --[[ Name: onEvent ]]
            -- upvalues: v30 (copy)
            v30.profiler:setSearchTerm(v45.searchTerm);
        end
    });
end;
v24.getNodeInfo = function(v46, v47) --[[ Line: 160 ]] --[[ Name: getNodeInfo ]]
    local v48 = "";
    local v49 = "";
    if v47.currentElement.source then
        local v50 = v47.currentElement.source:find("\n");
        if v50 then
            v48 = v48:sub(1, v50 - 1);
            v49 = v48:match("[A-Za-z0-9_]+%.[A-Za-z0-9_]+:[0-9]+") or "";
        end;
    end;
    return {
        Name = v46.treeWatcher:getNodeName(v47), 
        Source = v48, 
        Link = v49, 
        Icon = v46.treeWatcher:getNodeIcon(v47)
    };
end;
v24.pickInstance = function(v51, v52) --[[ Line: 178 ]] --[[ Name: pickInstance ]]
    v51.picker:setActive(false);
    v51:openPath((v51.treeWatcher:getPath(v52)));
end;
v24.openPath = function(v53, v54) --[[ Line: 185 ]] --[[ Name: openPath ]]
    -- upvalues: l_forEach_0 (copy), l_insert_0 (copy), v3 (copy)
    local v55 = {};
    l_forEach_0(v54, function(v56) --[[ Line: 189 ]]
        -- upvalues: v55 (copy), l_insert_0 (ref), v53 (copy)
        l_insert_0(v55, v56);
        v53:showChildren(v55);
    end);
    v53:send({
        eventName = v3.RoactInspector.PickInstance, 
        path = v54
    });
    v53:showBranch(v54);
end;
v24.showChildren = function(v57, v58, v59) --[[ Line: 203 ]] --[[ Name: showChildren ]]
    -- upvalues: l_pretty_0 (copy), v3 (copy)
    local v60 = v57.treeWatcher:getNode(v58);
    if not v60 then
        warn("[DeveloperInspector - Roact] Missing path " .. l_pretty_0(v58));
        return;
    else
        v57.treeWatcher:watchPath(v58);
        local v61 = v57.treeWatcher:getChildren(v58, v60, 2);
        v57:send({
            eventName = v3.RoactInspector.ShowChildren, 
            path = v58, 
            children = v61, 
            updatedIndexes = v59
        });
        return;
    end;
end;
v24.showBranch = function(v62, v63) --[[ Line: 221 ]] --[[ Name: showBranch ]]
    -- upvalues: l_last_0 (copy), l_Selection_0 (copy), l_map_0 (copy), v3 (copy)
    local v64 = v62.treeWatcher:getNodes(v63);
    if not v64 then
        return;
    else
        local v65 = l_last_0(v64);
        if v65 and v65.hostObject then
            l_Selection_0:Set({
                v65.hostObject
            });
        end;
        local v67 = l_map_0(v64, function(v66) --[[ Line: 230 ]]
            -- upvalues: v62 (copy)
            return v62:getNodeInfo(v66);
        end);
        v62:send({
            eventName = v3.RoactInspector.ShowBranch, 
            path = v63, 
            branch = v67
        });
        return;
    end;
end;
v24.showFields = function(v68, v69) --[[ Line: 240 ]] --[[ Name: showFields ]]
    -- upvalues: l_reduce_0 (copy), v2 (copy), v3 (copy)
    local v70 = v68.treeWatcher:getNodes(v68.currentPath);
    if not v70 then
        return;
    else
        local v71 = v70[v68.currentNodeIndex];
        if not v71 then
            return;
        else
            local v72 = v71.instance or v71.currentElement;
            v68.fieldWatcher:clear();
            v68.fieldWatcher:setRoot(v72);
            v68.fieldWatcher:addPath(v69);
            local v77 = l_reduce_0(v69, function(v73, v74) --[[ Line: 256 ]]
                -- upvalues: v2 (ref)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 257 ]]
                    -- upvalues: v2 (ref), v73 (copy), v74 (copy)
                    return v2(v73, v74);
                end);
                if l_status_0 then
                    return l_result_0;
                else
                    return nil;
                end;
            end, v72);
            if v77 == nil then
                return;
            else
                v68:send({
                    eventName = v3.RoactInspector.ShowFields, 
                    path = v68.currentPath, 
                    nodeIndex = v68.currentNodeIndex, 
                    fieldPath = v69, 
                    fields = v68.fieldWatcher:collect(v77, 2, v69)
                });
                return;
            end;
        end;
    end;
end;
v24.showProfileData = function(v78, v79) --[[ Line: 280 ]] --[[ Name: showProfileData ]]
    -- upvalues: v3 (copy)
    v78:send({
        eventName = v3.RoactInspector.ShowProfileData, 
        data = v79
    });
end;
v24.destroy = function(v80) --[[ Line: 287 ]] --[[ Name: destroy ]]
    -- upvalues: v7 (copy)
    v7.destroy(v80);
    v80.profiler:destroy();
    v80.picker:destroy();
    v80.treeWatcher:destroy();
    v80.fieldWatcher:destroy();
    v80.treeWatcher = nil;
end;
return v24;