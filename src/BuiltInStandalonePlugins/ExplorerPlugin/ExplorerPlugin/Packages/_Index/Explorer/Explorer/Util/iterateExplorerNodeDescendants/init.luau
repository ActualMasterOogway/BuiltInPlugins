local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.ExplorerNodeChildrenMutable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v3) --[[ Line: 7 ]] --[[ Name: iterateExplorerNodeDescendants ]]
    -- upvalues: v1 (copy)
    if v3.children == nil then
        return function() --[[ Line: 9 ]]
            return nil;
        end;
    else
        local v4 = {
            v1.iterate(v3.children)
        };
        local function v5() --[[ Line: 16 ]] --[[ Name: nextItem ]]
            -- upvalues: v4 (copy), v1 (ref), v5 (copy)
            local v6 = v4[#v4];
            if v6 == nil then
                return nil;
            else
                local v7 = v6();
                if v7 ~= nil then
                    if v7.children ~= nil then
                        table.insert(v4, v1.iterate(v7.children));
                    end;
                    return v7;
                else
                    v4[#v4] = nil;
                    return v5();
                end;
            end;
        end;
        return v5;
    end;
end;