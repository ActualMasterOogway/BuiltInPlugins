local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local v4 = require(l_Parent_0.Core.Actions.SetAutocompleteResults);
return v3.createReducer({
    autocompleteResults = {}
}, {
    [v4.name] = function(v5, v6) --[[ Line: 12 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v5, {
            autocompleteResults = v6.autocompleteResults
        });
    end
});