local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v2 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local v3 = require(l_script_FirstAncestor_0.Core.Actions.SetCodeSummaryForAsset);
return function(v4, v5) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return function(v6) --[[ Line: 13 ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (ref), v1 (ref), v2 (ref)
        return v4:getCodeSummary(v5):andThen(function(v7) --[[ Line: 14 ]]
            -- upvalues: v6 (copy), v3 (ref), v5 (ref)
            local l_responseBody_0 = v7.responseBody;
            if l_responseBody_0 and l_responseBody_0.codeSummary and l_responseBody_0.codeSummary ~= "" then
                v6:dispatch(v3(v5, l_responseBody_0.codeSummary));
            end;
        end, function(v9) --[[ Line: 19 ]]
            -- upvalues: v1 (ref), v5 (ref), v6 (copy), v2 (ref)
            if v1.shouldDebugWarnings() then
                warn(("Could not get Code Understanding Summary for %d"):format(v5));
            end;
            v6:dispatch(v2(v9));
        end);
    end;
end;