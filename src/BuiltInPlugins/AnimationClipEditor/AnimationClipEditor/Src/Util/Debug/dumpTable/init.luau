local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local function v2(v3, v4) --[[ Line: 5 ]] --[[ Name: dump ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v3 == nil then
        return "<nil>";
    else
        local v5 = string.rep("  ", v4);
        local v6 = "{\n";
        local v7 = v1.Dictionary.keys(v3);
        table.sort(v7, function(v8, v9) --[[ Line: 12 ]]
            return tostring(v8) < tostring(v9);
        end);
        for _, v11 in ipairs(v7) do
            local v12 = v3[v11];
            v6 = v6 .. string.format("%s  %s%s:", v5, tostring(v11), if typeof(v11) ~= "string" and typeof(v11) ~= "number" then string.format("[%s]", (typeof(v11))) else "");
            if type(v12) == "table" then
                v6 = v6 .. v2(v12, v4 + 1);
            else
                v6 = v6 .. tostring(v12) .. "\n";
            end;
        end;
        return v6 .. v5 .. "}\n";
    end;
end;
return function(v13) --[[ Line: 35 ]] --[[ Name: dumpTable ]]
    -- upvalues: v2 (copy)
    print((v2(v13, 0)));
end;