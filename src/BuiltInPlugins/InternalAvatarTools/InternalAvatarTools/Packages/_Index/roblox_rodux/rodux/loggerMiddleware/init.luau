local function v0(v1, v2) --[[ Line: 3 ]] --[[ Name: prettyPrint ]]
    -- upvalues: v0 (copy)
    v2 = v2 or 0;
    local v3 = {};
    if typeof(v1) == "table" then
        table.insert(v3, "{\n");
        for v4, v5 in pairs(v1) do
            table.insert(v3, ("    "):rep(v2 + 1));
            table.insert(v3, (tostring(v4)));
            table.insert(v3, " = ");
            table.insert(v3, v0(v5, v2 + 1));
            table.insert(v3, "\n");
        end;
        table.insert(v3, ("    "):rep(v2));
        table.insert(v3, "}");
    elseif typeof(v1) == "string" then
        table.insert(v3, string.format("%q", v1));
        table.insert(v3, " (string)");
    else
        table.insert(v3, (tostring(v1)));
        table.insert(v3, " (");
        table.insert(v3, (typeof(v1)));
        table.insert(v3, ")");
    end;
    return table.concat(v3, "");
end;
local v6 = {
    outputFunction = print
};
v6.middleware = function(v7, v8) --[[ Line: 42 ]] --[[ Name: middleware ]]
    -- upvalues: v6 (copy), v0 (copy)
    return function(v9) --[[ Line: 43 ]]
        -- upvalues: v7 (copy), v6 (ref), v0 (ref), v8 (copy)
        local v10 = v7(v9);
        v6.outputFunction(("Action dispatched: %s\nState changed to: %s"):format(v0(v9), v0(v8:getState())));
        return v10;
    end;
end;
return v6;