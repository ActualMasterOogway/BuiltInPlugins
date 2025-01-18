local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local v2 = require(l_script_FirstAncestor_0.Libs.Http.StatusCodes);
local v3 = require(l_script_FirstAncestor_0.Core.Actions.SetFiatProduct);
local v4 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
local v5 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
return function(v6, v7, v8) --[[ Line: 9 ]]
    -- upvalues: v5 (copy), v3 (copy), v2 (copy), v4 (copy), v1 (copy)
    return function(v9) --[[ Line: 10 ]]
        -- upvalues: v6 (copy), v7 (copy), v8 (copy), v5 (ref), v3 (ref), v2 (ref), v4 (ref), v1 (ref)
        v6:getFiatProduct(v7, v8):andThen(function(v10) --[[ Line: 11 ]]
            -- upvalues: v5 (ref), v9 (copy), v3 (ref), v7 (ref)
            if v5.shouldDebugUrls() then
                print("getFiatProduct Response: ", v10);
            end;
            local l_responseBody_0 = v10.responseBody;
            v9:dispatch(v3(v7, l_responseBody_0));
        end, function(v12) --[[ Line: 17 ]]
            -- upvalues: v2 (ref), v4 (ref), v9 (copy), v3 (ref), v7 (ref), v1 (ref)
            if v12.responseCode == v2.NOT_FOUND then
                local v13 = v4.getDefaultFiatProduct();
                v9:dispatch(v3(v7, v13));
                return;
            else
                v9:dispatch(v1(v12));
                return;
            end;
        end);
    end;
end;