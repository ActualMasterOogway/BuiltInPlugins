local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = {};
v2.Merge = function(v3, v4) --[[ Line: 10 ]] --[[ Name: Merge ]]
    -- upvalues: v2 (copy), v1 (copy)
    v3 = v3 or {};
    v4 = v4 or {};
    local v5 = {};
    for v6, v7 in pairs(v3) do
        if v4[v6] == nil then
            v5[v6] = v7;
        end;
    end;
    for v8, v9 in pairs(v4) do
        if type(v9) == "table" then
            if v3[v8] ~= nil and type(v3[v8]) == "table" then
                v5[v8] = v2.Merge(v3[v8], v9);
            else
                v5[v8] = v2.Merge(nil, v9);
            end;
        elseif v9 == v1.None then
            v5[v8] = nil;
        else
            v5[v8] = v9;
        end;
    end;
    if next(v5) == nil then
        return nil;
    else
        return v5;
    end;
end;
return v2;