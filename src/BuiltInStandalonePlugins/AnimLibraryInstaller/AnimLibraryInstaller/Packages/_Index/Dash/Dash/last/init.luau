local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
return function(v3, v4) --[[ Line: 16 ]] --[[ Name: last ]]
    -- upvalues: v2 (copy)
    v2(typeof(v3), "table", "Attempted to call Dash.last with argument #1 of type {left:?} not {right:?}");
    for v5 = #v3, 1, -1 do
        local v6 = v3[v5];
        if not v4 then
            return v6;
        elseif v4(v6, v5) then
            return v6;
        end;
    end;
end;