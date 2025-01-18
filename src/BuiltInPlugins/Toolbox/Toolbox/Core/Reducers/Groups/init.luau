local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Rodux);
local _ = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Dash);
local _ = require(l_script_FirstAncestor_0.Core.Types.GroupTypes);
local v6 = require(l_script_FirstAncestor_0.Core.Actions.SetManageableGroups);
local v7 = {
    manageableGroups = nil
};
return v2.createReducer(v7, {
    [v6.name] = function(v8, v9) --[[ Line: 22 ]]
        -- upvalues: v4 (copy)
        return v4.join(v8, {
            manageableGroups = v9.manageableGroups
        });
    end
});