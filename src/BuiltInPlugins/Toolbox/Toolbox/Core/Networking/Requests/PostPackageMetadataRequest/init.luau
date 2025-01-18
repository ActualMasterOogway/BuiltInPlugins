local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = game:GetService("HttpService");
local l_Actions_0 = l_Parent_0.Core.Actions;
local v3 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v4 = require(l_Actions_0.SetIsPackage);
local v5 = require(l_Actions_0.NetworkError);
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (copy), v3 (copy), v4 (copy), v5 (copy)
    return function(v9) --[[ Line: 13 ]]
        -- upvalues: v7 (copy), v8 (copy), l_NewPackageAnalyticsWithRefactor2_0 (ref), v3 (ref), v4 (ref), v5 (ref)
        return v7:postForPackageMetadata(v8):andThen(function(v10) --[[ Line: 14 ]]
            -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), v3 (ref), v9 (copy), v4 (ref)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                v3.sendResultToKibana(v10);
            end;
            local v11 = v10.responseBody.data[1];
            if v11 and v11.assetId and v11.assetVersionNumber then
                v9:dispatch(v4(true));
                return;
            else
                v9:dispatch(v4(false));
                return;
            end;
        end, function(v12) --[[ Line: 24 ]]
            -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), v3 (ref), v9 (copy), v4 (ref), v5 (ref)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                v3.sendResultToKibana(v12);
            end;
            v9:dispatch(v4(false));
            v9:dispatch(v5(v12));
        end);
    end;
end;