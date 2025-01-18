local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_0.mock_serializer);
local l_plugins_0 = require(l_Parent_1.PrettyFormat).plugins;
local v5 = {
    v3, 
    l_plugins_0.AsymmetricMatcher, 
    l_plugins_0.RobloxInstance
};
local v6 = l_Array_0.from(v5);
local function v8(v7) --[[ Line: 31 ]] --[[ Name: addSerializer ]]
    -- upvalues: v5 (ref)
    table.insert(v5, 1, v7);
end;
local function v9() --[[ Line: 35 ]] --[[ Name: getSerializers ]]
    -- upvalues: v5 (ref)
    return v5;
end;
local function v10() --[[ Line: 41 ]] --[[ Name: resetSerializers ]]
    -- upvalues: v5 (ref), l_Array_0 (copy), v6 (copy)
    v5 = l_Array_0.from(v6);
end;
return {
    addSerializer = v8, 
    getSerializers = v9, 
    resetSerializers = v10
};