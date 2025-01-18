local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v5 = require(l_Actions_0.SetHomeConfiguration);
local _ = require(l_Parent_0.Core.Types.HomeTypes);
return v3.createReducer({}, {
    [v5.name] = function(v7, v8) --[[ Line: 15 ]]
        -- upvalues: v2 (copy)
        return (v2.Dictionary.join(v7, {
            [v8.assetType.Name] = v8.configuration
        }));
    end
});