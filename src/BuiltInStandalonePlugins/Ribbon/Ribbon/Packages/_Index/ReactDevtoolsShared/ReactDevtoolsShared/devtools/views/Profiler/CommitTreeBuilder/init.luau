local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Map_0 = v1.Map;
local l_console_0 = v1.console;
local v5 = {};
local v6 = require(script.Parent.Parent.Parent.Parent.constants);
local l___DEBUG___0 = v6.__DEBUG__;
local l_TREE_OPERATION_ADD_0 = v6.TREE_OPERATION_ADD;
local l_TREE_OPERATION_REMOVE_0 = v6.TREE_OPERATION_REMOVE;
local l_TREE_OPERATION_REORDER_CHILDREN_0 = v6.TREE_OPERATION_REORDER_CHILDREN;
local l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 = v6.TREE_OPERATION_UPDATE_TREE_BASE_DURATION;
local _ = require(script.Parent.Parent.Parent.types);
local l_ElementTypeRoot_0 = require(script.Parent.Parent.Parent.Parent.types).ElementTypeRoot;
local _ = require(script.Parent.Parent.Parent.Parent.types);
local _ = require(script.Parent.types);
local function v17(v16, ...) --[[ Line: 49 ]] --[[ Name: debug_ ]]
    -- upvalues: l___DEBUG___0 (copy)
    if l___DEBUG___0 then
        print("[CommitTreeBuilder]", v16, ...);
    end;
end;
local function v26(v18) --[[ Line: 55 ]] --[[ Name: __printTree ]]
    -- upvalues: l___DEBUG___0 (copy), l_console_0 (copy), l_Array_0 (copy)
    if l___DEBUG___0 then
        local l_nodes_0 = v18.nodes;
        local l_rootID_0 = v18.rootID;
        l_console_0.group("__printTree()");
        local v21 = {
            l_rootID_0, 
            0
        };
        while #v21 > 0 do
            local v22 = table.remove(v21, 1);
            local v23 = table.remove(v21, 1);
            local v24 = l_nodes_0:get(v22);
            if v24 == nil then
                error(string.format("Could not find node with id \"%s\" in commit tree", (tostring(v22))));
            end;
            l_console_0.log(string.format("%s%s:%s %s (%s)", string.rep("\226\128\162", v23), tostring(v24.id), tostring(v24.displayName or ""), if v24.key then string.format("key:\"%s\"", (tostring(v24.key))) else "", (tostring(v24.treeBaseDuration))));
            l_Array_0.forEach(v24.children, function(v25) --[[ Line: 89 ]]
                -- upvalues: l_Array_0 (ref), v21 (copy), v23 (copy)
                l_Array_0.concat(v21, {
                    v25, 
                    v23 + 1
                });
            end);
        end;
        l_console_0.groupEnd();
    end;
end;
local function v62(v27, v28) --[[ Line: 97 ]] --[[ Name: updateTree ]]
    -- upvalues: l_Map_0 (copy), l_TREE_OPERATION_ADD_0 (copy), l_ElementTypeRoot_0 (copy), l___DEBUG___0 (copy), v17 (copy), l_Array_0 (copy), l_TREE_OPERATION_REMOVE_0 (copy), l_TREE_OPERATION_REORDER_CHILDREN_0 (copy), l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 (copy)
    local v29 = l_Map_0.new(v27.nodes);
    local function _(v30) --[[ Line: 102 ]] --[[ Name: getClonedNode ]]
        -- upvalues: v29 (copy)
        local v31 = table.clone((v29:get(v30)));
        v29:set(v30, v31);
        return v31;
    end;
    local v33 = 3;
    local function _() --[[ Line: 109 ]] --[[ Name: POSTFIX_INCREMENT ]]
        -- upvalues: v33 (ref)
        local l_v33_0 = v33;
        v33 = v33 + 1;
        return l_v33_0;
    end;
    local v36 = nil;
    local v37 = {
        ""
    };
    local l_v33_1 = v33;
    v33 = v33 + 1;
    local v39 = v33 + v28[l_v33_1];
    while v33 < v39 do
        local l_v33_2 = v33;
        v33 = v33 + 1;
        table.insert(v37, v28[l_v33_2]);
    end;
    while #v28 >= v33 do
        local l_v33_3 = v33;
        v33 = v33 + 1;
        l_v33_1 = v28[l_v33_3];
        if l_v33_1 == l_TREE_OPERATION_ADD_0 then
            l_v33_3 = v33;
            v33 = v33 + 1;
            v36 = v28[l_v33_3];
            local l_v33_4 = v33;
            v33 = v33 + 1;
            local v43 = v28[l_v33_4];
            if v29:has(v36) then
                error("Commit tree already contains fiber " .. tostring(v36) .. ". This is a bug in React DevTools.");
            end;
            if v43 == l_ElementTypeRoot_0 then
                v33 = v33 + 2;
                if l___DEBUG___0 then
                    v17("Add", ("new root fiber %s"):format((tostring(v36))));
                end;
                l_v33_3 = {
                    children = {}, 
                    displayName = nil, 
                    hocDisplayNames = nil, 
                    id = v36, 
                    key = nil, 
                    parentID = 0, 
                    treeBaseDuration = 0, 
                    type = v43
                };
                v29:set(v36, l_v33_3);
            else
                local l_v33_5 = v33;
                v33 = v33 + 1;
                l_v33_3 = v28[l_v33_5];
                v33 = v33 + 1;
                local l_v33_6 = v33;
                v33 = v33 + 1;
                l_v33_5 = v37[v28[l_v33_6] + 1];
                local l_v33_7 = v33;
                v33 = v33 + 1;
                local v47 = v37[v28[l_v33_7] + 1];
                if l___DEBUG___0 then
                    v17("Add", ("fiber %s (%s) as child of %s"):format(tostring(v36), tostring(l_v33_5 or "null"), (tostring(l_v33_3))));
                end;
                local v48 = table.clone((v29:get(l_v33_3)));
                v29:set(l_v33_3, v48);
                l_v33_7 = v48;
                l_v33_7.children = l_Array_0.concat(l_v33_7.children, v36);
                v48 = {
                    children = {}, 
                    displayName = l_v33_5, 
                    hocDisplayNames = nil, 
                    id = v36, 
                    key = v47, 
                    parentID = l_v33_3, 
                    treeBaseDuration = 0, 
                    type = v43
                };
                v29:set(v36, v48);
            end;
        elseif l_v33_1 == l_TREE_OPERATION_REMOVE_0 then
            local l_v33_8 = v33;
            v33 = v33 + 1;
            for _ = 1, v28[l_v33_8] do
                local l_v33_9 = v33;
                v33 = v33 + 1;
                v36 = v28[l_v33_9];
                if not v29:has(v36) then
                    error("Commit tree does not contain fiber " .. tostring(v36) .. ". This is a bug in React DevTools.");
                end;
                l_v33_9 = v36;
                local v52 = table.clone((v29:get(l_v33_9)));
                v29:set(l_v33_9, v52);
                l_v33_9 = v52.parentID;
                v29:delete(v36);
                if v29:has(l_v33_9) then
                    local v53 = table.clone((v29:get(l_v33_9)));
                    v29:set(l_v33_9, v53);
                    v52 = v53;
                    if l___DEBUG___0 then
                        v17("Remove", ("fiber %s from parent %s"):format(tostring(v36), (tostring(l_v33_9))));
                    end;
                    v52.children = l_Array_0.filter(v52.children, function(v54) --[[ Line: 226 ]]
                        -- upvalues: v36 (ref)
                        return v54 ~= v36;
                    end);
                end;
            end;
        elseif l_v33_1 == l_TREE_OPERATION_REORDER_CHILDREN_0 then
            l_v33_3 = v33;
            v33 = v33 + 1;
            v36 = v28[l_v33_3];
            local l_v33_10 = v33;
            v33 = v33 + 1;
            local v56 = v28[l_v33_10];
            l_v33_3 = l_Array_0.slice(v28, v33, v33 + v56);
            v33 = v33 + v56;
            if l___DEBUG___0 then
                v17("Re-order", ("fiber %s children %s"):format(tostring(v36), (tostring(l_Array_0.join(l_v33_3, ",")))));
            end;
            local l_v36_0 = v36;
            local v58 = table.clone((v29:get(l_v36_0)));
            v29:set(l_v36_0, v58);
            v58.children = l_Array_0.from(l_v33_3);
        elseif l_v33_1 == l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 then
            l_v33_3 = v33;
            v33 = v33 + 1;
            v36 = v28[l_v33_3];
            l_v33_3 = v36;
            local v59 = table.clone((v29:get(l_v33_3)));
            v29:set(l_v33_3, v59);
            local l_v59_0 = v59;
            local l_v33_11 = v33;
            v33 = v33 + 1;
            l_v59_0.treeBaseDuration = v28[l_v33_11] / 1000;
            if l___DEBUG___0 then
                v17("Update", ("fiber %s treeBaseDuration to %s"):format(tostring(v36), (tostring(l_v59_0.treeBaseDuration))));
            end;
        else
            error(string.format("Unsupported Bridge operation %s at operation index %d", tostring(l_v33_1), v33));
        end;
    end;
    return {
        nodes = v29, 
        rootID = v27.rootID
    };
end;
local function v63(v64, v65, v66, v67) --[[ Line: 277 ]] --[[ Name: recursivelyInitializeTree ]]
    -- upvalues: v63 (copy)
    local v68 = v67.snapshots:get(v64);
    if v68 ~= nil then
        v66:set(v64, {
            id = v64, 
            children = v68.children, 
            displayName = v68.displayName, 
            hocDisplayNames = v68.hocDisplayNames, 
            key = v68.key, 
            parentID = v65, 
            treeBaseDuration = v67.initialTreeBaseDurations:get(v64), 
            type = v68.type
        });
        for _, v70 in v68.children do
            v63(v70, v64, v66, v67);
        end;
    end;
end;
local v71 = l_Map_0.new();
local function v72(v73) --[[ Line: 304 ]] --[[ Name: getCommitTree ]]
    -- upvalues: v71 (copy), l_Map_0 (copy), v63 (copy), v62 (copy), l___DEBUG___0 (copy), v26 (copy), v72 (copy)
    local l_commitIndex_0 = v73.commitIndex;
    local l_profilerStore_0 = v73.profilerStore;
    local l_rootID_1 = v73.rootID;
    if not v71:has(l_rootID_1) then
        v71:set(l_rootID_1, {});
    end;
    local v77 = v71:get(l_rootID_1);
    if l_commitIndex_0 <= #v77 then
        return v77[l_commitIndex_0];
    else
        local v78 = l_profilerStore_0:profilingData();
        if v78 == nil then
            error("No profiling data available");
        end;
        local v79 = v78.dataForRoots:get(l_rootID_1);
        if v79 == nil then
            error(string.format("Could not find profiling data for root \"%s\"", (tostring(l_rootID_1))));
        end;
        local l_operations_0 = v79.operations;
        if l_commitIndex_0 == 1 then
            local v81 = l_Map_0.new();
            v63(l_rootID_1, 0, v81, v79);
            if l_operations_0 ~= nil and l_commitIndex_0 <= #l_operations_0 then
                local v82 = v62({
                    nodes = v81, 
                    rootID = l_rootID_1
                }, l_operations_0[l_commitIndex_0]);
                if l___DEBUG___0 then
                    v26(v82);
                end;
                table.insert(v77, v82);
                return v82;
            end;
        else
            local v83 = v72({
                commitIndex = l_commitIndex_0 - 1, 
                profilerStore = l_profilerStore_0, 
                rootID = l_rootID_1
            });
            if l_operations_0 ~= nil and l_commitIndex_0 <= #l_operations_0 then
                local v84 = v62(v83, l_operations_0[l_commitIndex_0]);
                if l___DEBUG___0 then
                    v26(v84);
                end;
                table.insert(v77, v84);
                return v84;
            end;
        end;
        error(string.format("getCommitTree(): Unable to reconstruct tree for root \"%s\" and commit %s", tostring(l_rootID_1), (tostring(l_commitIndex_0))));
        return;
    end;
end;
v5.getCommitTree = v72;
v5.invalidateCommitTrees = function() --[[ Line: 375 ]] --[[ Name: invalidateCommitTrees ]]
    -- upvalues: v71 (copy)
    return v71:clear();
end;
return v5;