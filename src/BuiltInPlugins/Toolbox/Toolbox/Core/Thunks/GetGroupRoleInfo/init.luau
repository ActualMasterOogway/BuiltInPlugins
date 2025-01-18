local l_HttpService_0 = game:GetService("HttpService");
local l_Actions_0 = script.Parent.Parent.Parent.Core.Actions;
local v2 = require(l_Actions_0.SetGroupRoleInfo);
return function(v3, v4) --[[ Line: 8 ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: v3 (copy), v4 (copy), l_HttpService_0 (ref), v2 (ref)
        return v3:getGroupRoleInfo(v4):andThen(function(v6) --[[ Line: 10 ]]
            -- upvalues: l_HttpService_0 (ref), v5 (copy), v2 (ref)
            local l_responseBody_0 = v6.responseBody;
            local v8 = l_HttpService_0:JSONDecode(l_responseBody_0);
            v5:dispatch(v2(v8.roles));
        end, function(_) --[[ Line: 15 ]]

        end);
    end;
end;