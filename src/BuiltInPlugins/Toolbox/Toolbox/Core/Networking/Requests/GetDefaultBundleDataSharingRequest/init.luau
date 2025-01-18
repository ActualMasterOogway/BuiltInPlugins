local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local _ = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local _ = require(l_Util_0.DebugFlags);
local _ = l_script_FirstAncestor_0.Core.Actions;
local v5 = {
    isEligible = false
};
return function(v6) --[[ Line: 13 ]]
    -- upvalues: v5 (copy)
    local function v9(v7) --[[ Line: 14 ]]
        -- upvalues: v5 (ref)
        local l_responseBody_0 = v7.responseBody;
        if l_responseBody_0.isEligible and l_responseBody_0.configurations == nil then
            return v5;
        else
            return true, l_responseBody_0;
        end;
    end;
    local function v11(_) --[[ Line: 23 ]]
        -- upvalues: v5 (ref)
        return false, v5;
    end;
    return v6:getDefaultCreateBundleDataSharing():andThen(v9, v11);
end;