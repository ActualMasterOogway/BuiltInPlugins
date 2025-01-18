local function v0(v1, v2) --[[ Line: 4 ]] --[[ Name: prettyPrint ]]
    -- upvalues: v0 (copy)
    local v3 = v2 or 0;
    local v4 = {};
    if typeof(v1) == "table" then
        table.insert(v4, "{\n");
        for v5, v6 in pairs(v1) do
            table.insert(v4, ("    "):rep(v3 + 1));
            table.insert(v4, (tostring(v5)));
            table.insert(v4, " = ");
            table.insert(v4, v0(v6, v3 + 1));
            table.insert(v4, "\n");
        end;
        table.insert(v4, ("    "):rep(v3));
        table.insert(v4, "}");
    elseif typeof(v1) == "string" then
        table.insert(v4, string.format("%q", v1));
        table.insert(v4, " (string)");
    else
        table.insert(v4, (tostring(v1)));
        table.insert(v4, " (");
        table.insert(v4, (typeof(v1)));
        table.insert(v4, ")");
    end;
    return table.concat(v4, "");
end;
return v0;