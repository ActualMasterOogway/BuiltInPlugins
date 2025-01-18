local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.assertEqual);
return function(v2, v3) --[[ Line: 9 ]] --[[ Name: startsWith ]]
    -- upvalues: v1 (copy)
    v1(typeof(v2), "string", "Attempted to call Dash.startsWith with argument #1 of type {left:?} not {right:?}");
    v1(typeof(v3), "string", "Attempted to call Dash.startsWith with argument #2 of type {left:?} not {right:?}");
    return v2:sub(1, v3:len()) == v3;
end;