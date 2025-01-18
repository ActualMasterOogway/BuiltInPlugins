local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Thunks.GetAllPluginPermissions);
return function(v2, v3, v4, v5) --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    return function(v6) --[[ Line: 10 ]]
        -- upvalues: v4 (copy), v2 (copy), v5 (copy), v1 (ref), v3 (copy)
        local v7 = tostring(v4);
        local l_v2_Permissions_0 = v2:GetPermissions(v7);
        l_v2_Permissions_0[v5.index] = {
            Type = v5.type, 
            Data = {
                Allowed = not v5.allowed, 
                Domain = v5.data.domain
            }
        };
        v2:SetPermissions(v7, l_v2_Permissions_0);
        v6:dispatch(v1(v2, v3));
    end;
end;