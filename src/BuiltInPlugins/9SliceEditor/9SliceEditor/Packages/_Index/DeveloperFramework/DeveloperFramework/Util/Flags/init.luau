local v0 = require(script.Parent.Immutable);
local function v7(v1, v2) --[[ Line: 45 ]] --[[ Name: getOrDefineFastFlag ]]
    assert(type(v2) == "boolean", "You can only define a fast flag with a boolean value");
    local l_status_0, l_result_0 = pcall(game.GetFastFlag, game, v1);
    if l_status_0 and l_result_0 ~= nil then
        return l_result_0;
    else
        local l_status_1, l_result_1 = pcall(game.DefineFastFlag, game, v1, v2);
        if not l_status_1 then
            warn("An error occurred defining the fast flag: " .. v1);
            warn(l_result_1);
        end;
        return v2;
    end;
end;
local function v10(v8, v9) --[[ Line: 66 ]] --[[ Name: assertKeyExists ]]
    if type(v9) ~= "string" then
        error("Expected key to be a string.", 2);
    end;
    if v8.shouldAssertOnMissingFlag and v8.values[v9] == nil then
        error(string.format("`%s` was not defined as a feature name.", v9), 2);
    end;
end;
local v11 = {};
v11.__index = v11;
v11.new = function(v12, v13) --[[ Line: 86 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v7 (copy)
    v12 = v12 or {};
    v13 = v13 or {};
    if v13.shouldAssertOnMissingFlag == nil then
        v13.shouldAssertOnMissingFlag = true;
    end;
    if v13.shouldFetchLiveValues == nil then
        v13.shouldFetchLiveValues = true;
    end;
    if v13.defaultValueIfMissing == nil then
        v13.defaultValueIfMissing = false;
    end;
    assert(type(v13.shouldAssertOnMissingFlag) == "boolean", "shouldAssertOnMissingFlag expected to be a boolean");
    assert(type(v13.shouldFetchLiveValues) == "boolean", "shouldFetchLiveValues expected to be a boolean");
    assert(type(v13.defaultValueIfMissing) == "boolean", "Default values for flags must be a boolean");
    assert(type(v12) == "table", "Flags.new expects a table mapping keys to flag names.");
    local v14 = true;
    if type((next(v12))) ~= "nil" then
        v14 = type((next(v12))) == "string";
    end;
    assert(v14, "Flags.new expects a map of string keys.");
    local v15 = {
        values = {}, 
        localOverrides = {}, 
        shouldAssertOnMissingFlag = v13.shouldAssertOnMissingFlag, 
        shouldFetchLiveValues = v13.shouldFetchLiveValues, 
        defaultValueIfMissing = v13.defaultValueIfMissing
    };
    setmetatable(v15, v11);
    if v15.shouldFetchLiveValues then
        local v16 = {};
        for v17, v18 in pairs(v12) do
            if type(v18) == "table" then
                local v19 = true;
                for _, v21 in ipairs(v18) do
                    if not v7(v21, v15.defaultValueIfMissing) then
                        v19 = false;
                        break;
                    end;
                end;
                v16[v17] = v19;
            else
                v16[v17] = v7(v18, v15.defaultValueIfMissing);
            end;
        end;
        v15.values = v16;
        return v15;
    else
        local v22 = {};
        for v23, _ in pairs(v12) do
            v22[v23] = v15.defaultValueIfMissing;
        end;
        v15.values = v22;
        return v15;
    end;
end;
v11.mock = function(v25) --[[ Line: 147 ]] --[[ Name: mock ]]
    -- upvalues: v11 (copy)
    return (v11.new(nil, {
        shouldAssertOnMissingFlag = false, 
        shouldFetchLiveValues = false, 
        defaultValueIfMissing = v25 ~= nil and (v25 or false)
    }));
end;
v11.get = function(v26, v27) --[[ Line: 157 ]] --[[ Name: get ]]
    -- upvalues: v10 (copy)
    v10(v26, v27);
    if v26.localOverrides[v27] ~= nil then
        return v26.localOverrides[v27];
    elseif v26.values[v27] ~= nil then
        return v26.values[v27];
    else
        return v26.defaultValueIfMissing;
    end;
end;
v11.setLocalOverride = function(v28, v29, v30) --[[ Line: 170 ]] --[[ Name: setLocalOverride ]]
    -- upvalues: v10 (copy), v0 (copy)
    v10(v28, v29);
    v28.localOverrides = v0.JoinDictionaries(v28.localOverrides, {
        [v29] = v30
    });
end;
v11.setAllLocalOverrides = function(v31, v32) --[[ Line: 178 ]] --[[ Name: setAllLocalOverrides ]]
    for v33, _ in pairs(v31.values) do
        v31:setLocalOverride(v33, v32);
    end;
end;
v11.clearLocalOverride = function(v35, v36) --[[ Line: 185 ]] --[[ Name: clearLocalOverride ]]
    -- upvalues: v0 (copy)
    assert(v35.localOverrides[v36] ~= nil, string.format("'%s' was never set as a local override", v36));
    v35.localOverrides = v0.RemoveFromDictionary(v35.localOverrides, v36);
end;
v11.clearAllLocalOverrides = function(v37) --[[ Line: 190 ]] --[[ Name: clearAllLocalOverrides ]]
    v37.localOverrides = {};
end;
return v11;