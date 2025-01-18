local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = {
    selectedGroup = 0
};
return v1.createReducer(v3, {
    SetSelectedGroup = function(v4, v5) --[[ Line: 10 ]] --[[ Name: SetSelectedGroup ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v4, {
            selectedGroup = v5.selectedGroup
        });
    end
});