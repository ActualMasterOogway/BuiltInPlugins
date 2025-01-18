local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Networking.Http);
local l_webKeys_0 = require(script.Parent.Constants).webKeys;
return {
    Get = function(v4) --[[ Line: 20 ]] --[[ Name: Get ]]
        -- upvalues: v2 (copy), l_HttpService_0 (copy), l_webKeys_0 (copy)
        local v5 = {};
        local v6 = {
            Url = v2.BuildRobloxUrl("groups", "v1/groups/%d/roles", v4), 
            Method = "GET"
        };
        return v2.Request(v6):andThen(function(v7) --[[ Line: 28 ]]
            -- upvalues: l_HttpService_0 (ref), v5 (copy), l_webKeys_0 (ref)
            local v8 = l_HttpService_0:JSONDecode(v7);
            for _, v10 in pairs(v8.roles) do
                table.insert(v5, {
                    [l_webKeys_0.RoleName] = v10.name, 
                    [l_webKeys_0.RoleId] = v10.id, 
                    [l_webKeys_0.RoleRank] = v10.rank
                });
            end;
            return v5;
        end);
    end
};