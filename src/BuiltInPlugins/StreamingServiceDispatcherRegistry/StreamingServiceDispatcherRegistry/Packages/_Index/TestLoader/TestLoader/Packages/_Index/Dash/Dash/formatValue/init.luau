local l_Parent_0 = script.Parent;
return function(v1, v2) --[[ Line: 12 ]] --[[ Name: formatValue ]]
    -- upvalues: l_Parent_0 (copy)
    v2 = v2 or "";
    local v3, v4 = v2:find("[A-Za-z#?]+");
    if v3 then
        local v5 = v2:sub(v3, v4);
        local v6 = "%" .. v2:sub(1, v3 - 1) .. v2:sub(v4 + 1) .. "s";
        local v7 = require(l_Parent_0.pretty);
        if v5 == "#?" then
            return v6:format(v7(v1, {
                multiline = true
            }));
        elseif v5 == "?" then
            return v6:format(v7(v1));
        else
            return ("%" .. v2):format(v1);
        end;
    else
        local v8 = "s";
        if type(v1) == "number" then
            local _, v10 = math.modf(v1);
            v8 = v10 == 0 and "d" or "f";
        end;
        return ("%" .. v2 .. v8):format((tostring(v1)));
    end;
end;