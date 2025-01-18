local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_forEachArgs_0 = v1.forEachArgs;
local l_concat_0 = table.concat;
if not require(l_Parent_0.SharedFlags.getFFlagDevFrameworkJoinTagsTablesSupport)() then
    local l_append_0 = v1.append;
    local l_collectSet_0 = v1.collectSet;
    local l_keys_0 = v1.keys;
    local l_split_0 = string.split;
    return function(...) --[[ Line: 14 ]] --[[ Name: joinTags ]]
        -- upvalues: l_forEachArgs_0 (copy), l_append_0 (copy), l_split_0 (copy), l_concat_0 (copy), l_keys_0 (copy), l_collectSet_0 (copy)
        local v8 = {};
        l_forEachArgs_0(function(v9) --[[ Line: 16 ]]
            -- upvalues: l_append_0 (ref), v8 (copy), l_split_0 (ref)
            if typeof(v9) == "string" then
                l_append_0(v8, l_split_0(v9, " "));
            end;
        end, ...);
        return l_concat_0(l_keys_0(l_collectSet_0(v8)), " ");
    end;
else
    return function(...) --[[ Line: 33 ]] --[[ Name: joinTags ]]
        -- upvalues: l_forEachArgs_0 (copy), l_concat_0 (copy)
        local v10 = {};
        l_forEachArgs_0(function(v11) --[[ Line: 35 ]]
            -- upvalues: v10 (copy)
            if typeof(v11) == "string" then
                table.insert(v10, v11);
                return;
            else
                if typeof(v11) == "table" then
                    for v12, v13 in v11 do
                        if v13 then
                            table.insert(v10, v12);
                        end;
                    end;
                end;
                return;
            end;
        end, ...);
        return l_concat_0(v10, " ");
    end;
end;