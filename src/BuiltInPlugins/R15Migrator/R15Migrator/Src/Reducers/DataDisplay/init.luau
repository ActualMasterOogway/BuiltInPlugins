local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetSortSelection);
local function _() --[[ Line: 8 ]] --[[ Name: getInitialState ]]
    return {
        sortSelection = nil
    };
end;
return (v1.createReducer({
    sortSelection = nil
}, {
    [v4.name] = function(v6, v7) --[[ Line: 16 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            sortSelection = v7.sortSelection
        });
    end
}));