local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v2 = require(l_script_FirstAncestor_0.Src.Networking.Http);
local v3 = require(l_script_FirstAncestor_0.Src.Networking.Models.Group);
return function() --[[ Line: 12 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy), v3 (copy)
    local v4 = {
        Url = v2.BuildRobloxUrl("develop", "v1/user/groups/canmanage"), 
        Method = "GET"
    };
    return v2.Request(v4):andThen(function(v5) --[[ Line: 17 ]]
        -- upvalues: l_HttpService_0 (ref), v3 (ref)
        local v6 = l_HttpService_0:JSONDecode(v5);
        local v7 = {
            groups = {}
        };
        for _, v9 in v6.data do
            local v10, v11 = v3.fromJsonData(v9);
            if v10 then
                table.insert(v7.groups, v11);
            else
                error((("Parsing error for ApiFetchGroupsCanManage: %*"):format(v11)));
            end;
        end;
        return v7;
    end);
end;