local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.instanceof);
local v4 = nil;
local v5 = nil;
return function(v6, v7, v8) --[[ Line: 14 ]]
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
    local v9 = typeof(v6);
    local v10 = {};
    if v9 == "table" and v1(v6) then
        if v7 then
            for v11 = 1, #v6 do
                if v8 ~= nil then
                    v10[v11] = v7(v8, v6[v11], v11);
                else
                    v10[v11] = v7(v6[v11], v11);
                end;
            end;
            return v10;
        else
            for v12 = 1, #v6 do
                v10[v12] = v6[v12];
            end;
            return v10;
        end;
    elseif v3(v6, v4) then
        if v7 then
            for v13, v14 in v6:ipairs() do
                if v8 ~= nil then
                    v10[v13] = v7(v8, v14, v13);
                else
                    v10[v13] = v7(v14, v13);
                end;
            end;
            return v10;
        else
            for v15, v16 in v6:ipairs() do
                v10[v15] = v16;
            end;
            return v10;
        end;
    elseif v3(v6, v5) then
        if v7 then
            for v17, v18 in v6:ipairs() do
                if v8 ~= nil then
                    v10[v17] = v7(v8, v18, v17);
                else
                    v10[v17] = v7(v18, v17);
                end;
            end;
            return v10;
        else
            for v19, v20 in v6:ipairs() do
                v10[v19] = v20;
            end;
            return v10;
        end;
    else
        if v9 == "string" then
            if v7 then
                for v21 = 1, v6:len() do
                    if v8 ~= nil then
                        v10[v21] = v7(v8, v6:sub(v21, v21), v21);
                    else
                        v10[v21] = v7(v6:sub(v21, v21), v21);
                    end;
                end;
                return v10;
            else
                for v22 = 1, v6:len() do
                    v10[v22] = v6:sub(v22, v22);
                end;
            end;
        end;
        return v10;
    end;
end;