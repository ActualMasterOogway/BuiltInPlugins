local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Packages.Rodux).createReducer({}, {
    ResetStore = function(_, _) --[[ Line: 12 ]] --[[ Name: ResetStore ]]
        return {};
    end, 
    SetPageSaveState = function(v4, v5) --[[ Line: 16 ]] --[[ Name: SetPageSaveState ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v4, {
            [v5.pageId] = v5.saveState
        });
    end
});