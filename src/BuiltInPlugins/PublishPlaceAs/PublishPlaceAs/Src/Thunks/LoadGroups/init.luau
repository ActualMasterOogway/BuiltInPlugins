local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetGroupInfo);
local v2 = require(l_Parent_0.Src.Network.Requests.ApiFetchGroupsHavePermission);
local v3 = require(l_Parent_0.Src.Network.Requests.ApiFetchOwnedGroups);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return function(v4) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (ref)
        v4:dispatch(v1({
            groups = {}
        }));
        v2():andThen(function(v5) --[[ Line: 14 ]]
            -- upvalues: v4 (copy), v1 (ref), v3 (ref)
            local v6 = {};
            for _, v8 in pairs(v5.groups) do
                table.insert(v6, v8.id);
            end;
            v4:dispatch(v1({
                groups = v5.groups
            }));
            return v3(v6);
        end):andThen(function(v9) --[[ Line: 22 ]]
            -- upvalues: v4 (copy), v1 (ref)
            v4:dispatch(v1({
                ownedGroups = v9
            }));
        end):catch(function(_) --[[ Line: 25 ]]
            error("Failed to fetch groups with edit permission");
        end);
    end;
end;