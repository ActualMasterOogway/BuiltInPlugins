local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Dash);
local l_collectSet_0 = v2.collectSet;
local l_forEach_0 = v2.forEach;
local l_pick_0 = v2.pick;
local l_join_0 = v2.join;
local l_joinDeep_0 = v2.joinDeep;
local l_keys_0 = v2.keys;
local l_find_0 = v2.find;
local l_shallowEqual_0 = v2.shallowEqual;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v12 = require(l_Actions_0.RoactInspector.UpdateInstances);
local v13 = require(l_Actions_0.RoactInspector.SelectInstance);
local v14 = require(l_Actions_0.RoactInspector.ToggleInstance);
local v15 = require(l_Actions_0.RoactInspector.SelectNode);
local v16 = require(l_Actions_0.RoactInspector.PickInstance);
local v17 = require(l_Actions_0.RoactInspector.UpdateBranch);
local v18 = require(l_Actions_0.RoactInspector.UpdateFields);
local v19 = require(l_Actions_0.RoactInspector.Reset);
local v20 = require(l_Actions_0.RoactInspector.SelectField);
local v21 = require(l_Actions_0.RoactInspector.ToggleField);
local v22 = require(l_Actions_0.RoactInspector.SetPicking);
local v23 = require(l_Actions_0.RoactInspector.SetProfiling);
local v24 = require(l_Actions_0.RoactInspector.ClearProfileData);
local v25 = require(l_Actions_0.RoactInspector.SortProfileData);
local v26 = require(l_Actions_0.RoactInspector.UpdateProfileData);
local v27 = require(l_Actions_0.RoactInspector.SetProfilePageIndex);
local v28 = require(l_Actions_0.RoactInspector.SetProfileFilter);
local v29 = require(l_Actions_0.RoactInspector.SetProfileSearchTerm);
local v30 = require(l_Actions_0.RoactInspector.SetProfilePageSize);
local v31 = require(l_Actions_0.RoactInspector.SelectProfileRow);
local v32 = require(l_Parent_0.Src.Util.updateTree);
local function v33() --[[ Line: 44 ]] --[[ Name: getFields ]]
    return {
        Children = {
            props = {
                Name = "props", 
                Path = {
                    "props"
                }, 
                Children = {}
            }, 
            state = {
                Name = "state", 
                Path = {
                    "state"
                }, 
                Children = {}
            }, 
            _context = {
                Name = "_context", 
                Path = {
                    "_context"
                }, 
                Children = {}
            }
        }
    };
end;
local function v34() --[[ Line: 66 ]] --[[ Name: getDefaultState ]]
    -- upvalues: v33 (copy)
    return {
        rootInstance = {}, 
        flashInstances = {}, 
        selectedInstances = {}, 
        expandedInstances = {}, 
        nodes = {}, 
        selectedPath = {}, 
        selectedNodeIndex = 0, 
        fields = v33(), 
        selectedFields = {}, 
        expandedFields = {}, 
        isPicking = false, 
        profileData = {
            eventCount = 0, 
            instanceEventCount = 0, 
            rowCount = 0, 
            cached = false
        }, 
        profileSearchTerm = "", 
        profileFilter = {}, 
        profileComponents = {
            pageRows = {}, 
            sortIndex = nil, 
            sortOrder = nil, 
            pageSize = 1, 
            pageIndex = 1, 
            selectedRow = nil
        }, 
        profileEvents = {
            pageRows = {}, 
            sortIndex = nil, 
            sortOrder = nil, 
            pageSize = 1, 
            pageIndex = 1
        }
    };
end;
local function v37(v35, v36) --[[ Line: 112 ]] --[[ Name: updateStateAndInvalidateProfileData ]]
    -- upvalues: l_join_0 (copy)
    return l_join_0(v35, v36, {
        profileData = l_join_0(v35.profileData, {
            cached = false
        })
    });
end;
return v1.createReducer(v34(), {
    [v19.name] = function(_, _) --[[ Line: 121 ]]
        -- upvalues: v34 (copy)
        return (v34());
    end, 
    [v17.name] = function(v40, v41) --[[ Line: 124 ]]
        -- upvalues: l_shallowEqual_0 (copy), l_join_0 (copy)
        if l_shallowEqual_0(v41.path, v40.selectedPath) then
            return l_join_0(v40, {
                nodes = v41.branch
            });
        else
            return v40;
        end;
    end, 
    [v15.name] = function(v42, v43) --[[ Line: 133 ]]
        -- upvalues: l_join_0 (copy), v33 (copy)
        return l_join_0(v42, {
            selectedNodeIndex = v43.nodeIndex, 
            fields = v33(), 
            selectedFields = {}, 
            expandedFields = {}
        });
    end, 
    [v12.name] = function(v44, v45) --[[ Line: 141 ]]
        -- upvalues: l_pick_0 (copy), l_find_0 (copy), l_shallowEqual_0 (copy), l_collectSet_0 (copy), v32 (copy), l_join_0 (copy)
        local v48 = l_pick_0(v44.flashInstances, function(v46, _) --[[ Line: 142 ]]
            return v46.time > os.clock() - 1;
        end);
        if v45.updatedIndexes and #v45.updatedIndexes > 0 then
            local v51 = l_find_0(v48, function(_, v50) --[[ Line: 149 ]]
                -- upvalues: l_shallowEqual_0 (ref), v45 (copy)
                return l_shallowEqual_0(v50, v45.path);
            end);
            local v52 = l_collectSet_0(v45.updatedIndexes);
            if v51 then
                v51.heat = v51.heat + 1;
                v51.time = os.clock();
                v51.indexSet = v52;
            else
                v48[v45.path] = {
                    time = os.clock(), 
                    heat = 0, 
                    indexSet = v52
                };
            end;
        end;
        local v53 = v32({
            root = v44.rootInstance, 
            selected = v44.selectedInstances, 
            expanded = v44.expandedInstances, 
            children = v45.children, 
            path = v45.path
        });
        return l_join_0(v44, {
            rootInstance = v53.root, 
            selectedInstances = v53.selected, 
            expandedInstances = v53.expanded, 
            flashInstances = v48
        });
    end, 
    [v13.name] = function(v54, v55) --[[ Line: 180 ]]
        -- upvalues: l_keys_0 (copy), l_join_0 (copy), v33 (copy)
        local v56 = l_keys_0(v55.change)[1];
        return l_join_0(v54, {
            fields = v33(), 
            expandedFields = {}, 
            selectedFields = {}, 
            selectedInstances = v55.change, 
            selectedPath = v56 and v56.Path, 
            nodes = {}, 
            selectedNodeIndex = 0
        });
    end, 
    [v14.name] = function(v57, v58) --[[ Line: 192 ]]
        -- upvalues: l_joinDeep_0 (copy)
        return l_joinDeep_0(v57, {
            expandedInstances = v58.change
        });
    end, 
    [v16.name] = function(v59, v60) --[[ Line: 197 ]]
        -- upvalues: l_forEach_0 (copy), l_join_0 (copy)
        local v61 = {};
        local l_rootInstance_0 = v59.rootInstance;
        l_forEach_0(v60.path, function(v63) --[[ Line: 201 ]]
            -- upvalues: l_rootInstance_0 (ref), v61 (copy)
            if l_rootInstance_0 then
                l_rootInstance_0 = l_rootInstance_0.Children and l_rootInstance_0.Children[v63];
                if l_rootInstance_0 then
                    v61[l_rootInstance_0] = true;
                end;
            end;
        end);
        local v64 = {};
        if l_rootInstance_0 then
            v64[l_rootInstance_0] = true;
        end;
        return l_join_0(v59, {
            selectedPath = v60.path, 
            selectedInstances = v64, 
            expandedInstances = l_join_0(v59.expandedInstances, v61), 
            isPicking = false
        });
    end, 
    [v18.name] = function(v65, v66) --[[ Line: 221 ]]
        -- upvalues: l_shallowEqual_0 (copy), v32 (copy), l_join_0 (copy)
        if not (l_shallowEqual_0(v66.path, v65.selectedPath) and v66.nodeIndex == v65.selectedNodeIndex) then
            return v65;
        else
            local v67 = v32({
                root = v65.fields, 
                selected = v65.selectedFields, 
                expanded = v65.expandedFields, 
                children = v66.fields, 
                path = v66.fieldPath
            });
            return l_join_0(v65, {
                fields = v67.root, 
                selectedFields = v67.selected, 
                expandedFields = v67.expanded
            });
        end;
    end, 
    [v20.name] = function(v68, v69) --[[ Line: 239 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v68, {
            selectedFields = v69.change
        });
    end, 
    [v21.name] = function(v70, v71) --[[ Line: 244 ]]
        -- upvalues: l_joinDeep_0 (copy)
        return l_joinDeep_0(v70, {
            expandedFields = v71.change
        });
    end, 
    [v22.name] = function(v72, v73) --[[ Line: 249 ]]
        -- upvalues: l_joinDeep_0 (copy)
        return l_joinDeep_0(v72, {
            isPicking = v73.isPicking
        });
    end, 
    [v23.name] = function(v74, v75) --[[ Line: 254 ]]
        -- upvalues: l_joinDeep_0 (copy)
        return l_joinDeep_0(v74, {
            isProfiling = v75.isProfiling
        });
    end, 
    [v24.name] = function(v76) --[[ Line: 259 ]]
        -- upvalues: v34 (copy), l_join_0 (copy)
        local v77 = v34();
        return l_join_0(v76, {
            profileData = v77.profileData, 
            profileComponents = v77.profileComponents, 
            profileEvents = v77.profileEvents
        });
    end, 
    [v26.name] = function(v78, v79) --[[ Line: 267 ]]
        -- upvalues: l_join_0 (copy)
        if v78.profileData.cached and v79.data.eventCount == v78.profileData.eventCount then
            return v78;
        else
            local v80 = l_join_0(v78.profileData, {
                eventCount = v79.data.eventCount, 
                rowCount = v79.data.rowCount, 
                instanceEventCount = v79.data.instanceEventCount, 
                cached = true
            });
            return l_join_0(v78, {
                profileData = v80, 
                profileComponents = l_join_0(v78.profileComponents, {
                    rowCount = v79.data.rowCount, 
                    pageRows = v79.data.componentRows
                }), 
                profileEvents = l_join_0(v78.profileEvents, {
                    pageRows = v79.data.eventRows
                })
            });
        end;
    end, 
    [v25.name] = function(v81, v82) --[[ Line: 288 ]]
        -- upvalues: l_join_0 (copy), v37 (copy)
        local v83 = l_join_0(v81[v82.tableName], {
            sortIndex = v82.sortIndex, 
            sortOrder = v82.sortOrder
        });
        return v37(v81, {
            [v82.tableName] = v83
        });
    end, 
    [v27.name] = function(v84, v85) --[[ Line: 297 ]]
        -- upvalues: l_join_0 (copy), v37 (copy)
        local v86 = l_join_0(v84[v85.tableName], {
            pageIndex = v85.pageIndex
        });
        return v37(v84, {
            [v85.tableName] = v86
        });
    end, 
    [v30.name] = function(v87, v88) --[[ Line: 305 ]]
        -- upvalues: l_join_0 (copy), v37 (copy)
        local v89 = l_join_0(v87[v88.tableName], {
            pageSize = v88.pageSize
        });
        return v37(v87, {
            [v88.tableName] = v89
        });
    end, 
    [v31.name] = function(v90, v91) --[[ Line: 313 ]]
        -- upvalues: v37 (copy), l_join_0 (copy)
        return v37(v90, {
            profileEvents = l_join_0(v90.profileEvents, {
                pageIndex = 1
            }), 
            profileComponents = l_join_0(v90.profileComponents, {
                selectedRow = v91.selectedRow
            })
        });
    end, 
    [v29.name] = function(v92, v93) --[[ Line: 323 ]]
        -- upvalues: v37 (copy)
        return v37(v92, {
            profileSearchTerm = v93.searchTerm
        });
    end, 
    [v28.name] = function(v94, v95) --[[ Line: 328 ]]
        -- upvalues: v37 (copy)
        return v37(v94, {
            profileFilter = v95.filter
        });
    end, 
    [v31.name] = function(v96, v97) --[[ Line: 333 ]]
        -- upvalues: v37 (copy), l_join_0 (copy)
        return v37(v96, {
            profileEvents = l_join_0(v96.profileEvents, {
                pageIndex = 1
            }), 
            profileComponents = l_join_0(v96.profileComponents, {
                selectedRow = v97.selectedRow
            })
        });
    end
});