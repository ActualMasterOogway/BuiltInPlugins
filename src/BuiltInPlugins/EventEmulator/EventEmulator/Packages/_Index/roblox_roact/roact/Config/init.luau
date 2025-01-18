local v0 = {
    internalTypeChecks = false, 
    typeChecks = false, 
    elementTracing = false, 
    propValidation = false, 
    tempFixUpdateChildrenReEntrancy = false
};
local v1 = {};
for v2 in pairs(v0) do
    table.insert(v1, v2);
end;
local v3 = {};
v3.new = function() --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy), v0 (copy)
    local v7 = {
        _currentConfig = setmetatable({}, {
            __index = function(_, v5) --[[ Line: 43 ]] --[[ Name: __index ]]
                -- upvalues: v1 (ref)
                local v6 = ("Invalid global configuration key %q. Valid configuration keys are: %s"):format(tostring(v5), table.concat(v1, ", "));
                error(v6, 3);
            end
        })
    };
    v7.set = function(...) --[[ Line: 58 ]]
        -- upvalues: v3 (ref), v7 (copy)
        return v3.set(v7, ...);
    end;
    v7.get = function(...) --[[ Line: 62 ]]
        -- upvalues: v3 (ref), v7 (copy)
        return v3.get(v7, ...);
    end;
    v7.scoped = function(...) --[[ Line: 66 ]]
        -- upvalues: v3 (ref), v7 (copy)
        return v3.scoped(v7, ...);
    end;
    v7.set(v0);
    return v7;
end;
v3.set = function(v8, v9) --[[ Line: 75 ]] --[[ Name: set ]]
    -- upvalues: v0 (copy), v1 (copy)
    for v10, v11 in pairs(v9) do
        if v0[v10] == nil then
            local v12 = ("Invalid global configuration key %q (type %s). Valid configuration keys are: %s"):format(tostring(v10), typeof(v10), table.concat(v1, ", "));
            error(v12, 3);
        end;
        if typeof(v11) ~= "boolean" then
            local v13 = ("Invalid value %q (type %s) for global configuration key %q. Valid values are: true, false"):format(tostring(v11), typeof(v11), (tostring(v10)));
            error(v13, 3);
        end;
        v8._currentConfig[v10] = v11;
    end;
end;
v3.get = function(v14) --[[ Line: 108 ]] --[[ Name: get ]]
    return v14._currentConfig;
end;
v3.scoped = function(v15, v16, v17) --[[ Line: 112 ]] --[[ Name: scoped ]]
    local v18 = {};
    for v19, v20 in pairs(v15._currentConfig) do
        v18[v19] = v20;
    end;
    v15.set(v16);
    local l_status_0, l_result_0 = pcall(v17);
    v15.set(v18);
    assert(l_status_0, l_result_0);
end;
return v3;