local function v0(v1, v2) --[[ Line: 7 ]] --[[ Name: deepEqual ]]
    -- upvalues: v0 (copy)
    if typeof(v1) ~= typeof(v2) then
        return false;
    elseif typeof(v1) == "table" then
        local v3 = {};
        for v4, v5 in pairs(v1) do
            v3[v4] = true;
            if not v0(v5, v2[v4]) then
                return false;
            end;
        end;
        for v6, v7 in pairs(v2) do
            if not v3[v6] and not v0(v7, v1[v6]) then
                return false;
            end;
        end;
        return true;
    elseif v1 == v2 then
        return true;
    else
        return false;
    end;
end;
return v0;