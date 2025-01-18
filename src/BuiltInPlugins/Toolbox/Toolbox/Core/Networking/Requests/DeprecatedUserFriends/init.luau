local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local _ = require(l_Packages_0.Framework).Util.Promise;
local v4 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v5 = {
    Name = "name", 
    Id = "id"
};
local function v10(v6) --[[ Line: 19 ]] --[[ Name: deserializeResult ]]
    -- upvalues: v4 (copy), v5 (copy)
    local v7 = {};
    for _, v9 in pairs(v6) do
        table.insert(v7, {
            [v4.SubjectNameKey] = v9[v5.Name], 
            [v4.SubjectIdKey] = v9[v5.Id]
        });
    end;
    return v7;
end;
return {
    Get = function(v11, v12) --[[ Line: 34 ]] --[[ Name: Get ]]
        -- upvalues: l_HttpService_0 (copy), v10 (copy)
        return v11:getLocalUserFriends(v12):andThen(function(v13) --[[ Line: 35 ]]
            -- upvalues: l_HttpService_0 (ref), v10 (ref)
            local v14 = l_HttpService_0:JSONDecode(v13.responseBody);
            return true, (v10(v14.data));
        end, function(_) --[[ Line: 38 ]]
            warn("Asset Config, Package Permissions, Could not fetch friends for user.");
            return {};
        end);
    end
};