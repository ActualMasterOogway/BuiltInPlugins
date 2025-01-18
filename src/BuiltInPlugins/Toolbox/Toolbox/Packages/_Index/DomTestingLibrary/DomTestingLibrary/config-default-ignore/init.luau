local v0 = {};
local function v1() --[[ Line: 4 ]] --[[ Name: getIgnore ]]
    -- upvalues: v0 (ref)
    return v0;
end;
local function v3(v2) --[[ Line: 8 ]] --[[ Name: setIgnore ]]
    -- upvalues: v0 (ref)
    v0 = v2;
end;
return {
    getIgnore = v1, 
    setIgnore = v3
};