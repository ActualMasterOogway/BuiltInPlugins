local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.deepJoin);
local function v2(v3, v4) --[[ Line: 13 ]] --[[ Name: allFieldsAreUnchanged ]]
    -- upvalues: v2 (copy)
    if type(v3) ~= "table" or type(v4) ~= "table" then
        if not v3 then
            v3 = "nil";
        end;
        if not v4 then
            v4 = "nil";
        end;
        error(string.format("Expected to compare two tables, got %s and %s", tostring(v3), (tostring(v4))));
    end;
    local v5 = 0;
    for _, _ in pairs(v4) do
        v5 = v5 + 1;
    end;
    local v8 = 0;
    for v9, v10 in pairs(v3) do
        v8 = v8 + 1;
        local v11 = v4[v9];
        if type(v10) == "table" then
            v2(v10, v11);
        elseif v10 ~= v11 then
            error(string.format("the field \"%s\" no longer matches", v9));
        end;
    end;
    if v8 ~= v5 then
        return error(string.format("Number of keys mismatch : %d vs %d", v8, v5));
    else
        return true;
    end;
end;
return function(v12, v13, v14) --[[ Line: 56 ]]
    -- upvalues: v1 (copy), v2 (copy)
    assert(type(v12) == "function", "Expected a reducer to test");
    assert(type(v13) == "table", "Expected an action to test");
    if v14 ~= nil then
        assert(type(v14) == "table", "Expected previousState to be a table");
    end;
    local v15 = v12(v14, {
        type = "__nil__"
    });
    local v16 = v1(v15, {});
    assert(v2(v15, v16), "deepJoin mutates fields");
    v12(v15, v13);
    return v2(v15, v16);
end;