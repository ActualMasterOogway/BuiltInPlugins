local v0 = require(script.Parent.Symbol).named("Nil");
local v1 = {};
local function v4(v2, v3) --[[ Line: 16 ]] --[[ Name: tryPropertyName ]]
    return v2[v3];
end;
return function(v5, v6) --[[ Line: 20 ]] --[[ Name: getDefaultInstanceProperty ]]
    -- upvalues: v1 (copy), v0 (copy), v4 (copy)
    local v7 = v1[v5];
    if v7 then
        local v8 = v7[v6];
        if v8 == v0 then
            return true, nil;
        elseif v8 ~= nil then
            return true, v8;
        end;
    else
        v7 = {};
        v1[v5] = v7;
    end;
    local v9 = Instance.new(v5);
    local l_status_0, l_result_0 = pcall(v4, v9, v6);
    v9:Destroy();
    if l_status_0 then
        if l_result_0 == nil then
            v7[v6] = v0;
            return l_status_0, l_result_0;
        else
            v7[v6] = l_result_0;
        end;
    end;
    return l_status_0, l_result_0;
end;