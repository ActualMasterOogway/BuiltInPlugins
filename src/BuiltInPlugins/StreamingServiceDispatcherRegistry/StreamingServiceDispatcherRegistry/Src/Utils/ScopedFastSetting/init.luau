local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals);
local v2 = {
    boolean = game.SetFastFlagForTesting, 
    number = game.SetFastIntForTesting, 
    string = game.SetFastStringForTesting
};
local v3 = {};
local function v9(v4, v5) --[[ Line: 17 ]] --[[ Name: setFlag ]]
    -- upvalues: v2 (copy)
    local v6 = v2[typeof(v5)];
    if v6 then
        local l_status_0, l_result_0 = pcall(v6, game, v4, v5);
        if not l_status_0 then
            warn(l_result_0);
            error(l_result_0);
        end;
        return v5;
    else
        error((("Unsupported flag type for %*: %*"):format(v4, (typeof(v5)))));
        return;
    end;
end;
v1.afterEach(function() --[[ Line: 31 ]]
    -- upvalues: v3 (copy), v9 (copy)
    for v10, v11 in v3 do
        v9(v10, v11);
    end;
end);
local function v14(v12, v13) --[[ Line: 37 ]] --[[ Name: createScopedFlag ]]
    -- upvalues: v3 (copy), v9 (copy)
    v3[v12] = v9(v12, v13);
end;
return {
    ScopedFastFlagSetting = v14, 
    ScopedFastIntSetting = v14, 
    ScopedFastStringSetting = v14
};