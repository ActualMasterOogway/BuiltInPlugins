local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local l_collectArray_0 = v1.collectArray;
local l_collectSet_0 = v1.collectSet;
local l_copy_0 = v1.copy;
local l_forEach_0 = v1.forEach;
local l_reduce_0 = v1.reduce;
local function v11(v7, v8) --[[ Line: 10 ]] --[[ Name: walk ]]
    -- upvalues: l_reduce_0 (copy)
    return l_reduce_0(v8, function(v9, v10) --[[ Line: 11 ]]
        if v9 and v9.Children then
            return v9.Children[v10];
        else
            return nil;
        end;
    end, v7);
end;
local function v12(v13, v14) --[[ Line: 22 ]] --[[ Name: mergeChildren ]]
    -- upvalues: l_forEach_0 (copy), v12 (copy)
    if v13 then
        l_forEach_0(v14, function(v15, v16) --[[ Line: 25 ]]
            -- upvalues: v13 (copy), v12 (ref)
            local v17 = v13[v16];
            if not v17 then
                return;
            elseif v15.Children then
                v15.Children = v12(v17.Children, v15.Children);
                return;
            else
                v15.Children = v17.Children;
                return;
            end;
        end);
    end;
    return v14;
end;
return function(v18) --[[ Line: 56 ]] --[[ Name: updateTree ]]
    -- upvalues: l_collectArray_0 (copy), l_copy_0 (copy), l_forEach_0 (copy), v12 (copy), l_collectSet_0 (copy), v11 (copy)
    local v21 = l_collectArray_0(v18.expanded, function(v19, v20) --[[ Line: 58 ]]
        return v20 and v19.Path or nil;
    end);
    local v24 = l_collectArray_0(v18.selected, function(v22, v23) --[[ Line: 61 ]]
        return v23 and v22.Path or nil;
    end);
    local v25 = nil;
    if #v18.path == 0 then
        v25 = {
            Children = v18.children
        };
    else
        v25 = l_copy_0(v18.root);
        local l_v25_0 = v25;
        do
            local l_l_v25_0_0 = l_v25_0;
            l_forEach_0(v18.path, function(v28) --[[ Line: 72 ]]
                -- upvalues: l_l_v25_0_0 (ref), l_copy_0 (ref)
                if l_l_v25_0_0 == nil or l_l_v25_0_0.Children == nil then
                    return;
                elseif l_l_v25_0_0.Children[v28] then
                    local v29 = l_copy_0(l_l_v25_0_0.Children[v28]);
                    l_l_v25_0_0.Children[v28] = v29;
                    l_l_v25_0_0 = v29;
                    return;
                else
                    l_l_v25_0_0 = nil;
                    return;
                end;
            end);
            if l_l_v25_0_0 then
                local l_Children_0 = l_l_v25_0_0.Children;
                local l_children_0 = v18.children;
                if l_Children_0 then
                    l_forEach_0(l_children_0, function(v32, v33) --[[ Line: 25 ]]
                        -- upvalues: l_Children_0 (copy), v12 (ref)
                        local v34 = l_Children_0[v33];
                        if not v34 then
                            return;
                        elseif v32.Children then
                            v32.Children = v12(v34.Children, v32.Children);
                            return;
                        else
                            v32.Children = v34.Children;
                            return;
                        end;
                    end);
                end;
                l_l_v25_0_0.Children = l_children_0;
            end;
        end;
    end;
    local v37 = l_collectSet_0(v24, function(_, v36) --[[ Line: 93 ]]
        -- upvalues: v11 (ref), v25 (ref)
        return v11(v25, v36);
    end);
    local v40 = l_collectSet_0(v21, function(_, v39) --[[ Line: 96 ]]
        -- upvalues: v11 (ref), v25 (ref)
        return v11(v25, v39);
    end);
    return {
        root = v25, 
        selected = v37, 
        expanded = v40
    };
end;