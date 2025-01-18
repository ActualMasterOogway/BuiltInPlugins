local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Network.Http);
local l_StudioService_0 = game:GetService("StudioService");
return function(_) --[[ Line: 28 ]]
    -- upvalues: l_StudioService_0 (copy), v2 (copy), l_HttpService_0 (copy)
    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
    local v6 = {
        Url = v2.BuildRobloxUrl("groups", "v2/users/%d/groups/roles", l_l_StudioService_0_UserId_0), 
        Method = "GET"
    };
    return v2.Request(v6):andThen(function(v7) --[[ Line: 35 ]]
        -- upvalues: l_HttpService_0 (ref)
        local v8 = l_HttpService_0:JSONDecode(v7);
        local v9 = {};
        for _, v11 in pairs(v8.data) do
            if v11.role.rank == 255 then
                table.insert(v9, v11.group.id);
            end;
        end;
        return v9;
    end);
end;