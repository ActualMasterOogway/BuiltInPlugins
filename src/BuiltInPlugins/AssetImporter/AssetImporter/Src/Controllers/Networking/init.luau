local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_RobloxAPI_0 = v1.RobloxAPI;
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetManagedGroups);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = l_ContextItem_0:extend("Networking");
v6.new = function(v7, v8) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: l_RobloxAPI_0 (copy), v6 (copy)
    return (setmetatable({
        _mock = v8, 
        _store = v7, 
        api = l_RobloxAPI_0.new()
    }, v6));
end;
v6.destroy = function(v9) --[[ Line: 28 ]] --[[ Name: destroy ]]
    v9._calloutService = nil;
end;
v6.loadManagedGroups = function(v10) --[[ Line: 32 ]] --[[ Name: loadManagedGroups ]]
    if v10._mock then
        v10:loadManagedGroupsMock();
        return;
    else
        v10:loadManagedGroupsImpl();
        return;
    end;
end;
v6.loadManagedGroupsImpl = function(v11) --[[ Line: 40 ]] --[[ Name: loadManagedGroupsImpl ]]
    -- upvalues: v4 (copy)
    v11.api.Develop.V1.User.Groups.canManage():makeRequest():andThen(function(v12) --[[ Line: 43 ]]
        -- upvalues: v11 (copy), v4 (ref)
        local l_data_0 = v12.responseBody.data;
        v11._store:dispatch(v4(l_data_0));
    end, function(v14) --[[ Line: 46 ]]
        warn("Failed to fetch groups with edit permission", v14);
    end);
end;
v6.loadManagedGroupsMock = function(v15) --[[ Line: 51 ]] --[[ Name: loadManagedGroupsMock ]]
    -- upvalues: v4 (copy)
    local v16 = {
        {
            name = "Test", 
            groupId = 1
        }, 
        {
            name = "BadgeBuds", 
            groupId = 2
        }, 
        {
            name = "MyGroup", 
            groupId = 3
        }
    };
    v15._store:dispatch(v4(v16));
end;
return v6;