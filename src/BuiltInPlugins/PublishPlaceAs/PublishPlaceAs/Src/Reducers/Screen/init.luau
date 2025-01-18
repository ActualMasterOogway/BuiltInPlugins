local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = {
    screen = require(l_Parent_0.Src.Resources.Constants).SCREENS.CREATE_NEW_GAME
};
return v1.createReducer(v3, {
    SetScreen = function(v4, v5) --[[ Line: 11 ]] --[[ Name: SetScreen ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v4, {
            screen = v5.screen
        });
    end, 
    ResetInfo = function(v6, v7) --[[ Line: 17 ]] --[[ Name: ResetInfo ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            screen = v7.screen
        });
    end
});