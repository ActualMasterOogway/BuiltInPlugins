local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_collectSet_0 = v1.collectSet;
local l_forEach_0 = v1.forEach;
local l_forEachArgs_0 = v1.forEachArgs;
local l_keys_0 = v1.keys;
local l_split_0 = string.split;
local l_concat_0 = table.concat;
return function(v8, ...) --[[ Line: 15 ]] --[[ Name: omitTags ]]
    -- upvalues: l_collectSet_0 (copy), l_split_0 (copy), l_forEachArgs_0 (copy), l_forEach_0 (copy), l_concat_0 (copy), l_keys_0 (copy)
    if not v8 then
        return nil;
    else
        local v9 = l_collectSet_0(l_split_0(v8, " "));
        l_forEachArgs_0(function(v10) --[[ Line: 20 ]]
            -- upvalues: l_forEach_0 (ref), l_split_0 (ref), v9 (copy)
            if v10 then
                l_forEach_0(l_split_0(v10, " "), function(v11) --[[ Line: 22 ]]
                    -- upvalues: v9 (ref)
                    v9[v11] = nil;
                end);
            end;
        end, ...);
        return l_concat_0(l_keys_0(v9), " ");
    end;
end;