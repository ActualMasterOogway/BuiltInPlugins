local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Parent_0.Core.Util.Constants);
local v6 = require(l_Parent_0.Core.Util.getTimeString);
local v7 = require(l_Parent_0.Core.ContextServices.Settings);
local v8 = require(l_Parent_0.Core.Types.Category);
local v9 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v13 = require(l_Packages_0.Cryo);
local l_deepCopy_0 = v4.Util.deepCopy;
local l_Pane_0 = v4.UI.Pane;
local v16 = require(l_Parent_0.Core.Components.Autocorrect.Autocorrect);
local v17 = require(l_Parent_0.Core.Networking.Requests.SearchWithOptions);
local v18 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v19 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v20 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAudioTypeFiltering);
local v21 = v2.PureComponent:extend("MainViewHeader");
local v22 = require(l_Parent_0.Core.Components.SearchOptions.SearchTags);
v21.init = function(v23) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy), v13 (copy), l_deepCopy_0 (copy), v5 (copy), v20 (copy)
    v23.onTagsCleared = function() --[[ Line: 35 ]]
        -- upvalues: v23 (copy), v19 (ref), v13 (ref)
        local l_networkInterface_0 = v23.props.Network.networkInterface;
        local v25 = v23.props.Settings:get("Plugin");
        local v26 = if v19() then {
            Creator = "", 
            AudioSearch = v13.None, 
            AdditionalAudioSearch = v13.None, 
            includeUnverifiedCreators = false, 
            creatorTargetIds = {}, 
            groupTargetIds = {}, 
            uiSortIntent = v13.None
        } else {
            Creator = "", 
            AudioSearch = v13.None, 
            AdditionalAudioSearch = v13.None, 
            includeUnverifiedCreators = false, 
            uiSortIntent = v13.None
        };
        v23.props.searchWithOptions(l_networkInterface_0, v25, v26);
    end;
    v23.onCreatorCleared = function() --[[ Line: 59 ]]
        -- upvalues: v23 (copy)
        local l_networkInterface_1 = v23.props.Network.networkInterface;
        local v28 = v23.props.Settings:get("Plugin");
        local l_includeUnverifiedCreators_0 = v23.props.includeUnverifiedCreators;
        v23.props.searchWithOptions(l_networkInterface_1, v28, {
            Creator = "", 
            AudioSearch = v23.props.audioSearchInfo, 
            AdditionalAudioSearch = v23.props.additionalAudioSearchInfo, 
            includeUnverifiedCreators = l_includeUnverifiedCreators_0
        });
    end;
    v23.onCreatorTargetIdRemoved = v19() and function(v30) --[[ Line: 74 ]]
        -- upvalues: v23 (copy), l_deepCopy_0 (ref)
        local l_props_0 = v23.props;
        local l_networkInterface_2 = l_props_0.Network.networkInterface;
        local v33 = l_props_0.Settings:get("Plugin");
        local v34 = tostring(v30.tagId);
        local l_includeUnverifiedCreators_1 = l_props_0.includeUnverifiedCreators;
        local v36 = l_deepCopy_0(l_props_0.creatorTargetIds);
        local v37 = l_deepCopy_0(l_props_0.groupTargetIds);
        local l_uiSortIntent_0 = l_props_0.uiSortIntent;
        v36[v34] = nil;
        v23.props.searchWithOptions(l_networkInterface_2, v33, {
            creatorTargetIds = v36, 
            groupTargetIds = v37, 
            includeUnverifiedCreators = l_includeUnverifiedCreators_1, 
            uiSortIntent = l_uiSortIntent_0
        });
    end or function() --[[ Line: 95 ]]

    end;
    v23.onGroupTargetIdRemoved = v19() and function(v39) --[[ Line: 98 ]]
        -- upvalues: v23 (copy), l_deepCopy_0 (ref)
        local l_props_1 = v23.props;
        local l_networkInterface_3 = l_props_1.Network.networkInterface;
        local v42 = l_props_1.Settings:get("Plugin");
        local v43 = tostring(v39.tagId);
        local l_includeUnverifiedCreators_2 = l_props_1.includeUnverifiedCreators;
        local v45 = l_deepCopy_0(l_props_1.creatorTargetIds);
        local v46 = l_deepCopy_0(l_props_1.groupTargetIds);
        local l_uiSortIntent_1 = l_props_1.uiSortIntent;
        v46[v43] = nil;
        v23.props.searchWithOptions(l_networkInterface_3, v42, {
            creatorTargetIds = v45, 
            groupTargetIds = v46, 
            includeUnverifiedCreators = l_includeUnverifiedCreators_2, 
            uiSortIntent = l_uiSortIntent_1
        });
    end or function() --[[ Line: 119 ]]

    end;
    v23.createOptions = function() --[[ Line: 121 ]]
        -- upvalues: v23 (copy)
        local l_creator_0 = v23.props.creator;
        local l_includeUnverifiedCreators_3 = v23.props.includeUnverifiedCreators;
        return {
            Creator = l_creator_0 and l_creator_0.Name or "", 
            AudioSearch = v23.props.audioSearchInfo, 
            AdditionalAudioSearch = v23.props.additionalAudioSearchInfo, 
            includeUnverifiedCreators = l_includeUnverifiedCreators_3
        };
    end;
    v23.clearAdditionalAudioSearchByKeys = function(v50) --[[ Line: 133 ]]
        -- upvalues: v23 (copy)
        local l_networkInterface_4 = v23.props.Network.networkInterface;
        local v52 = v23.props.Settings:get("Plugin");
        local v53 = v23.createOptions();
        for _, v55 in ipairs(v50) do
            v53.AdditionalAudioSearch[v55] = nil;
        end;
        if next(v53.AdditionalAudioSearch) == nil then
            v53.AdditionalAudioSearch = nil;
        end;
        v23.props.searchWithOptions(l_networkInterface_4, v52, v53);
    end;
    v23.onAudioSearchArtistCleared = function() --[[ Line: 148 ]]
        -- upvalues: v23 (copy), v5 (ref)
        v23.clearAdditionalAudioSearchByKeys({
            v5.ADDITIONAL_AUDIO_SEARCH_KEYS.ARTIST
        });
    end;
    v23.onAudioSearchCategoriesCleared = function() --[[ Line: 152 ]]
        -- upvalues: v23 (copy), v5 (ref)
        v23.clearAdditionalAudioSearchByKeys({
            v5.ADDITIONAL_AUDIO_SEARCH_KEYS.CATEGORIES
        });
    end;
    v23.onAudioSearchGenreCleared = function() --[[ Line: 156 ]]
        -- upvalues: v23 (copy), v5 (ref)
        v23.clearAdditionalAudioSearchByKeys({
            v5.ADDITIONAL_AUDIO_SEARCH_KEYS.GENRE
        });
    end;
    v23.onAudioSearchAlbumCleared = function() --[[ Line: 160 ]]
        -- upvalues: v23 (copy), v5 (ref)
        v23.clearAdditionalAudioSearchByKeys({
            v5.ADDITIONAL_AUDIO_SEARCH_KEYS.ALBUM
        });
    end;
    v23.onAudioSearchTypeCleared = function() --[[ Line: 164 ]]
        -- upvalues: v20 (ref), v23 (copy), v5 (ref)
        if v20() then
            v23.clearAdditionalAudioSearchByKeys({
                v5.ADDITIONAL_AUDIO_SEARCH_KEYS.AUDIO_TYPE
            });
        end;
    end;
    v23.onAudioSearchCleared = function() --[[ Line: 170 ]]
        -- upvalues: v23 (copy), v13 (ref)
        local l_networkInterface_5 = v23.props.Network.networkInterface;
        local v57 = v23.props.Settings:get("Plugin");
        local v58 = v23.createOptions();
        v58.AudioSearch = v13.None;
        v23.props.searchWithOptions(l_networkInterface_5, v57, v58);
    end;
    v23.onIsVerifiedCleared = function() --[[ Line: 180 ]]
        -- upvalues: v23 (copy)
        local l_networkInterface_6 = v23.props.Network.networkInterface;
        local v60 = v23.props.Settings:get("Plugin");
        local l_creator_1 = v23.props.creator;
        local v62 = {
            Creator = l_creator_1 and l_creator_1.Name or "", 
            AudioSearch = v23.props.audioSearchInfo, 
            includeUnverifiedCreators = false
        };
        v23.props.searchWithOptions(l_networkInterface_6, v60, v62);
    end;
    v23.onSortIntentRemoved = function() --[[ Line: 193 ]]
        -- upvalues: v23 (copy), v13 (ref)
        local l_networkInterface_7 = v23.props.Network.networkInterface;
        local v64 = v23.props.Settings:get("Plugin");
        local v65 = v23.createOptions();
        v65.uiSortIntent = v13.None;
        v23.props.searchWithOptions(l_networkInterface_7, v64, v65);
    end;
end;
v21.render = function(v66) --[[ Line: 204 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v18 (copy), v5 (copy), v19 (copy), v20 (copy), v2 (copy), v22 (copy), v9 (copy), v16 (copy), l_Pane_0 (copy)
    local l_props_2 = v66.props;
    local v68 = l_props_2.searchTerm or "";
    local l_Name_0 = l_props_2.creatorFilter.Name;
    local l_includeUnverifiedCreators_4 = l_props_2.includeUnverifiedCreators;
    local l_uiSortIntent_2 = l_props_2.uiSortIntent;
    local l_sortDirection_0 = l_props_2.sortDirection;
    local v73 = nil;
    local l_audioSearchInfo_0 = l_props_2.audioSearchInfo;
    if l_audioSearchInfo_0 and l_audioSearchInfo_0.maxDuration and l_audioSearchInfo_0.minDuration then
        v73 = v6(l_audioSearchInfo_0.minDuration, nil) .. " - " .. v6(l_audioSearchInfo_0.maxDuration, nil);
    end;
    local v75 = l_props_2.containerWidth or 0;
    local v76 = if v18() then l_props_2.headerHeight else 0;
    local v77 = {};
    if l_props_2.showTags then
        if not v18() then
            v76 = v76 + v5.SEARCH_TERMS_HEIGHT;
        end;
        local v78 = v66.props.Localization:getText("General", "SearchTagCreator");
        local v79 = v66.props.Localization:getText("General", "SearchTagLength");
        local v80 = v66.props.Localization:getText("General", "SearchTagIdUnverified");
        local v81 = {};
        if l_Name_0 then
            table.insert(v81, {
                prefix = v78, 
                text = l_Name_0, 
                onDelete = v66.onCreatorCleared
            });
        end;
        if v19() and next(l_props_2.creatorTargetIds) then
            for _, v83 in pairs(l_props_2.creatorTargetIds) do
                table.insert(v81, {
                    prefix = v78, 
                    text = v83.Name, 
                    onDelete = v66.onCreatorTargetIdRemoved, 
                    tagId = v83.Id
                });
            end;
        end;
        if v19() and next(l_props_2.groupTargetIds) then
            for _, v85 in pairs(l_props_2.groupTargetIds) do
                table.insert(v81, {
                    prefix = v78, 
                    text = v85.Name, 
                    onDelete = v66.onGroupTargetIdRemoved, 
                    tagId = v85.Id
                });
            end;
        end;
        if v73 then
            table.insert(v81, {
                prefix = v79, 
                text = v73, 
                onDelete = v66.onAudioSearchCleared
            });
        end;
        local v86 = l_props_2.additionalAudioSearchInfo or {};
        if v86.artist then
            table.insert(v81, {
                prefix = v66.props.Localization:getText("AudioView", "Artist") .. ":", 
                text = v86.artist, 
                onDelete = v66.onAudioSearchArtistCleared
            });
        end;
        if v86.categories then
            local v87 = {};
            for _, v89 in ipairs(v86.categories) do
                table.insert(v87, v66.props.Localization:getText("Audio.SoundEffect.Category", v89));
            end;
            table.insert(v81, {
                prefix = v66.props.Localization:getText("AudioView", "Category") .. ":", 
                text = table.concat(v87, " - "), 
                onDelete = v66.onAudioSearchCategoriesCleared
            });
        end;
        if v86.genre then
            table.insert(v81, {
                prefix = v66.props.Localization:getText("General", "Genre") .. ":", 
                text = v66.props.Localization:getText("Audio.Music.Genre", v86.genre), 
                onDelete = v66.onAudioSearchGenreCleared
            });
        end;
        if v86.album then
            table.insert(v81, {
                prefix = v66.props.Localization:getText("AudioView", "Album") .. ":", 
                text = v86.album, 
                onDelete = v66.onAudioSearchAlbumCleared
            });
        end;
        if v20() and v86.audioType then
            local v90 = v66.props.Localization:getText("SearchOptionsType", v86.audioType);
            table.insert(v81, {
                prefix = v66.props.Localization:getText("AudioView", "Type") .. ":", 
                text = v90, 
                onDelete = v66.onAudioSearchTypeCleared
            });
        end;
        if l_uiSortIntent_2 then
            local v91 = v66.props.Localization:getText("UiSortIntent", l_uiSortIntent_2);
            local v92 = if l_sortDirection_0 then v66.props.Localization:getText("SortDirection", l_sortDirection_0) else nil;
            table.insert(v81, {
                prefix = v66.props.Localization:getText("General", "SearchOptionSort") .. ":", 
                text = if v92 then ("%*, %*"):format(v91, v92) else v91, 
                onDelete = v66.onSortIntentRemoved
            });
        end;
        if l_includeUnverifiedCreators_4 or l_Name_0 or v73 then
            table.insert(v81, {
                prefix = v80, 
                text = "", 
                onDelete = v66.onIsVerifiedCleared
            });
        end;
        v77.SearchTags = v2.createElement(v22, {
            Tags = v81, 
            onClearTags = v66.onTagsCleared, 
            searchTerm = v68, 
            categoryName = l_props_2.categoryName, 
            onBackToHome = l_props_2.onBackToHome, 
            LayoutOrder = 1
        });
        local v93 = if v18() then l_props_2.correctionState == v9.AutocorrectResponseState.CorrectionAvailable and l_props_2.correctedQuery ~= "" else nil;
        local v94 = if v18() then l_props_2.correctionState == v9.AutocorrectResponseState.CorrectionAccepted and l_props_2.userQuery ~= "" else nil;
        local v95 = v18() and (v93 or v94);
        if v18() and next(v81) ~= nil and not v95 then
            v76 = v76 + v5.MAIN_VIEW_VERTICAL_PADDING;
        end;
        v77.Autocorrect = if v95 then v2.createElement(v16, {
            CorrectedQuery = l_props_2.correctedQuery, 
            CorrectionState = l_props_2.correctionState, 
            CurrentQuery = v68, 
            LayoutOrder = 2, 
            UserQuery = l_props_2.userQuery
        }) else nil;
    end;
    if not v18() then
        v76 = math.max(v76, v5.MAIN_VIEW_NO_HEADER_HEIGHT);
    end;
    return v2.createElement(if v18() then l_Pane_0 else "Frame", {
        Position = UDim2.new(0, 0, 0, -2), 
        Size = UDim2.new(0, v75, 0, v76), 
        BackgroundTransparency = 1, 
        HorizontalAlignment = if v18() then Enum.HorizontalAlignment.Left else nil, 
        Layout = if v18() then Enum.FillDirection.Vertical else nil, 
        VerticalAlignment = if v18() then Enum.VerticalAlignment.Top else nil, 
        ZIndex = 2
    }, v77);
end;
v21 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Settings = v7, 
    Network = v12
})(v21);
return v3.connect(function(v96, _) --[[ Line: 408 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v13 (copy), v8 (copy), v19 (copy), v18 (copy)
    local v98 = (v96 or {}).pageInfo or {};
    local v99 = if v98.creatorTargetIds and v98.creatorTargetIds ~= v13.None then v98.creatorTargetIds else {};
    local v100 = if v98.groupTargetIds and v98.groupTargetIds ~= v13.None then v98.groupTargetIds else {};
    local v101 = if v98.uiSortIntent and v98.uiSortIntent ~= v13.None then v98.uiSortIntent else nil;
    local v102 = if v98.sortDirection and v98.sortDirection ~= v13.None then v98.sortDirection else nil;
    return {
        audioSearchInfo = v98.audioSearchInfo, 
        additionalAudioSearchInfo = v98.additionalAudioSearchInfo, 
        creator = v98.creator, 
        categoryName = v98.categoryName or v8.DEFAULT.name, 
        searchTerm = v98.searchTerm or "", 
        includeUnverifiedCreators = v98.includeUnverifiedCreators, 
        creatorFilter = v98.creator or {}, 
        creatorTargetIds = if v19() then v99 else nil, 
        groupTargetIds = if v19() then v100 else nil, 
        uiSortIntent = if v19() then v101 else nil, 
        sortDirection = v102, 
        correctionState = if v18() then v98.correctionState else nil, 
        correctedQuery = if v18() then v98.correctedQuery else nil, 
        userQuery = if v18() then v98.userQuery else nil
    };
end, function(v103) --[[ Line: 446 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v17 (copy)
    return {
        searchWithOptions = function(v104, v105, v106) --[[ Line: 448 ]] --[[ Name: searchWithOptions ]]
            -- upvalues: v103 (copy), v17 (ref)
            v103(v17(v104, v105, v106));
        end
    };
end)(v21);