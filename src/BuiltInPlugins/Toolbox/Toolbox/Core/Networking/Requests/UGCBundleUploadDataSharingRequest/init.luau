local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
local v2 = require(l_Actions_0.NetworkError);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v4 = require(l_Util_0.DebugFlags);
local function _(v5, v6, v7) --[[ Line: 9 ]] --[[ Name: ProcessCreationContextErrorResponse ]]
    -- upvalues: v4 (copy), v2 (copy)
    if v4.shouldDebugWarnings() then
        warn("Failed here -- Could not post UGC Bundle consent and received response:", v7);
    end;
    v5:dispatch(v2(v6:getText("AssetConfig", "ValidationErrorUnknown")));
end;
return function(v9, v10, v11, v12) --[[ Line: 17 ]]
    -- upvalues: v4 (copy), v2 (copy)
    return function(v13) --[[ Line: 18 ]]
        -- upvalues: v9 (copy), v10 (copy), v11 (copy), v4 (ref), v12 (copy), v2 (ref)
        return v9:postCreateBundleDataSharing(v10, v11):andThen(function() --[[ Line: 21 ]]
            -- upvalues: v4 (ref)
            if v4.shouldDebugWarnings() then
                warn("UGC Bundle consent post succeeded");
            end;
        end):catch(function(v14) --[[ Line: 26 ]]
            -- upvalues: v13 (copy), v12 (ref), v4 (ref), v2 (ref)
            local l_v13_0 = v13;
            local l_v12_0 = v12;
            if v4.shouldDebugWarnings() then
                warn("Failed here -- Could not post UGC Bundle consent and received response:", v14);
            end;
            l_v13_0:dispatch(v2(l_v12_0:getText("AssetConfig", "ValidationErrorUnknown")));
        end);
    end;
end;