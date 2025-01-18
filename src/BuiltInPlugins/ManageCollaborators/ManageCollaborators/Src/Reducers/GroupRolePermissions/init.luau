local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SetGroupRolePermissions);
local function _() --[[ Line: 8 ]] --[[ Name: getDefaultState ]]
    return {
        PermissionsByRole = {}
    };
end;
return v1.createReducer({
    PermissionsByRole = {}
}, {
    ResetStore = function(_, _) --[[ Line: 15 ]] --[[ Name: ResetStore ]]
        return {
            PermissionsByRole = {}
        };
    end, 
    [v4.name] = function(v8, v9) --[[ Line: 19 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            PermissionsByRole = v9.groupRolePermissions
        });
    end
});