local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.assertEqual);
return function(v2) --[[ Line: 7 ]] --[[ Name: trim ]]
    -- upvalues: v1 (copy)
    v1(typeof(v2), "string", "Attempted to call Dash.trim with argument #1 of type {left:?} not {right:?}");
    return v2:match("^%s*(.-)%s*$");
end;