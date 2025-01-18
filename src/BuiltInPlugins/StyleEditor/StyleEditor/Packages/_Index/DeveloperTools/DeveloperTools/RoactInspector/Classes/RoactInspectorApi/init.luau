local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.EventName);
local v2 = require(l_Parent_0.Classes.TargetApi);
local v3 = v2:extend("RoactInspectorApi");
v3._init = function(v4) --[[ Line: 15 ]] --[[ Name: _init ]]
    v4.profileComponentsPageIndex = 1;
    v4.profileComponentsPageSize = 1;
    v4.profileEventsPageIndex = 1;
    v4.profileEventsPageSize = 1;
end;
v3.attach = function(v5, v6) --[[ Line: 22 ]] --[[ Name: attach ]]
    -- upvalues: v2 (copy), v1 (copy)
    v5.handlers = v6;
    v2.attach(v5);
    v5:_connect({
        eventName = v1.RoactInspector.ShowChildren, 
        onEvent = function(v7) --[[ Line: 27 ]] --[[ Name: onEvent ]]
            -- upvalues: v5 (copy)
            v5.handlers.onUpdateInstances(v7.path, v7.children, v7.updatedIndexes);
        end
    });
    v5:_connect({
        eventName = v1.RoactInspector.ShowBranch, 
        onEvent = function(v8) --[[ Line: 33 ]] --[[ Name: onEvent ]]
            -- upvalues: v5 (copy)
            v5.handlers.onUpdateBranch(v8.path, v8.branch);
        end
    });
    v5:_connect({
        eventName = v1.RoactInspector.ShowFields, 
        onEvent = function(v9) --[[ Line: 39 ]] --[[ Name: onEvent ]]
            -- upvalues: v5 (copy)
            v5.handlers.onUpdateFields(v9.path, v9.nodeIndex, v9.fieldPath, v9.fields);
        end
    });
    v5:_connect({
        eventName = v1.RoactInspector.PickInstance, 
        onEvent = function(v10) --[[ Line: 45 ]] --[[ Name: onEvent ]]
            -- upvalues: v5 (copy)
            v5.handlers.onPickInstance(v10.path);
        end
    });
    v5:_connect({
        eventName = v1.RoactInspector.ShowProfileData, 
        onEvent = function(v11) --[[ Line: 51 ]] --[[ Name: onEvent ]]
            -- upvalues: v5 (copy)
            v5.handlers.onUpdateProfileData(v11.data);
        end
    });
end;
v3.getChildren = function(v12, v13) --[[ Line: 57 ]] --[[ Name: getChildren ]]
    -- upvalues: v1 (copy)
    v12:_send({
        eventName = v1.RoactInspector.GetChildren, 
        path = v13
    });
end;
v3.getRoot = function(v14) --[[ Line: 64 ]] --[[ Name: getRoot ]]
    v14:getChildren({});
end;
v3.getBranch = function(v15, v16) --[[ Line: 68 ]] --[[ Name: getBranch ]]
    -- upvalues: v1 (copy)
    v15:_send({
        eventName = v1.RoactInspector.GetBranch, 
        path = v16
    });
end;
v3.getFields = function(v17, v18, v19, v20) --[[ Line: 75 ]] --[[ Name: getFields ]]
    -- upvalues: v1 (copy)
    v17:_send({
        eventName = v1.RoactInspector.GetFields, 
        path = v18, 
        nodeIndex = v19, 
        fieldPath = v20
    });
end;
v3.setPicking = function(v21, v22) --[[ Line: 84 ]] --[[ Name: setPicking ]]
    -- upvalues: v1 (copy)
    v21:_send({
        eventName = v1.RoactInspector.SetPicking, 
        isPicking = v22
    });
end;
v3.openPath = function(v23, v24) --[[ Line: 91 ]] --[[ Name: openPath ]]
    -- upvalues: v1 (copy)
    v23:_send({
        eventName = v1.RoactInspector.OpenPath, 
        path = v24
    });
end;
v3.setProfiling = function(v25, v26) --[[ Line: 98 ]] --[[ Name: setProfiling ]]
    -- upvalues: v1 (copy)
    if v26 then
        local v27 = nil;
        do
            local l_v27_0 = v27;
            l_v27_0 = coroutine.wrap(function() --[[ Line: 101 ]]
                -- upvalues: l_v27_0 (ref), v25 (copy)
                while l_v27_0 == v25.profileThread do
                    v25:getProfileData();
                    wait(0.5);
                end;
            end);
            v25.profileThread = l_v27_0;
            l_v27_0();
        end;
    else
        v25.profileThread = nil;
    end;
    v25:_send({
        eventName = v1.RoactInspector.SetProfiling, 
        isProfiling = v26
    });
end;
v3.clearProfileData = function(v29) --[[ Line: 118 ]] --[[ Name: clearProfileData ]]
    -- upvalues: v1 (copy)
    v29:_send({
        eventName = v1.RoactInspector.ClearProfileData
    });
end;
v3.sortProfileData = function(v30, v31, v32, v33) --[[ Line: 124 ]] --[[ Name: sortProfileData ]]
    -- upvalues: v1 (copy)
    v30:_send({
        eventName = v1.RoactInspector.SortProfileData, 
        tableName = v31, 
        index = v32, 
        order = v33
    });
end;
v3.selectProfileInstance = function(v34, v35) --[[ Line: 133 ]] --[[ Name: selectProfileInstance ]]
    -- upvalues: v1 (copy)
    v34:_send({
        eventName = v1.RoactInspector.SelectProfileInstance, 
        instanceId = v35
    });
end;
v3.setProfileFilter = function(v36, v37) --[[ Line: 140 ]] --[[ Name: setProfileFilter ]]
    -- upvalues: v1 (copy)
    v36:_send({
        eventName = v1.RoactInspector.SetProfileFilter, 
        filter = v37
    });
end;
v3.setProfileSearchTerm = function(v38, v39) --[[ Line: 147 ]] --[[ Name: setProfileSearchTerm ]]
    -- upvalues: v1 (copy)
    v38:_send({
        eventName = v1.RoactInspector.SetProfileSearchTerm, 
        searchTerm = v39
    });
end;
v3.setProfileComponentsPageIndex = function(v40, v41) --[[ Line: 154 ]] --[[ Name: setProfileComponentsPageIndex ]]
    v40.profileComponentsPageIndex = v41;
end;
v3.setProfileComponentsPageSize = function(v42, v43) --[[ Line: 158 ]] --[[ Name: setProfileComponentsPageSize ]]
    v42.profileComponentsPageSize = v43;
end;
v3.setProfileEventsPageIndex = function(v44, v45) --[[ Line: 162 ]] --[[ Name: setProfileEventsPageIndex ]]
    v44.profileEventsPageIndex = v45;
end;
v3.setProfileEventsPageSize = function(v46, v47) --[[ Line: 166 ]] --[[ Name: setProfileEventsPageSize ]]
    v46.profileEventsPageSize = v47;
end;
v3.getProfileData = function(v48) --[[ Line: 170 ]] --[[ Name: getProfileData ]]
    -- upvalues: v1 (copy)
    local v49 = (v48.profileComponentsPageIndex - 1) * v48.profileComponentsPageSize + 1;
    local v50 = v49 + v48.profileComponentsPageSize - 1;
    local v51 = (v48.profileEventsPageIndex - 1) * v48.profileEventsPageSize + 1;
    local v52 = v51 + v48.profileEventsPageSize - 1;
    v48:_send({
        eventName = v1.RoactInspector.GetProfileData, 
        componentSliceStart = v49, 
        componentSliceEnd = v50, 
        eventSliceStart = v51, 
        eventSliceEnd = v52
    });
end;
v3.highlight = function(v53, v54) --[[ Line: 184 ]] --[[ Name: highlight ]]
    -- upvalues: v1 (copy)
    v53:_send({
        eventName = v1.RoactInspector.Highlight, 
        path = v54
    });
end;
v3.dehighlight = function(v55) --[[ Line: 191 ]] --[[ Name: dehighlight ]]
    -- upvalues: v1 (copy)
    v55:_send({
        eventName = v1.RoactInspector.Dehighlight
    });
end;
return v3;