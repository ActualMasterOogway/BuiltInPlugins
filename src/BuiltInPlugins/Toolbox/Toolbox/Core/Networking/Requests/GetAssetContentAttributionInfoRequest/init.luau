local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Core.Actions.GetAssetContentAttributionInfo);
return function(v5, v6) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), v3 (copy), l_HttpService_0 (copy), v2 (copy)
    return function(v7) --[[ Line: 9 ]]
        -- upvalues: v6 (copy), v4 (ref), v3 (ref), v5 (copy), l_HttpService_0 (ref), v2 (ref)
        if not v6 then
            v7:dispatch(v4(v3.None, v3.None));
            return;
        else
            local v8 = nil;
            local v9 = nil;
            v5:getUniverseInfo(v6):andThen(function(v10) --[[ Line: 19 ]]
                -- upvalues: l_HttpService_0 (ref), v8 (ref), v3 (ref), v9 (ref), v7 (copy), v4 (ref)
                local v11 = l_HttpService_0:JSONDecode(v10.responseBody);
                v8 = v11.name or v3.None;
                v9 = v11.rootPlaceId or v3.None;
                v7:dispatch(v4(v8, v9));
            end, function(v12) --[[ Line: 24 ]]
                -- upvalues: v7 (copy), v2 (ref)
                v7:dispatch(v2(v12));
            end);
            return;
        end;
    end;
end;