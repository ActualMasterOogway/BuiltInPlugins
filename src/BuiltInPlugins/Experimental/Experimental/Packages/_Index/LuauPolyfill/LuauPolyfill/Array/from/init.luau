local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.instanceof);
local v4 = nil;
local v5 = nil;
return function(v6, v7) --[[ Line: 13 ]]
    -- upvalues: v4 (ref), l_Parent_1 (copy), v5 (ref), v1 (copy), v3 (copy)
    if not v4 then
        v4 = require(l_Parent_1).Set;
    end;
    if not v5 then
        v5 = require(l_Parent_1).Map;
    end;
    if v6 == nil then
        error("cannot create array from a nil value");
    end;
    local v8 = typeof(v6);
    local v9 = {};
    if v8 == "table" and v1(v6) then
        if v7 then
            for v10 = 1, #v6 do
                v9[v10] = v7(v6[v10], v10);
            end;
            return v9;
        else
            for v11 = 1, #v6 do
                v9[v11] = v6[v11];
            end;
            return v9;
        end;
    elseif v3(v6, v4) then
        if v7 then
            for v12, v13 in v6:ipairs() do
                v9[v12] = v7(v13, v12);
            end;
            return v9;
        else
            for v14, v15 in v6:ipairs() do
                v9[v14] = v15;
            end;
            return v9;
        end;
    elseif v3(v6, v5) then
        if v7 then
            for v16, v17 in v6:ipairs() do
                v9[v16] = v7(v17, v16);
            end;
            return v9;
        else
            for v18, v19 in v6:ipairs() do
                v9[v18] = v19;
            end;
            return v9;
        end;
    else
        if v8 == "string" then
            if v7 then
                for v20 = 1, v6:len() do
                    v9[v20] = v7(v6:sub(v20, v20), v20);
                end;
                return v9;
            else
                for v21 = 1, v6:len() do
                    v9[v21] = v6:sub(v21, v21);
                end;
            end;
        end;
        return v9;
    end;
end;