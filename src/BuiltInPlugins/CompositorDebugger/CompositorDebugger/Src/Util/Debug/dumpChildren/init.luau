local function v0(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: dump ]]
    -- upvalues: v0 (copy)
    if not v1 then
        return "<nil>";
    else
        assert(v1);
        if typeof(v1) ~= "Instance" then
            return "<Not an instance>\n";
        else
            local v4 = string.format("%s [%s]%s\n", v1.Name, v1.ClassName, if v2 then " -> " .. v2(v1) else "");
            local v5 = string.rep("..", v3);
            for _, v7 in pairs(v1:GetChildren()) do
                v4 = v4 .. v5 .. ".." .. v0(v7, v2, v3 + 1);
            end;
            return v4;
        end;
    end;
end;
return function(v8, v9, v10) --[[ Line: 21 ]] --[[ Name: dumpChildren ]]
    -- upvalues: v0 (copy)
    local v11 = v0(v8, v9, 0);
    if v10 then
        v10(v11);
        return;
    else
        print(v11);
        return;
    end;
end;