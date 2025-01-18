local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = {
    PlayerAcceptance = false
};
return v1.createReducer(v3, {
    SetPlayerAcceptance = function(v4, v5) --[[ Line: 10 ]] --[[ Name: SetPlayerAcceptance ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v4, {
            PlayerAcceptance = v5.playerAcceptance
        });
    end, 
    ResetInfo = function(v6, _) --[[ Line: 16 ]] --[[ Name: ResetInfo ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            PlayerAcceptance = false
        });
    end
});