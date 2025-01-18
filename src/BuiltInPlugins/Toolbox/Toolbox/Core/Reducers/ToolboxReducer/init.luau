local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Rodux);
local v4 = require(l_Parent_0.Core.Util.DebugFlags);
local l_Reducers_0 = l_Parent_0.Core.Reducers;
local v6 = require(l_Reducers_0.Assets);
local v7 = require(l_Reducers_0.Dialog);
local v8 = require(l_Reducers_0.Groups);
local v9 = require(l_Reducers_0.Autocomplete);
local v10 = require(l_Reducers_0.NetworkErrors);
local v11 = require(l_Reducers_0.PageInfo);
local v12 = require(l_Reducers_0.ReducerLogger);
local v13 = require(l_Reducers_0.Sound);
local v14 = require(l_Reducers_0.VotingReducer);
local v15 = require(l_Reducers_0.TutorialLimitsReducer);
local v16 = require(l_Reducers_0.LiveSearch);
local v17 = require(l_Reducers_0.Favorite);
local v18 = require(l_Reducers_0.RolesReducer);
local v19 = require(l_Reducers_0.ItemTagsReducer);
local v20 = require(l_Reducers_0.Purchase);
local v21 = require(l_Reducers_0.Packages);
local v22 = require(l_Reducers_0.TryInStudio);
local v23 = require(l_Reducers_0.HomeConfiguration);
local v24 = v3.combineReducers({
    assets = v6, 
    autocompleteResults = v9, 
    dialog = v7, 
    groups = if v1() then v8 else nil, 
    homeConfiguration = v23, 
    networkErrors = v10, 
    pageInfo = v11, 
    sound = v13, 
    voting = v14, 
    liveSearch = v16, 
    favorite = v17, 
    roles = v18, 
    itemTags = v19, 
    purchase = v20, 
    packages = v21, 
    tryInStudio = v22, 
    tutorialLimits = v15
});
return function(v25, v26) --[[ Line: 53 ]]
    -- upvalues: v4 (copy), v12 (copy), v24 (copy)
    if v4.shouldDebugState() then
        return v12(v24, v25, v26);
    else
        return v24(v25, v26);
    end;
end;