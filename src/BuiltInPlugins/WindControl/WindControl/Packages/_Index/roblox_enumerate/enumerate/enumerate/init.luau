local function v9(v0, v1) --[[ Line: 1 ]] --[[ Name: strict ]]
    v1 = v1 or tostring(v0);
    return (setmetatable(v0, {
        __index = function(_, v3) --[[ Line: 5 ]] --[[ Name: __index ]]
            -- upvalues: v1 (ref)
            local v4 = ("%q (%s) is not a valid member of %s"):format(tostring(v3), typeof(v3), v1);
            error(v4, 2);
        end, 
        __newindex = function(_, v6, _) --[[ Line: 15 ]] --[[ Name: __newindex ]]
            -- upvalues: v1 (ref)
            local v8 = ("%q (%s) is not a valid member of %s"):format(tostring(v6), typeof(v6), v1);
            error(v8, 2);
        end
    }));
end;
local function v18(v10, v11, v12, v13, v14) --[[ Line: 27 ]] --[[ Name: addEnumValue ]]
    -- upvalues: v9 (copy)
    local v15 = typeof(v13) == "string";
    assert(v15, "Only string names are supported for enums!");
    if v15 then
        assert(v13 ~= "fromRawValue", "fromRawValue is reserved");
        assert(v13 ~= "isEnumValue", "isEnumValue is reserved");
    end;
    assert(v10[v13] == nil, "Enum value names can only be used once!");
    assert(v11[v13] == nil, "Enum values can only be used once!");
    local v16 = newproxy(true);
    local v17 = getmetatable(v16);
    v17.__tostring = function() --[[ Line: 40 ]]
        -- upvalues: v12 (copy), v13 (copy)
        return ("%s.%s"):format(v12, v13);
    end;
    v17.__index = v9({
        rawValue = function() --[[ Line: 45 ]] --[[ Name: rawValue ]]
            -- upvalues: v14 (copy)
            return v14;
        end
    });
    v10[v13] = v16;
    v11[v14] = v16;
end;
return function(v19, v20) --[[ Line: 54 ]] --[[ Name: enumerate ]]
    -- upvalues: v18 (copy), v9 (copy)
    assert(typeof(v19) == "string", "Bad argument #1 - enums must be created using a string name!");
    assert(typeof(v20) == "table", "Bad argument #2 - enums must be created using a table!");
    local v21 = {};
    local v22 = {};
    if v20[1] ~= nil then
        for _, v24 in ipairs(v20) do
            v18(v21, v22, v19, v24, v24);
        end;
    else
        for v25, v26 in pairs(v20) do
            v18(v21, v22, v19, v25, v26);
        end;
    end;
    v21.fromRawValue = function(v27) --[[ Line: 72 ]] --[[ Name: fromRawValue ]]
        -- upvalues: v22 (copy)
        return v22[v27];
    end;
    v21.isEnumValue = function(v28) --[[ Line: 76 ]] --[[ Name: isEnumValue ]]
        -- upvalues: v21 (copy)
        if typeof(v28) ~= "userdata" then
            return false;
        else
            for _, v30 in pairs(v21) do
                if v30 == v28 then
                    return true;
                end;
            end;
            return nil;
        end;
    end;
    local v31 = newproxy(true);
    local v32 = getmetatable(v31);
    v32.__index = v9(v21, v19);
    v32.__tostring = function() --[[ Line: 93 ]]
        -- upvalues: v19 (copy)
        return v19;
    end;
    return v31;
end;