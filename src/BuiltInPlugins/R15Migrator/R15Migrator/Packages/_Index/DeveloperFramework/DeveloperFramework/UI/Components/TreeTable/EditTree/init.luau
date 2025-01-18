local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_append_0 = v1.append;
local l_copy_0 = v1.copy;
local l_forEach_0 = v1.forEach;
local l_join_0 = v1.join;
local l_reduce_0 = v1.reduce;
local l_slice_0 = v1.slice;
local l_insert_0 = table.insert;
local l_remove_0 = table.remove;
local v12 = {
    getChildren = function(v10) --[[ Line: 99 ]] --[[ Name: getChildren ]]
        return v10.Children or {};
    end, 
    getId = function(v11) --[[ Line: 102 ]] --[[ Name: getId ]]
        return v11;
    end
};
local v13 = {};
v13.__index = v13;
v13.new = function(v14) --[[ Line: 110 ]] --[[ Name: new ]]
    -- upvalues: l_join_0 (copy), v12 (copy), v13 (copy)
    return (setmetatable({
        _interface = l_join_0(v12, v14)
    }, v13));
end;
v13.getParent = function(v15, v16, v17) --[[ Line: 118 ]] --[[ Name: getParent ]]
    -- upvalues: l_slice_0 (copy)
    return v15:getChild(v16, l_slice_0(v17.Path, 1, -1));
end;
v13.getChild = function(_, v19, v20) --[[ Line: 123 ]] --[[ Name: getChild ]]
    -- upvalues: l_reduce_0 (copy)
    return l_reduce_0(v20, function(v21, v22) --[[ Line: 124 ]]
        if v21 and v21.Children then
            return v21.Children[v22];
        else
            return nil;
        end;
    end, {
        Children = v19
    });
end;
v13.insertRow = function(v23, v24, v25, v26, v27) --[[ Line: 133 ]] --[[ Name: insertRow ]]
    -- upvalues: l_insert_0 (copy)
    return v23:modifyChildren(v24, v25, function(v28) --[[ Line: 134 ]]
        -- upvalues: v27 (copy), v26 (copy), l_insert_0 (ref), v23 (copy), v25 (copy)
        l_insert_0(v28, if v27 then v27 else #v28 + 1, v26);
        v23:updatePaths(v28, v25);
    end);
end;
v13.removeItem = function(v29, v30, v31) --[[ Line: 140 ]] --[[ Name: removeItem ]]
    -- upvalues: l_copy_0 (copy), l_remove_0 (copy)
    local v32 = l_copy_0(v31);
    local v33 = l_remove_0(v32);
    return v29:modifyChildren(v30, v32, function(v34, v35) --[[ Line: 144 ]]
        -- upvalues: v33 (copy), v29 (copy), l_remove_0 (ref), v32 (copy)
        assert(typeof(v33) == "number", "expected last entry in path array to be number");
        local v36 = v34[v33];
        local v37 = v29._interface.getChildren(v36);
        v35.Expansion[v37] = nil;
        v35.Selection[v37] = nil;
        l_remove_0(v34, v33);
        v29:updatePaths(v34, v32);
    end);
end;
v13.togglePath = function(v38, v39, v40, v41) --[[ Line: 155 ]] --[[ Name: togglePath ]]
    -- upvalues: l_copy_0 (copy), l_join_0 (copy)
    local v42 = v38:getChild(v39.Items, v40);
    assert(v42 ~= nil, "expecting item to exist at given path");
    local v43 = v38._interface.getId(v42);
    local v44 = l_copy_0(v39.Expansion);
    v44[v43] = if v41 == nil then not v44[v43] else v41;
    return l_join_0(v39, {
        Expansion = v44
    });
end;
v13.updateCell = function(v45, v46, v47, v48, v49) --[[ Line: 167 ]] --[[ Name: updateCell ]]
    -- upvalues: l_copy_0 (copy), l_remove_0 (copy), l_join_0 (copy)
    local v50 = l_copy_0(v48);
    local v51 = l_remove_0(v50);
    local l_Key_0 = v46.Columns[v49].Key;
    return v45:modifyChildren(v46, v50, function(v53, v54) --[[ Line: 171 ]]
        -- upvalues: v51 (copy), l_copy_0 (ref), v45 (copy), l_join_0 (ref), l_Key_0 (copy), v47 (copy)
        assert(typeof(v51) == "number", "expected last entry in path array to be number");
        local v55 = v53[v51];
        if not v55 then
            return;
        else
            local v56 = l_copy_0(v55);
            v45:migrateItemState(v54, v55, v56);
            v53[v51] = v56;
            local v57 = l_join_0(v56[l_Key_0], v47);
            v56[l_Key_0] = v57;
            return;
        end;
    end);
end;
v13.migrateItemState = function(v58, v59, v60, v61) --[[ Line: 185 ]] --[[ Name: migrateItemState ]]
    local v62 = v58._interface.getId(v60);
    local v63 = v58._interface.getId(v61);
    if v59.Expansion[v62] ~= nil then
        v59.Expansion[v63] = v59.Expansion[v62];
        v59.Expansion[v62] = nil;
    end;
    if v59.Selection[v62] ~= nil then
        v59.Selection[v63] = v59.Selection[v62];
        v59.Selection[v62] = nil;
    end;
end;
v13.modifyChildren = function(v64, v65, v66, v67) --[[ Line: 199 ]] --[[ Name: modifyChildren ]]
    -- upvalues: l_copy_0 (copy), l_join_0 (copy), l_forEach_0 (copy)
    local v68 = l_copy_0(v65.Expansion);
    local v69 = l_copy_0(v65.Selection);
    local v70 = l_join_0(v65, {
        Items = v65.Items, 
        Expansion = v68, 
        Selection = v69
    });
    if #v66 == 0 then
        v70.Items = l_copy_0(v70.Items);
        v67(v70.Items, v70, v66);
        return v70;
    else
        local v71 = {
            Children = v70.Items
        };
        local l_v71_0 = v71;
        l_forEach_0(v66, function(v73) --[[ Line: 218 ]]
            -- upvalues: l_v71_0 (ref), l_copy_0 (ref), v64 (copy), v70 (copy)
            if l_v71_0 == nil or l_v71_0.Children == nil then
                return;
            else
                local v74 = false;
                if l_v71_0 ~= nil then
                    v74 = l_v71_0.Children ~= nil;
                end;
                assert(v74, "expecting item and children to be valid");
                local v75 = l_v71_0.Children[v73];
                if v75 then
                    v74 = l_copy_0(v75);
                    v64:migrateItemState(v70, v75, v74);
                    l_v71_0.Children[v73] = v74;
                    l_v71_0 = v74;
                    return;
                else
                    l_v71_0 = nil;
                    return;
                end;
            end;
        end);
        if l_v71_0 then
            l_v71_0.Children = l_copy_0(l_v71_0.Children or {});
            v67(l_v71_0.Children, v70, v66);
        end;
        v70.Items = v71.Children;
        return v70;
    end;
end;
v13.updatePaths = function(v76, v77, v78) --[[ Line: 243 ]] --[[ Name: updatePaths ]]
    -- upvalues: l_forEach_0 (copy), l_append_0 (copy)
    v78 = v78 or {};
    l_forEach_0(v77, function(v79, v80) --[[ Line: 245 ]]
        -- upvalues: l_append_0 (ref), v78 (ref), v76 (copy)
        local v81 = l_append_0({}, v78, {
            v80
        });
        v79.Path = v81;
        if v79.Children then
            v76:updatePaths(v79.Children, v81);
        end;
    end);
    return v77;
end;
v13.getStateAdaptor = function(_, v83, v84) --[[ Line: 258 ]] --[[ Name: getStateAdaptor ]]
    -- upvalues: l_join_0 (copy)
    return function(v85) --[[ Line: 259 ]]
        -- upvalues: v83 (copy), v84 (copy), l_join_0 (ref)
        v83:setState(function(v86) --[[ Line: 260 ]]
            -- upvalues: v84 (ref), l_join_0 (ref), v85 (copy)
            return {
                [v84] = l_join_0(v86[v84], v85(v86[v84]))
            };
        end);
    end;
end;
v13.getCallbacks = function(_, v88) --[[ Line: 268 ]] --[[ Name: getCallbacks ]]
    -- upvalues: l_join_0 (copy)
    return {
        OnExpansionChange = function(v89) --[[ Line: 270 ]] --[[ Name: OnExpansionChange ]]
            -- upvalues: v88 (copy), l_join_0 (ref)
            v88(function(v90) --[[ Line: 271 ]]
                -- upvalues: l_join_0 (ref), v89 (copy)
                return {
                    Expansion = l_join_0(v90.Expansion, v89)
                };
            end);
        end, 
        OnSelectionChange = function(v91) --[[ Line: 277 ]] --[[ Name: OnSelectionChange ]]
            -- upvalues: v88 (copy)
            v88(function() --[[ Line: 278 ]]
                -- upvalues: v91 (copy)
                return {
                    Selection = v91
                };
            end);
        end, 
        OnColumnSizesChange = function(v92) --[[ Line: 284 ]] --[[ Name: OnColumnSizesChange ]]
            -- upvalues: v88 (copy)
            v88(function() --[[ Line: 285 ]]
                -- upvalues: v92 (copy)
                return {
                    Sizes = v92
                };
            end);
        end
    };
end;
v13.findItemById = function(v93, v94, v95) --[[ Line: 294 ]] --[[ Name: findItemById ]]
    for _, v97 in v94 do
        if v93._interface.getId(v97) == v95 then
            return v97;
        else
            local v98 = v93._interface.getChildren(v97);
            if v98 then
                local v99 = v93:findItemById(v98, v95);
                if v99 then
                    return v99;
                end;
            end;
        end;
    end;
    return nil;
end;
v13.expandAll = function(v100, v101, v102) --[[ Line: 312 ]] --[[ Name: expandAll ]]
    if v101 then
        for _, v104 in v101 do
            v102[v100._interface.getId(v104)] = true;
            v100:expandAll(v104.Children, v102);
        end;
    end;
end;
v13.expandAncestors = function(v105, v106, v107) --[[ Line: 322 ]] --[[ Name: expandAncestors ]]
    if not v107 or #v107 <= 0 then
        return {};
    else
        local v108 = {};
        local v109 = {
            Children = v106
        };
        local l_v109_0 = v109;
        for _, v112 in v107 do
            local v113 = v105._interface.getId(l_v109_0);
            if l_v109_0 ~= v109 then
                v108[v113] = true;
            end;
            if l_v109_0.Children then
                local v114 = false;
                if l_v109_0 ~= nil then
                    v114 = l_v109_0.Children ~= nil;
                end;
                assert(v114, "expecting item and children to be valid");
                l_v109_0 = l_v109_0.Children[v112];
            else
                break;
            end;
        end;
        return v108;
    end;
end;
return v13;