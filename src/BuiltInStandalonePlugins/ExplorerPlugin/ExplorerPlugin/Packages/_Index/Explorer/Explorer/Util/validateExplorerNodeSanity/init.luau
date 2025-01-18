local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Util.ExplorerNodeChildrenMutable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugExplorerExpensiveSanityChecking);
local v5 = require(l_script_FirstAncestor_0.Util.getTreeCount);
local function v6(v7, v8) --[[ Line: 10 ]] --[[ Name: assertIsDeepFrozen ]]
    -- upvalues: v6 (copy)
    if v7 == nil then
        return;
    else
        if typeof(v7) ~= "table" then
            error((("%* is not a table"):format(v8)));
        end;
        if not table.isfrozen(v7) then
            error((("%* is not frozen"):format(v8)));
        end;
        for v9, v10 in v7 do
            if typeof(v10) == "table" then
                v6(v10, (("%*.%*"):format(v8, v9)));
            end;
        end;
        return;
    end;
end;
local function v15(v11) --[[ Line: 32 ]] --[[ Name: getParents ]]
    local v12 = {};
    local v13 = {};
    local l_parent_0 = v11.parent;
    while l_parent_0 ~= nil do
        if table.find(v12, l_parent_0) ~= nil then
            error((("Circular ancestry: %*.%* was about to reach %* again"):format(table.concat(v13, "."), v11.datum.name, l_parent_0.datum.name)));
        end;
        table.insert(v12, l_parent_0);
        table.insert(v13, 1, l_parent_0.datum.name);
        l_parent_0 = l_parent_0.parent;
    end;
    return v13;
end;
local function _(v16, v17, v18, v19) --[[ Line: 52 ]] --[[ Name: assertEquals ]]
    -- upvalues: v15 (copy)
    if v18 == v19 then
        return;
    else
        local v20 = table.concat(v15(v16), ".");
        error((("%*.%* - %* didn't match: %* ~= %*"):format(v20, v16.datum.name, v17, v18, v19)));
        return;
    end;
end;
local function v22(v23) --[[ Line: 61 ]] --[[ Name: validateAndGetDescendantCount ]]
    -- upvalues: v1 (copy), v15 (copy), v2 (copy), v22 (copy), v5 (copy), v6 (copy)
    if v23.parent == nil then
        local l_id_0 = v23.datum.id;
        local l_rootId_0 = v1.rootId;
        if l_id_0 ~= l_rootId_0 then
            local v26 = table.concat(v15(v23), ".");
            error((("%*.%* - %* didn't match: %* ~= %*"):format(v26, v23.datum.name, "ID of node with no parent", l_id_0, l_rootId_0)));
        end;
    end;
    local v27 = 1;
    if v23.children then
        for v28 in v2.iterate(v23.children) do
            v27 = v27 + v22(v28);
        end;
    end;
    local v29 = v5(v23);
    local l_v27_0 = v27;
    if v29 ~= l_v27_0 then
        local v31 = table.concat(v15(v23), ".");
        error((("%*.%* - %* didn't match: %* ~= %*"):format(v31, v23.datum.name, "tree descendant count", v29, l_v27_0)));
    end;
    v29 = table.concat(v15(v23), ".");
    v6(v23.datum, (("<%*>.datum"):format(v29)));
    v6(v23.uiState, (("<%*>.uiState"):format(v29)));
    return v27;
end;
local function v33(v32) --[[ Line: 82 ]] --[[ Name: validateExplorerNodeSanity ]]
    -- upvalues: v22 (copy)
    v22(v32);
end;
if v4() then
    return v33;
else
    return function() --[[ Line: 86 ]]

    end;
end;