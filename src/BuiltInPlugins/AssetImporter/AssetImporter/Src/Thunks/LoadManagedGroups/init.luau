local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
local v2 = require(l_script_FirstAncestor_0.Src.Networking.Requests.ApiFetchGroupsHavePermission);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetManagedGroups);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixGroupFetch);
return function() --[[ Line: 15 ]]
    -- upvalues: v4 (copy), v1 (copy), v2 (copy), v3 (copy)
    return function(v5) --[[ Line: 16 ]]
        -- upvalues: v4 (ref), v1 (ref), v2 (ref), v3 (ref)
        assert(not v4(), "Do not call if FFlagImportQueueFixGroupFetch is true");
        if v1.isCli() then
            return;
        else
            v2():andThen(function(v6) --[[ Line: 24 ]]
                -- upvalues: v5 (copy), v3 (ref)
                v5:dispatch(v3(v6.groups));
            end, function(_) --[[ Line: 26 ]]
                warn("Failed to fetch groups with edit permission");
            end);
            return;
        end;
    end;
end;