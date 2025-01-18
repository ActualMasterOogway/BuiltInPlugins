local l_Util_0 = script:FindFirstAncestor("Toolbox").Core.Util;
local v1 = require(l_Util_0.DebugFlags);
local v2 = game:DefineFastInt("UGCBundleCreationPollStatusAttempts", 5);
local v3 = {
    Unknown = 0, 
    InProgress = 1, 
    Success = 2, 
    ValidationFailed = 3, 
    InsufficientFunds = 4, 
    Failed = 5, 
    CreationFeeMismatch = 6
};
local function v4(v5, v6, v7, v8) --[[ Line: 18 ]] --[[ Name: PollForBundleCreationStatus ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v1 (copy)
    local function v12(v9) --[[ Line: 24 ]]
        -- upvalues: v3 (ref), v7 (copy), v8 (copy), v2 (ref), v4 (ref), v5 (copy), v6 (copy)
        local v10 = if v9.responseBody then v9.responseBody.status else nil;
        if v10 == v3.Success then
            v7(v9.responseBody.bundleId, v9.responseBody);
            return;
        elseif v10 == v3.InProgress then
            if v8 < v2 then
                local v11 = 2 ^ (v8 + 1);
                task.delay(v11, function() --[[ Line: 31 ]]
                    -- upvalues: v4 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref)
                    v4(v5, v6, v7, v8 + 1);
                end);
                return;
            else
                v7(nil, v9.responseBody);
                return;
            end;
        else
            v7(nil, v9.responseBody);
            return;
        end;
    end;
    local function v14(v13) --[[ Line: 42 ]]
        -- upvalues: v1 (ref), v7 (copy)
        if v1.shouldDebugWarnings() then
            warn("Lua toolbox: Could not get UGC Bundle creation status");
        end;
        v7(nil, v13.responseBody);
    end;
    v5:getBundleCreationStatus(v6):andThen(v12, v14);
end;
return function(v15, v16, v17) --[[ Line: 52 ]]
    -- upvalues: v4 (copy)
    return function(_) --[[ Line: 53 ]]
        -- upvalues: v4 (ref), v15 (copy), v16 (copy), v17 (copy)
        v4(v15, v16, v17, 0);
    end;
end;