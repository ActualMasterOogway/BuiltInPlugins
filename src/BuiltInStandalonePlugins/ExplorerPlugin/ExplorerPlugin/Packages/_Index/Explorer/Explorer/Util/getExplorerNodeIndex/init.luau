local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v2 = require(l_script_FirstAncestor_0.Util.getTreeCount);
local v3 = require(l_script_FirstAncestor_0.Util.profile);
local function v4(v5) --[[ Line: 9 ]] --[[ Name: getExplorerNodeIndex ]]
    -- upvalues: v2 (copy), v4 (copy)
    local l_parent_0 = v5.parent;
    if l_parent_0 == nil then
        return 0;
    else
        local l_children_0 = l_parent_0.children;
        assert(l_children_0, "Parent has no children");
        local l_array_0 = l_children_0.array;
        if l_array_0 then
            local v9 = 1;
            local v10 = 1;
            while true do
                local v11 = l_array_0[v9];
                v9 = v9 + 1;
                if v11 == nil then
                    error("Explorer node not found in parent's children");
                    continue;
                end;
                if v11 ~= v5 then
                    v10 = v10 + v2(v11);
                else
                    break;
                end;
            end;
            return v4(l_parent_0) + v10;
        elseif l_children_0.tree then
            local l_v5_0 = v5;
            local l_childNodeParent_0 = l_v5_0.childNodeParent;
            local v14 = 1;
            if l_v5_0.childNodeLeft then
                v14 = v14 + l_v5_0.childNodeLeft.childNodeTreeCount;
            end;
            while l_childNodeParent_0 do
                local l_childNodeLeft_0 = l_childNodeParent_0.childNodeLeft;
                if l_v5_0 ~= l_childNodeLeft_0 then
                    v14 = v14 + v2(l_childNodeParent_0);
                    if l_childNodeLeft_0 then
                        v14 = v14 + l_childNodeLeft_0.childNodeTreeCount;
                    end;
                end;
                l_v5_0 = l_childNodeParent_0;
                l_childNodeParent_0 = l_childNodeParent_0.childNodeParent;
            end;
            return v4(l_parent_0) + v14;
        else
            return 1;
        end;
    end;
end;
return v3(v4);