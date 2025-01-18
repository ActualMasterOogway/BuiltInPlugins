local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local _ = require(l_Packages_0.Framework).Util.Promise;
local v3 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v4 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local v5 = require(l_script_FirstAncestor_0.Core.Actions.SetSellerStatus);
return function(v6) --[[ Line: 11 ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    return function(v7) --[[ Line: 12 ]]
        -- upvalues: v6 (copy), v5 (ref), v3 (ref), v4 (ref)
        return v6:getSellerStatus():andThen(function(v8) --[[ Line: 13 ]]
            -- upvalues: v7 (copy), v5 (ref), v3 (ref)
            local v9 = if v8 then v8.responseBody else nil;
            if v9 then
                v7:dispatch(v5(v9));
                return;
            else
                if v3.shouldDebugWarnings() then
                    warn("No seller status data was given in the response body");
                end;
                return;
            end;
        end, function(v10) --[[ Line: 22 ]]
            -- upvalues: v3 (ref), v7 (copy), v4 (ref)
            if v3.shouldDebugWarnings() then
                warn("Unable to fetch seller status data");
            end;
            v7:dispatch(v4(v10));
        end);
    end;
end;