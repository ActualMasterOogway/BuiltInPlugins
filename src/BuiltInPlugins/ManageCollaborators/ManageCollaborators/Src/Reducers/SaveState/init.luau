local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SetSaveState);
return v1.createReducer({}, {
    ResetStore = function(_, _) --[[ Line: 9 ]] --[[ Name: ResetStore ]]
        return {};
    end, 
    [v4.name] = function(v7, v8) --[[ Line: 13 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, {
            CurrentSaveState = v8.saveState
        });
    end
});