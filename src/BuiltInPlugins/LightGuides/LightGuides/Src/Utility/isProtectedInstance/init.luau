local v0 = setmetatable({}, {
    __mode = "k"
});
local function v1() --[[ Line: 11 ]] --[[ Name: emptyErrorHandler ]]

end;
local function v3(v2) --[[ Line: 12 ]] --[[ Name: safetyCheckerFunction ]]
    return v2.Name;
end;
return function(v4) --[[ Line: 16 ]] --[[ Name: isProtectedInstance ]]
    -- upvalues: v0 (copy), v3 (copy), v1 (copy)
    local v5 = v0[v4];
    if v5 == nil then
        v5 = not xpcall(v3, v1, v4);
        v0[v4] = v5;
    end;
    return v5;
end;