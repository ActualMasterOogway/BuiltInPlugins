local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework).RobloxAPI.Url.new();
local _ = require(l_Parent_0.Src.Types);
return function(v3, v4, v5, v6) --[[ Line: 26 ]]
    -- upvalues: v1 (copy)
    local v7 = string.format("toolbox-service/v1/inventory/user/%d/%d", v4, v5.Value);
    local v8 = if v6 then {
        cursor = v6
    } else nil;
    return v3:parseJson(v3:handleRetry(v3:get((v1.composeUrl(v1.APIS_URL, v7, v8))), 5));
end;