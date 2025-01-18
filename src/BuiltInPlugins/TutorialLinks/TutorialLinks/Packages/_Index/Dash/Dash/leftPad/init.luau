local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.assertEqual);
return function(v2, v3, v4) --[[ Line: 11 ]] --[[ Name: leftPad ]]
    -- upvalues: v1 (copy)
    v1(typeof(v2), "string", "Attempted to call Dash.leftPad with argument #1 of type {left:?} not {right:?}");
    v1(typeof(v3), "number", "Attempted to call Dash.leftPad with argument #2 of type {left:?} not {right:?}");
    local v5 = v4 or " ";
    v1(typeof(v5), "string", "Attempted to call Dash.leftPad with argument #3 of type {left:?} not {right:?}");
    local v6 = v3 - v2:len();
    local v7 = v6 % v5:len();
    local v8 = (v6 - v7) / v5:len();
    return string.rep(v5 or " ", v8) .. v5:sub(1, v7) .. v2;
end;