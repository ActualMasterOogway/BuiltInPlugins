local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.None);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.assertEqual);
local v4 = require(l_Parent_0.forEach);
local v5 = require(l_Parent_0.copy);
local function v6(v7, v8) --[[ Line: 22 ]] --[[ Name: joinDeep ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy), v6 (copy), v1 (copy)
    v3(typeof(v7), "table", "Attempted to call Dash.joinDeep with argument #1 of type {left:?} not {right:?}");
    v3(typeof(v8), "table", "Attempted to call Dash.joinDeep with argument #2 of type {left:?} not {right:?}");
    local v9 = v5(v7);
    v4(v8, function(v10, v11) --[[ Line: 27 ]]
        -- upvalues: v7 (copy), v9 (copy), v6 (ref), v1 (ref)
        if typeof(v7[v11]) == "table" and typeof(v10) == "table" then
            v9[v11] = v6(v7[v11], v10);
            return;
        elseif v10 == v1 then
            v9[v11] = nil;
            return;
        else
            v9[v11] = v10;
            return;
        end;
    end);
    return v9;
end;
return v6;