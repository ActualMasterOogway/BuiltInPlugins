local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Packages.Rodux).createReducer({
    game = nil, 
    gameId = nil
}, {
    ResetStore = function(_, _) --[[ Line: 13 ]] --[[ Name: ResetStore ]]
        return {};
    end, 
    SetGameId = function(v4, v5) --[[ Line: 17 ]] --[[ Name: SetGameId ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v4, {
            gameId = v5.gameId
        });
    end, 
    SetGame = function(v6, v7) --[[ Line: 23 ]] --[[ Name: SetGame ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v6, {
            game = v7.game
        });
    end
});