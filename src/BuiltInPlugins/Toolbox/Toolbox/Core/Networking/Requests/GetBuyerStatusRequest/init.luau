local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local v3 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v4 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local v5 = require(l_script_FirstAncestor_0.Core.Actions.SetBuyerStatus);
return function(v6) --[[ Line: 11 ]]
    -- upvalues: l_Promise_0 (copy), v5 (copy), v3 (copy), v4 (copy)
    return function(v7) --[[ Line: 12 ]]
        -- upvalues: l_Promise_0 (ref), v6 (copy), v5 (ref), v3 (ref), v4 (ref)
        local v8 = v7:getState();
        if v8.purchase and v8.purchase.buyerStatus then
            return l_Promise_0.resolve();
        else
            return v6:getPurchaserStatus():andThen(function(v9) --[[ Line: 19 ]]
                -- upvalues: v7 (copy), v5 (ref)
                local v10 = if v9 then v9.responseBody else nil;
                local v11 = if v10 then v10.purchaserStatus else nil;
                if v11 then
                    v7:dispatch(v5(v11));
                end;
            end, function(v12) --[[ Line: 25 ]]
                -- upvalues: v3 (ref), v7 (copy), v4 (ref)
                if v3.shouldDebugWarnings() then
                    warn("Unable to fetch purchaser status data");
                end;
                v7:dispatch(v4(v12));
            end);
        end;
    end;
end;