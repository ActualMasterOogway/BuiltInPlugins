local function v0(v1) --[[ Line: 5 ]] --[[ Name: deepCopy ]]
    -- upvalues: v0 (copy)
    if type(v1) ~= "table" or type(v1.render) == "function" then
        return v1;
    else
        local v2 = getmetatable(v1);
        local v3 = {};
        for v4, v5 in pairs(v1) do
            if type(v5) == "table" then
                v3[v4] = v0(v5);
            else
                v3[v4] = v5;
            end;
        end;
        setmetatable(v3, v2);
        return v3;
    end;
end;
return v0;