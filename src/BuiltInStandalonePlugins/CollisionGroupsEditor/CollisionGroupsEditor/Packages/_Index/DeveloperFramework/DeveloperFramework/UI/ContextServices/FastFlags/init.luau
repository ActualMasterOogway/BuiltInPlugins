local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.ContextServices.ContextItem);
local l_Flags_0 = require(l_Parent_0.Util).Flags;
local function v7(v3, v4) --[[ Line: 9 ]] --[[ Name: validateIsMap ]]
    if type(v3) ~= "table" then
        error(string.format("Expected %s to be a table", v4), 2);
    end;
    local v5, _ = next(v3);
    if type(v5) ~= "nil" and type(v5) ~= "string" then
        error(string.format("Expected %s to be map keyed on strings", v4), 2);
    end;
end;
local v8 = v1:extend("FastFlags");
v8.new = function(v9, v10) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), l_Flags_0 (copy), v8 (copy)
    v9 = v9 ~= nil and v9 or {};
    v10 = v10 ~= nil and v10 or {};
    v7(v9, "featuresMap");
    v7(v10, "overrides");
    local v11 = l_Flags_0.new(v9);
    for v12, v13 in pairs(v10) do
        v11:setLocalOverride(v12, v13);
    end;
    local v14 = {
        flags = v11
    };
    setmetatable(v14, v8);
    return v14;
end;
v8.mock = function(v15, v16) --[[ Line: 39 ]] --[[ Name: mock ]]
    -- upvalues: v7 (copy), l_Flags_0 (copy), v8 (copy)
    assert(type(v15) == "boolean", "Expected defaultValue to be a boolean");
    v16 = v16 ~= nil and v16 or {};
    v7(v16, "overrides");
    local v17 = l_Flags_0.mock(false);
    for v18, v19 in pairs(v16) do
        v17:setLocalOverride(v18, v19);
    end;
    local v20 = {
        flags = v17
    };
    setmetatable(v20, v8);
    return v20;
end;
v8.get = function(v21, v22) --[[ Line: 56 ]] --[[ Name: get ]]
    assert(type(v22) == "string", "Expected featureName to be a string");
    return v21.flags:get(v22);
end;
return v8;