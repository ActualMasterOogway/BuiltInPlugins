local function v0(v1, v2, v3, v4) --[[ Line: 4 ]] --[[ Name: dump ]]
    -- upvalues: v0 (copy)
    if v1 == nil then
        return "nil";
    else
        v2 = v2 or 0;
        v4 = v4 or {};
        assert(v1);
        assert(v2);
        assert(v4);
        if v3 and v3 < v2 then
            return "...";
        elseif v4[v1] then
            return "<cycle detected>";
        else
            v4[v1] = true;
            local v5 = string.rep("  ", v2);
            local v6 = "{\n";
            local v7 = {};
            for v8, _ in v1 do
                table.insert(v7, v8);
            end;
            table.sort(v7, function(v10, v11) --[[ Line: 30 ]]
                if type(v10) == "number" and type(v11) == "number" then
                    return v10 < v11;
                else
                    return tostring(v10) < tostring(v11);
                end;
            end);
            for _, v13 in ipairs(v7) do
                local v14 = v1[v13];
                local _ = nil;
                v6 = v6 .. v5 .. "  " .. (if type(v13) == "number" then "[" .. tostring(v13) .. "]" else if type(v13) == "string" then v13 else "`" .. tostring(v13) .. "`") .. " = ";
                v6 = (if type(v14) == "table" then v6 .. v0(v14, v2 + 1, v3, v4) else if type(v14) == "userdata" then v6 .. typeof(v14) .. ".new(" .. tostring(v14) .. ")" else if type(v14) == "function" then v6 .. "function() end" else if type(v14) == "string" then v6 .. "\"" .. v14 .. "\"" else if type(v14) == "number" then if v14 == 1e999 then v6 .. "math.huge" else if v14 == -1e999 then v6 .. "-math.huge" else v6 .. tostring(v14) else v6 .. tostring(v14)) .. ",\n";
            end;
            v4[v1] = nil;
            return v6 .. v5 .. "}";
        end;
    end;
end;
return function(v16, v17, v18) --[[ Line: 76 ]] --[[ Name: dumpTable ]]
    -- upvalues: v0 (copy)
    local v19 = v0(v16, 0, v17);
    if v18 then
        v18(v19);
        return;
    else
        print(v19);
        return;
    end;
end;