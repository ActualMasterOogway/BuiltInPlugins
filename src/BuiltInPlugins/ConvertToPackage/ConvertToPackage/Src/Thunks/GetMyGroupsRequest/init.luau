local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetMyGroups);
local v2 = require(l_Parent_0.Src.Actions.NetworkError);
local l_sendResultToKibana_0 = require(l_Parent_0.Packages.Framework).Util.sendResultToKibana;
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
return function(v5) --[[ Line: 9 ]]
    -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (copy), l_sendResultToKibana_0 (copy), v1 (copy), v2 (copy)
    return function(v6) --[[ Line: 10 ]]
        -- upvalues: v5 (copy), l_NewPackageAnalyticsWithRefactor2_0 (ref), l_sendResultToKibana_0 (ref), v1 (ref), v2 (ref)
        return v5:getMyGroups():andThen(function(v7) --[[ Line: 11 ]]
            -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), l_sendResultToKibana_0 (ref), v6 (copy), v1 (ref)
            local l_responseBody_0 = v7.responseBody;
            if l_NewPackageAnalyticsWithRefactor2_0 then
                l_sendResultToKibana_0(v7);
            end;
            v6:dispatch(v1(l_responseBody_0.data));
        end, function(v9) --[[ Line: 17 ]]
            -- upvalues: v6 (copy), v2 (ref)
            v6:dispatch(v2(v9));
        end);
    end;
end;