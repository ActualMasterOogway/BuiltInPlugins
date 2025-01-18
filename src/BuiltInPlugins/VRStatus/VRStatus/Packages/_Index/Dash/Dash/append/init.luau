local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.None);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.assertEqual);
local v4 = require(l_Parent_0.forEachArgs);
local v5 = require(l_Parent_0.forEach);
local l_insert_0 = table.insert;
return function(v7, ...) --[[ Line: 18 ]] --[[ Name: append ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy), v5 (copy), l_insert_0 (copy)
    v3(typeof(v7), "table", "Attempted to call Dash.append with argument #1 of type {left:?} not {right:?}");
    v4(function(v8) --[[ Line: 20 ]]
        -- upvalues: v1 (ref), v5 (ref), v7 (copy), l_insert_0 (ref)
        if v8 == v1 or v8 == nil then
            return;
        else
            v5(v8, function(v9) --[[ Line: 24 ]]
                -- upvalues: v7 (ref), l_insert_0 (ref)
                l_insert_0(v7, v9);
            end);
            return;
        end;
    end, ...);
    return v7;
end;