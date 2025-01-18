local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Actions.SetUploadFee);
local v2 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local v3 = require(l_script_FirstAncestor_0.Core.Actions.UploadResult);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v5 = require(l_Util_0.DebugFlags);
return function(v6, v7, v8) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v5 (copy), v2 (copy), v3 (copy)
    return function(v9) --[[ Line: 11 ]]
        -- upvalues: v1 (ref), v5 (ref), v2 (ref), v3 (ref), v6 (copy), v7 (copy), v8 (copy)
        local function v12(v10) --[[ Line: 12 ]]
            -- upvalues: v9 (copy), v1 (ref), v5 (ref)
            local l_responseBody_0 = v10.responseBody;
            if l_responseBody_0.price ~= nil and l_responseBody_0.canAfford ~= nil then
                v9:dispatch(v1(true, l_responseBody_0.price, l_responseBody_0.canAfford));
                return;
            else
                if v5.shouldDebugWarnings() then
                    warn("Unexpected postBundleCreationFee response body:", l_responseBody_0);
                end;
                v9:dispatch(v1(false));
                return;
            end;
        end;
        local function v14(v13) --[[ Line: 24 ]]
            -- upvalues: v9 (copy), v2 (ref), v3 (ref)
            v9:dispatch(v2(v13.Body));
            v9:dispatch(v3(false));
        end;
        v6:postBundleCreationFee(v7, v8):andThen(v12, v14);
    end;
end;