local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.ExplorerNodeChildrenMutable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v4 = require(l_script_FirstAncestor_0.Util.getTreeCount);
local v5 = require(l_script_FirstAncestor_0.Util.isExpanded);
local v6 = {};
local function _(v7, v8) --[[ Line: 11 ]] --[[ Name: addDescendantCount ]]
    -- upvalues: v1 (copy)
    local l_v7_0 = v7;
    while l_v7_0 ~= nil do
        v1.patchNodeDescendantCount(l_v7_0, v8);
        l_v7_0 = l_v7_0.parent;
    end;
end;
local function _(v11, v12) --[[ Line: 19 ]] --[[ Name: setHasChildren ]]
    if v11.datum.hasChildren == v12 then
        return;
    else
        v11.datum = table.clone(v11.datum);
        v11.datum.hasChildren = v12;
        table.freeze(v11.datum);
        return;
    end;
end;
local function _(v14, v15) --[[ Line: 29 ]] --[[ Name: updateImmutableData ]]
    v14.datum = table.clone(v14.datum);
    v14.datum.parentId = v15;
    table.freeze(v14.datum);
end;
local function v23(v17, v18) --[[ Line: 35 ]] --[[ Name: removeParentNoDatumUpdate ]]
    -- upvalues: v1 (copy), v4 (copy)
    local l_parent_0 = v18.parent;
    if l_parent_0 == nil then
        return;
    else
        local v20 = v17.instanceIdsToHiddenChildren[l_parent_0.datum.id];
        v1.remove(v20 or v1.ensureChildList(l_parent_0), v18);
        v18.parent = nil;
        if v20 ~= nil then
            v20.treeDescendantCount = v20.treeDescendantCount - v4(v18);
            return;
        else
            local v21 = not v1.isEmpty(l_parent_0.children);
            if l_parent_0.datum.hasChildren ~= v21 then
                l_parent_0.datum = table.clone(l_parent_0.datum);
                l_parent_0.datum.hasChildren = v21;
                table.freeze(l_parent_0.datum);
            end;
            v21 = -v4(v18);
            local l_l_parent_0_0 = l_parent_0;
            while l_l_parent_0_0 ~= nil do
                v1.patchNodeDescendantCount(l_l_parent_0_0, v21);
                l_l_parent_0_0 = l_l_parent_0_0.parent;
            end;
            return;
        end;
    end;
end;
v6.insertInto = function(v24, v25, v26) --[[ Line: 57 ]] --[[ Name: insertInto ]]
    -- upvalues: v23 (copy), v1 (copy), v5 (copy), v4 (copy)
    v24.instanceIdsToNodes[v26.datum.id] = v26;
    local l_parent_1 = v26.parent;
    if l_parent_1 ~= nil then
        v23(v24, v26);
        local v28 = v24.instanceIdsToHiddenChildren[l_parent_1.datum.id];
        if v28 ~= nil then
            v1.remove(v28, v26);
        end;
    end;
    v26.parent = v25;
    local l_id_0 = v25.datum.id;
    v26.datum = table.clone(v26.datum);
    v26.datum.parentId = l_id_0;
    table.freeze(v26.datum);
    if v5(v25) then
        l_id_0 = v1.ensureChildList(v25);
        v1.insert(l_id_0, v26);
        local v30 = v4(v26);
        local l_v25_0 = v25;
        while l_v25_0 ~= nil do
            v1.patchNodeDescendantCount(l_v25_0, v30);
            l_v25_0 = l_v25_0.parent;
        end;
        if v25.datum.hasChildren == true then
            return;
        else
            v25.datum = table.clone(v25.datum);
            v25.datum.hasChildren = true;
            table.freeze(v25.datum);
            return;
        end;
    else
        l_id_0 = v24.instanceIdsToHiddenChildren[v25.datum.id];
        if l_id_0 == nil then
            l_id_0 = v1.empty();
            v24.instanceIdsToHiddenChildren[v25.datum.id] = l_id_0;
        end;
        assert(l_id_0 ~= nil, "Luau");
        v1.insert(l_id_0, v26);
        l_id_0.treeDescendantCount = l_id_0.treeDescendantCount + v4(v26);
        return;
    end;
end;
v6.replaceChildren = function(v32, v33) --[[ Line: 97 ]] --[[ Name: replaceChildren ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v34 = v33.treeDescendantCount - v4(v32);
    if v32.parent ~= nil then
        local l_parent_2 = v32.parent;
        while l_parent_2 ~= nil do
            v1.patchNodeDescendantCount(l_parent_2, v34);
            l_parent_2 = l_parent_2.parent;
        end;
    end;
    return v1.replaceChildren(v32, v33);
end;
v6.remove = function(v36, v37) --[[ Line: 113 ]] --[[ Name: remove ]]
    -- upvalues: v23 (copy)
    v23(v36, v37);
    v37.datum = table.clone(v37.datum);
    v37.datum.parentId = nil;
    table.freeze(v37.datum);
end;
return v6;