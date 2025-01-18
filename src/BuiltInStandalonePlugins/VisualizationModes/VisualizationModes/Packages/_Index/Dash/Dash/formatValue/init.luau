local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.assertEqual);
return function(v2, v3) --[[ Line: 13 ]] --[[ Name: formatValue ]]
    -- upvalues: v1 (copy), l_Parent_0 (copy)
    v3 = v3 or "";
    v1(typeof(v3), "string", "Attempted to call Dash.formatValue with argument #2 of type {left:?} not {right:?}");
    local v4, v5 = v3:find("[A-Za-z#?]+");
    if v4 then
        local v6 = v3:sub(v4, v5);
        local v7 = "%" .. v3:sub(1, v4 - 1) .. v3:sub(v5 + 1) .. "s";
        local v8 = require(l_Parent_0.pretty);
        if v6 == "#?" then
            return v7:format(v8(v2, {
                multiline = true
            }));
        elseif v6 == "?" then
            return v7:format(v8(v2));
        else
            return ("%" .. v3):format(v2);
        end;
    else
        local v9 = "s";
        if type(v2) == "number" then
            local _, v11 = math.modf(v2);
            v9 = v11 == 0 and "d" or "f";
        end;
        return ("%" .. v3 .. v9):format((tostring(v2)));
    end;
end;