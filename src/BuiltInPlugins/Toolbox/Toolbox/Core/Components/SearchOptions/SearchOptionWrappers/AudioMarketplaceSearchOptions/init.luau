local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Packages_0.Framework);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_Util_0.debounce);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v12 = require(l_script_FirstAncestor_0.Core.Networking.Requests.UserSearchRequest);
local v13 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioSearch);
local v14 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.LiveSearchBar);
local v15 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.SearchOptionsEntry);
local v16 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.SearchOptionsLayout);
local v17 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.VerfifiedCreatorCheckbox);
local _ = require(l_script_FirstAncestor_0.Core.Reducers.PageInfo);
local l_RadioButtonList_0 = v5.UI.RadioButtonList;
local l_LayoutOrderIterator_0 = v5.Util.LayoutOrderIterator;
local v21 = require(l_script_FirstAncestor_0.Core.Types.BackendTypes);
local v22 = require(l_script_FirstAncestor_0.Core.Types.Category);
local _ = require(l_script_FirstAncestor_0.Core.Types.SearchOptionsTypes);
local l_game_FastInt_0 = game:GetFastInt("ToolboxLiveSearchDebounceWait");
local v25 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAddAudioTypeFiltering);
local v26 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAudioUpdateLandingPage);
game:DefineFastFlag("StudioAudioNewTrendingSort", false);
local v27 = {
    All = "All", 
    Music = "Music", 
    SoundEffect = "SoundEffect"
};
local v28 = {
    v27.All, 
    v27.Music, 
    v27.SoundEffect
};
local v29 = {
    LongestToShortest = "LongestToShortest", 
    MostUsed = "MostUsed", 
    New = "New", 
    Relevance = "Relevance", 
    ShortestToLongest = "ShortestToLongest", 
    Trending = "Trending"
};
local v30 = if game:GetFastFlag("StudioAudioNewTrendingSort") then {
    v29.Relevance, 
    v29.MostUsed, 
    v29.Trending, 
    v29.New, 
    v29.ShortestToLongest, 
    v29.LongestToShortest
} else {
    v29.Relevance, 
    v29.MostUsed, 
    v29.ShortestToLongest, 
    v29.LongestToShortest
};
local v31 = {
    [v29.Relevance] = {
        uiSortIntent = v21.UiSortIntent.Relevance
    }, 
    [v29.MostUsed] = {
        uiSortIntent = v21.UiSortIntent.MostTaken
    }, 
    [v29.Trending] = {
        uiSortIntent = v21.UiSortIntent.Trending
    }, 
    [v29.New] = {
        uiSortIntent = v21.UiSortIntent.DateCreated, 
        sortDirection = v21.SortDirection.Descending
    }, 
    [v29.ShortestToLongest] = {
        uiSortIntent = v21.UiSortIntent.Duration, 
        sortDirection = v21.SortDirection.Ascending
    }, 
    [v29.LongestToShortest] = {
        uiSortIntent = v21.UiSortIntent.Duration, 
        sortDirection = v21.SortDirection.Descending
    }
};
local function v35(v32) --[[ Line: 119 ]] --[[ Name: getSortIntentKeyFromPageInfo ]]
    -- upvalues: v21 (copy), v29 (copy), v31 (copy)
    if v32.uiSortIntent then
        if v32.uiSortIntent == v21.UiSortIntent.Duration and v32.sortDirection == nil then
            return v29.Relevance;
        else
            for v33, v34 in v31 do
                if v32.uiSortIntent == v34.uiSortIntent and (v32.sortDirection == nil or v32.sortDirection == v34.sortDirection) then
                    return v33;
                end;
            end;
        end;
    end;
    return v21.UiSortIntent.Default;
end;
local v36 = v3.PureComponent:extend("AudioMarketplaceSearchOptions");
v36.init = function(v37) --[[ Line: 175 ]] --[[ Name: init ]]
    -- upvalues: v25 (copy), v27 (copy), v7 (copy), v8 (copy), l_game_FastInt_0 (copy), v26 (copy), v31 (copy), v2 (copy), v29 (copy)
    v37.getInitState = function(v38) --[[ Line: 176 ]]
        -- upvalues: v25 (ref), v27 (ref), v7 (ref)
        return {
            audioTypeKey = if v25() then v38.initialAudioTypeKey or v27.All else nil, 
            includeUnverifiedCreators = v38.includeUnverifiedCreators, 
            minDuration = v38.minDuration or v7.MIN_AUDIO_SEARCH_DURATION, 
            maxDuration = v38.maxDuration or v7.MAX_AUDIO_SEARCH_DURATION, 
            sortIntentKey = v38.initialSortIntentKey, 
            searchTerm = v38.initialCreatorName
        };
    end;
    v37.state = v37.getInitState(v37.props);
    v37.debouncedUserSearch = v8(function(v39) --[[ Line: 191 ]]
        -- upvalues: v37 (copy)
        local l_props_0 = v37.props;
        local l_networkInterface_0 = l_props_0.Network.networkInterface;
        l_props_0.userSearch(l_networkInterface_0, v39);
    end, l_game_FastInt_0);
    v37.updateUserSearch = function(v42, v43) --[[ Line: 197 ]]
        -- upvalues: v37 (copy)
        v37:setState({
            searchTerm = v42, 
            extraSearchDetails = v43
        });
        v37.debouncedUserSearch(v42);
    end;
    v37.onSelectSortIntent = function(v44) --[[ Line: 206 ]]
        -- upvalues: v37 (copy)
        v37:setState({
            sortIntentKey = v44
        });
    end;
    v37.onSelectAudioType = function(v45) --[[ Line: 212 ]]
        -- upvalues: v25 (ref), v37 (copy)
        if v25() then
            v37:setState({
                audioTypeKey = v45
            });
        end;
    end;
    v37.onDurationChange = function(v46, v47) --[[ Line: 220 ]]
        -- upvalues: v37 (copy)
        local l_state_0 = v37.state;
        if v46 ~= l_state_0.minDuration or v47 ~= l_state_0.maxDuration then
            v37:setState({
                minDuration = v46, 
                maxDuration = v47
            });
        end;
    end;
    v37.onToggleIdVerified = function() --[[ Line: 230 ]]
        -- upvalues: v26 (ref), v37 (copy)
        if not v26() then
            v37:setState(function(v49) --[[ Line: 232 ]]
                return {
                    includeUnverifiedCreators = not v49.includeUnverifiedCreators
                };
            end);
        end;
    end;
    v37.getSearchOptions = function() --[[ Line: 240 ]]
        -- upvalues: v37 (copy), v31 (ref), v2 (ref), v7 (ref), v25 (ref), v27 (ref)
        local _ = v37.props;
        local l_state_1 = v37.state;
        local v52 = if l_state_1.sortIntentKey then v31[l_state_1.sortIntentKey] else nil;
        local v53 = if v52 then v52.uiSortIntent else v2.None;
        local v54 = if v52 and v52.sortDirection then v52.sortDirection else v2.None;
        local v55 = {
            Creator = l_state_1.searchTerm, 
            includeUnverifiedCreators = l_state_1.includeUnverifiedCreators, 
            uiSortIntent = v53, 
            sortDirection = v54
        };
        if l_state_1.minDuration ~= v7.MIN_AUDIO_SEARCH_DURATION or l_state_1.maxDuration ~= v7.MAX_AUDIO_SEARCH_DURATION then
            v55.AudioSearch = {
                minDuration = l_state_1.minDuration, 
                maxDuration = l_state_1.maxDuration
            };
        end;
        if v25() and l_state_1.audioTypeKey ~= v27.All then
            v55.AdditionalAudioSearch = v55.AdditionalAudioSearch or {};
            v55.AdditionalAudioSearch.audioType = l_state_1.audioTypeKey;
        end;
        if l_state_1.extraSearchDetails and next(l_state_1.extraSearchDetails) ~= nil then
            v55.Creator = {
                Name = l_state_1.extraSearchDetails.Name, 
                Id = l_state_1.extraSearchDetails.Id
            };
        end;
        return v55;
    end;
    v37.onReset = function() --[[ Line: 282 ]]
        -- upvalues: v37 (copy), v7 (ref), v29 (ref), v25 (ref), v27 (ref)
        v37:setState({
            includeUnverifiedCreators = false, 
            minDuration = v7.MIN_AUDIO_SEARCH_DURATION, 
            maxDuration = v7.MAX_AUDIO_SEARCH_DURATION, 
            sortIntentKey = v29.Relevance, 
            audioTypeKey = if v25() then v27.All else nil, 
            searchTerm = "", 
            extraSearchDetails = {}
        });
    end;
    v37.onClose = function() --[[ Line: 294 ]]
        -- upvalues: v37 (copy)
        v37.onReset();
        v37.props.OnClose();
    end;
end;
v36.didUpdate = function(v56, v57, _) --[[ Line: 300 ]] --[[ Name: didUpdate ]]
    -- upvalues: v25 (copy)
    v56:setState(function(_, v60) --[[ Line: 301 ]]
        -- upvalues: v25 (ref), v57 (copy), v56 (copy)
        if v25() then
            if v57.includeUnverifiedCreators ~= v60.includeUnverifiedCreators or v57.maxDuration ~= v60.maxDuration or v57.minDuration ~= v60.minDuration or (v57.pageInfo and v57.pageInfo.uiSortIntent) ~= v60.pageInfo.uiSortIntent or (v57.pageInfo and v57.pageInfo.sortDirection) ~= v60.pageInfo.sortDirection or (v57.pageInfo and v57.pageInfo.additionalAudioSearchInfo) ~= v60.pageInfo.additionalAudioSearchInfo then
                return v56.getInitState(v60);
            end;
        elseif v57.includeUnverifiedCreators ~= v60.includeUnverifiedCreators or v57.maxDuration ~= v60.maxDuration or v57.minDuration ~= v60.minDuration or (v57.pageInfo and v57.pageInfo.uiSortIntent) ~= v60.pageInfo.uiSortIntent or (v57.pageInfo and v57.pageInfo.sortDirection) ~= v60.pageInfo.sortDirection then
            return v56.getInitState(v60);
        end;
    end);
end;
v36.render = function(v61) --[[ Line: 328 ]] --[[ Name: render ]]
    -- upvalues: v30 (copy), v25 (copy), v28 (copy), v22 (copy), l_LayoutOrderIterator_0 (copy), v3 (copy), v16 (copy), v15 (copy), v26 (copy), v17 (copy), v14 (copy), v7 (copy), v13 (copy), l_RadioButtonList_0 (copy)
    local l_props_2 = v61.props;
    local l_state_2 = v61.state;
    local l_categoryName_0 = l_props_2.categoryName;
    local l_Localization_0 = l_props_2.Localization;
    local l_initialSortIntentKey_0 = l_props_2.initialSortIntentKey;
    local l_initialAudioTypeKey_0 = l_props_2.initialAudioTypeKey;
    local l_minDuration_0 = l_state_2.minDuration;
    local l_maxDuration_0 = l_state_2.maxDuration;
    local l_sortIntentKey_0 = l_state_2.sortIntentKey;
    local l_audioTypeKey_0 = l_state_2.audioTypeKey;
    local v72 = {};
    for _, v74 in v30 do
        table.insert(v72, {
            Key = v74, 
            Text = l_Localization_0:getText("SearchOptionsSort", v74)
        });
    end;
    local v75 = {};
    if v25() then
        for _, v77 in v28 do
            table.insert(v75, {
                Key = v77, 
                Text = l_Localization_0:getText("SearchOptionsType", v77)
            });
        end;
    end;
    local v78 = v22.categoryIsAudio(l_categoryName_0);
    local v79 = l_LayoutOrderIterator_0.new();
    return v3.createElement(v16, {
        GetSearchOptions = v61.getSearchOptions, 
        OnClose = v61.onClose, 
        OnReset = v61.onReset
    }, {
        Creator = v3.createElement(v15, {
            Header = l_Localization_0:getText("General", "SearchOptionCreator"), 
            LayoutOrder = v79:getNextOrder()
        }, {
            CheckboxAndDescriptionContainer = not v26() and v3.createElement(v17, {
                LayoutOrder = v79:getNextOrder(), 
                IsChecked = l_state_2.includeUnverifiedCreators, 
                OnClick = v61.onToggleIdVerified
            }), 
            SearchBar = v3.createElement(v14, {
                defaultTextKey = "SearchBarCreatorText", 
                searchTerm = l_state_2.searchTerm, 
                results = l_props_2.liveSearchData.results, 
                updateSearch = v61.updateUserSearch, 
                width = v7.SEARCH_BAR_WIDTH, 
                LayoutOrder = v79:getNextOrder()
            })
        }), 
        AudioSearchHeader = v78 and v3.createElement(v15, {
            Header = l_Localization_0:getText("General", "SearchOptionAudioLength"), 
            LayoutOrder = v79:getNextOrder()
        }, {
            AudioSearch = v3.createElement(v13, {
                minDuration = l_minDuration_0, 
                maxDuration = l_maxDuration_0, 
                onDurationChange = v61.onDurationChange
            })
        }), 
        AudioTypeSelect = v25() and v3.createElement(v15, {
            Header = l_Localization_0:getText("General", "SearchOptionAudioType"), 
            LayoutOrder = v79:getNextOrder(), 
            HideLowerSeparator = true
        }, {
            RadioButtons = v3.createElement(l_RadioButtonList_0, {
                Buttons = v75, 
                CurrentSelectedKey = l_audioTypeKey_0, 
                OnClick = v61.onSelectAudioType, 
                SelectedKey = l_initialAudioTypeKey_0
            })
        }), 
        SortBy = v3.createElement(v15, {
            Header = l_Localization_0:getText("General", "SearchOptionSort"), 
            LayoutOrder = v79:getNextOrder(), 
            HideLowerSeparator = true
        }, {
            RadioButtons = v3.createElement(l_RadioButtonList_0, {
                Buttons = v72, 
                CurrentSelectedKey = l_sortIntentKey_0, 
                SelectedKey = l_initialSortIntentKey_0, 
                OnClick = v61.onSelectSortIntent
            })
        })
    });
end;
v36 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Network = v11
})(v36);
return v4.connect(function(v80) --[[ Line: 435 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v35 (copy), v22 (copy)
    v80 = v80 or {};
    local v81 = v80.pageInfo or {};
    local v82 = v81.audioSearchInfo or {};
    local v83 = v81.additionalAudioSearchInfo or {};
    local v84 = if v80.liveSearch then {
        searchTerm = v80.liveSearch.searchTerm, 
        results = v80.liveSearch.results
    } else nil;
    local v85 = if v81.creator then v81.creator.Name else "";
    local v86 = v35(v81);
    return {
        categoryName = v81.categoryName or v22.DEFAULT.name, 
        includeUnverifiedCreators = v81.includeUnverifiedCreators, 
        initialAudioTypeKey = v83.audioType, 
        initialSortIntentKey = v86, 
        initialCreatorName = v85, 
        liveSearchData = v84, 
        maxDuration = v82.maxDuration, 
        minDuration = v82.minDuration, 
        pageInfo = v81
    };
end, function(v87) --[[ Line: 465 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy)
    return {
        userSearch = function(v88, v89) --[[ Line: 468 ]] --[[ Name: userSearch ]]
            -- upvalues: v87 (copy), v12 (ref)
            v87(v12(v88, v89));
        end
    };
end)(v36);