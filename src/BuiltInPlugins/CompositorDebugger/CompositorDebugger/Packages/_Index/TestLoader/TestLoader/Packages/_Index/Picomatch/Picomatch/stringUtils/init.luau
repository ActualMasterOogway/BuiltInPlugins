local l_Parent_0 = script.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = require(l_Parent_0.RegExp);
return {
    stringReplace = function(v3, v4, v5) --[[ Line: 14 ]] --[[ Name: stringReplace ]]
        -- upvalues: l_Array_0 (copy)
        local v6 = v4:exec(v3);
        local v7 = 0;
        local v8 = {};
        while v6 ~= nil and v6.index ~= nil do
            local v9 = v6[1];
            local v10 = l_Array_0.slice(v6, 1, v6.n + 1);
            local v11 = v6.index + v7;
            table.insert(v10, v11);
            local v12 = v5(table.unpack(v10));
            table.insert(v8, {
                from = v11, 
                length = #v9, 
                value = v12
            });
            v7 = v7 + (#v9 + v6.index - 1);
            v6 = v4:exec((v3:sub(v7 + 1)));
        end;
        local v13 = v3:sub(1);
        for _, v15 in ipairs(l_Array_0.reverse(v8)) do
            local l_from_0 = v15.from;
            local l_length_0 = v15.length;
            local l_value_0 = v15.value;
            v13 = v13:sub(1, l_from_0 - 1) .. l_value_0 .. v13:sub(l_from_0 + l_length_0);
        end;
        return v13;
    end
};