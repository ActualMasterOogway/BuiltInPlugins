local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.AssertType);
return require(script.Parent.Action)(script.Name, function(v3) --[[ Line: 8 ]]
    -- upvalues: v2 (copy)
    v2.assertNullableType(v3, "table", "SetGroupInfo arg");
    local v4 = v3 or {};
    local l_groups_0 = v4.groups;
    v2.assertNullableType(l_groups_0, "table", "SetGroupInfo.groups");
    local l_ownedGroups_0 = v4.ownedGroups;
    v2.assertNullableType(l_ownedGroups_0, "table", "SetGroupInfo.ownedGroups");
    return {
        groupInfo = {
            groups = l_groups_0, 
            ownedGroups = l_ownedGroups_0
        }
    };
end);