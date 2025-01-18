local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Cryo);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_Util_0.debounce);
local l_deepEqual_0 = v4.Util.deepEqual;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v13 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v14 = require(l_script_FirstAncestor_0.Core.Components.AssetQualityFilter.AssetQualityFilter);
local v15 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.LiveSearchBar);
local v16 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.SearchOptionsEntry);
local v17 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.SearchOptionsLayout);
local v18 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.VerfifiedCreatorCheckbox);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v20 = require(l_script_FirstAncestor_0.Core.Networking.Requests.UserSearchRequest);
local l_showRobloxCreatedAssets_0 = require(l_script_FirstAncestor_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v22 = require(l_script_FirstAncestor_0.Core.Types.Category);
local _ = require(l_script_FirstAncestor_0.Core.Types.SearchOptionsTypes);
local l_game_FastInt_0 = game:GetFastInt("ToolboxLiveSearchDebounceWait");
local v25 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local v26 = v2.PureComponent:extend("MarketplaceSearchOptions");
v26.init = function(v27) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v8 (copy), l_game_FastInt_0 (copy), v5 (copy)
    v27.getInitState = function(v28) --[[ Line: 77 ]]
        -- upvalues: v7 (ref)
        return {
            includeUnverifiedCreators = v28.includeUnverifiedCreators, 
            minDuration = v28.minDuration or v7.MIN_AUDIO_SEARCH_DURATION, 
            maxDuration = v28.maxDuration or v7.MAX_AUDIO_SEARCH_DURATION, 
            searchTerm = v28.initialCreatorName, 
            qualityFilterData = v28.qualityFilterData
        };
    end;
    v27.state = v27.getInitState(v27.props);
    v27.debouncedUserSearch = v8(function(v29, _) --[[ Line: 90 ]]
        -- upvalues: v27 (copy)
        local l_props_0 = v27.props;
        l_props_0.userSearch(l_props_0.Network.networkInterface, v29);
    end, l_game_FastInt_0);
    v27.updateUserSearch = function(v32, v33) --[[ Line: 97 ]]
        -- upvalues: v27 (copy)
        local _ = v27.props;
        v27:setState({
            searchTerm = v32, 
            extraSearchDetails = v33
        });
        v27.debouncedUserSearch(v32, v33);
    end;
    v27.onToggleIdVerified = function() --[[ Line: 107 ]]
        -- upvalues: v27 (copy)
        v27:setState(function(v35) --[[ Line: 108 ]]
            return {
                includeUnverifiedCreators = not v35.includeUnverifiedCreators
            };
        end);
    end;
    v27.onToggleQualityFilter = function(v36) --[[ Line: 115 ]]
        -- upvalues: v27 (copy), v5 (ref)
        v27:setState(function(v37) --[[ Line: 116 ]]
            -- upvalues: v5 (ref), v36 (copy)
            return {
                qualityFilterData = v5.Dictionary.join(v37.qualityFilterData, {
                    [v36] = v37.qualityFilterData[v36] ~= true or v5.None
                })
            };
        end);
    end;
    v27.getSearchOptions = function() --[[ Line: 125 ]]
        -- upvalues: v27 (copy)
        local l_state_0 = v27.state;
        local v39 = {
            Creator = l_state_0.searchTerm, 
            includeUnverifiedCreators = l_state_0.includeUnverifiedCreators, 
            qualityFilterData = l_state_0.qualityFilterData
        };
        if l_state_0.extraSearchDetails and next(l_state_0.extraSearchDetails) ~= nil then
            v39.Creator = {
                Name = l_state_0.extraSearchDetails.Name, 
                Id = l_state_0.extraSearchDetails.Id
            };
        end;
        return v39;
    end;
    v27.onReset = function() --[[ Line: 145 ]]
        -- upvalues: v27 (copy), v7 (ref)
        v27:setState({
            includeUnverifiedCreators = false, 
            minDuration = v7.MIN_AUDIO_SEARCH_DURATION, 
            maxDuration = v7.MAX_AUDIO_SEARCH_DURATION, 
            searchTerm = "", 
            extraSearchDetails = {}, 
            qualityFilterData = {}
        });
    end;
    v27.onClose = function() --[[ Line: 156 ]]
        -- upvalues: v27 (copy)
        v27.onReset();
        v27.props.OnClose();
    end;
end;
v26.didMount = function(v40) --[[ Line: 162 ]] --[[ Name: didMount ]]
    v40.searchTerm = v40.props.liveSearchData.searchTerm;
end;
v26.didUpdate = function(v41, v42, _) --[[ Line: 167 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_deepEqual_0 (copy)
    v41:setState(function(_, v45) --[[ Line: 168 ]]
        -- upvalues: v42 (copy), l_deepEqual_0 (ref), v41 (copy)
        if v42.includeUnverifiedCreators ~= v45.includeUnverifiedCreators or v42.initialCreatorName ~= v45.initialCreatorName or v42.maxDuration ~= v45.maxDuration or v42.minDuration ~= v45.minDuration or not l_deepEqual_0(v42.qualityFilterData, v45.qualityFilterData) then
            return v41.getInitState(v45);
        else
            return;
        end;
    end);
end;
v26.render = function(v46) --[[ Line: 181 ]] --[[ Name: render ]]
    -- upvalues: l_showRobloxCreatedAssets_0 (copy), v25 (copy), v22 (copy), l_LayoutOrderIterator_0 (copy), v2 (copy), v17 (copy), v16 (copy), v18 (copy), v15 (copy), v7 (copy), v14 (copy)
    local l_props_2 = v46.props;
    local l_state_1 = v46.state;
    local l_categoryName_0 = l_props_2.categoryName;
    local l_liveSearchData_0 = l_props_2.liveSearchData;
    local l_Localization_0 = l_props_2.Localization;
    local v52 = not l_showRobloxCreatedAssets_0();
    local v53 = if v25() then v22.categoryIsModel(l_categoryName_0) else nil;
    local v54 = l_LayoutOrderIterator_0.new();
    return v2.createElement(v17, {
        GetSearchOptions = v46.getSearchOptions, 
        OnClose = v46.onClose, 
        OnReset = v46.onReset
    }, {
        AllViews = v2.createElement(v16, {
            Header = l_Localization_0:getText("General", "SearchOptionsAllViews"), 
            LayoutOrder = v54:getNextOrder()
        }, {
            CheckboxAndDescriptionContainer = v2.createElement(v18, {
                IsChecked = l_state_1.includeUnverifiedCreators, 
                OnClick = v46.onToggleIdVerified
            })
        }), 
        Creator = v52 and v2.createElement(v16, {
            Header = l_Localization_0:getText("General", "SearchOptionCreator"), 
            LayoutOrder = v54:getNextOrder()
        }, {
            SearchBar = v2.createElement(v15, {
                defaultTextKey = "SearchBarCreatorText", 
                searchTerm = l_state_1.searchTerm, 
                results = l_liveSearchData_0.results, 
                updateSearch = v46.updateUserSearch, 
                width = v7.SEARCH_BAR_WIDTH
            })
        }), 
        QualityFilters = v53 and v2.createElement(v14, {
            CheckedState = l_state_1.qualityFilterData, 
            OnToggleFilter = v46.onToggleQualityFilter
        }, {})
    });
end;
v26 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Settings = v12, 
    Network = v13
})(v26);
return v3.connect(function(v55, _) --[[ Line: 238 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v25 (copy), v22 (copy)
    v55 = v55 or {};
    local v57 = v55.pageInfo or {};
    local v58 = nil;
    if v55.liveSearch then
        v58 = {
            searchTerm = v55.liveSearch.searchTerm, 
            results = v55.liveSearch.results
        };
    end;
    local v59 = if v57.creator then v57.creator.Name else "";
    local v60 = if v25() and v57.qualityFilterData then v57.qualityFilterData else {};
    return {
        categoryName = v57.categoryName or v22.DEFAULT.name, 
        includeUnverifiedCreators = v57.includeUnverifiedCreators, 
        initialCreatorName = v59, 
        liveSearchData = v58, 
        qualityFilterData = v60
    };
end, function(v61) --[[ Line: 264 ]]
    -- upvalues: v20 (copy)
    return {
        userSearch = function(v62, v63) --[[ Line: 267 ]] --[[ Name: userSearch ]]
            -- upvalues: v61 (copy), v20 (ref)
            v61(v20(v62, v63));
        end
    };
end)(v26);