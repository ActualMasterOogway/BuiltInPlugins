local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Resources.Constants);
local v4 = {
    placeInfo = {
        places = {}, 
        parentGame = {}, 
        queryState = v3.QUERY_STATE.QUERY_STATE_NONE
    }, 
    gameInfo = {
        games = {}, 
        queryState = v3.QUERY_STATE.QUERY_STATE_NONE
    }, 
    selectedGame = {}, 
    gameConfiguration = {
        optInRegions = {}
    }
};
return v1.createReducer(v4, {
    SetChooseGameQueryState = function(v5, v6) --[[ Line: 14 ]] --[[ Name: SetChooseGameQueryState ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v5, {
            gameInfo = v2.Dictionary.join(v5.gameInfo, v6.gameInfo)
        });
    end, 
    SetSelectedGame = function(v7, v8) --[[ Line: 20 ]] --[[ Name: SetSelectedGame ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, {
            selectedGame = v8.selectedGame
        });
    end, 
    SetGameInfo = function(v9, v10) --[[ Line: 26 ]] --[[ Name: SetGameInfo ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v9, {
            gameInfo = v2.Dictionary.join(v9.gameInfo, v10.gameInfo)
        });
    end, 
    SetPlaceInfo = function(v11, v12) --[[ Line: 32 ]] --[[ Name: SetPlaceInfo ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v11, {
            placeInfo = v2.Dictionary.join(v11.placeInfo, v12.placeInfo)
        });
    end, 
    SetChoosePlaceQueryState = function(v13, v14) --[[ Line: 38 ]] --[[ Name: SetChoosePlaceQueryState ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v13, {
            placeInfo = v2.Dictionary.join(v13.placeInfo, v14.placeInfo)
        });
    end, 
    ResetInfo = function(v15, v16) --[[ Line: 44 ]] --[[ Name: ResetInfo ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v15, {
            gameInfo = v2.Dictionary.join(v15.gameInfo, v16.gameInfo), 
            placeInfo = v2.Dictionary.join(v15.placeInfo, v16.placeInfo)
        });
    end, 
    SetGameConfiguration = function(v17, v18) --[[ Line: 51 ]] --[[ Name: SetGameConfiguration ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v17, {
            gameConfiguration = v2.Dictionary.join(v17.gameConfiguration, v18.gameConfiguration)
        });
    end
});