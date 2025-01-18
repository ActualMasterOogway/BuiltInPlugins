local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v5 = require(l_Actions_0.SetPackagePermission);
return v3.createReducer({
    permissionsTable = {}
}, {
    [v5.name] = function(v6, v7) --[[ Line: 13 ]]
        -- upvalues: v2 (copy)
        if not v6.permissionsTable then
            v6.permissionsTable = {};
        end;
        v6.permissionsTable = v2.Dictionary.join(v6.permissionsTable, v7.packagePermissions);
        return v6;
    end
});