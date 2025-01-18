local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.ReactUtils);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Cryo);
local v5 = require(l_Parent_0.Src.Util.SharedTypes);
local l_Analytics_0 = v3.ContextServices.Analytics;
local l_Localization_0 = v3.ContextServices.Localization;
local v8 = v3.Util.LayoutOrderIterator.new();
local l_joinTags_0 = v3.Styling.joinTags;
local l_useToggleState_0 = v2.useToggleState;
local l_SectionHeaderType_0 = v5.SectionHeaderType;
local v12 = require(l_Parent_0.Src.Contexts.ActivityHistoryContext);
local v13 = require(l_Parent_0.Src.Components.FilterMenu);
local v14 = require(l_Parent_0.Src.Components.ActivityHistoryBubbleList);
local v15 = require(l_Parent_0.Src.Components.Tooltip);
local v16 = require(l_Parent_0.Src.Components.EnableTeamCreate);
local v17 = require(l_Parent_0.Src.Hooks.BidirectionalInfiniteScroll);
local v18 = require(l_Parent_0.Src.Hooks.UsernameCache);
local l_game_FastInt_0 = game:GetFastInt("ActivityFeedBDISFetchSensitivity");
local l_game_FastInt_1 = game:GetFastInt("ActivityFeedBDISMinEvents");
local l_game_FastInt_2 = game:GetFastInt("ActivityFeedRefreshMs");
local l_ActivityHistoryFeatureTelemetry_0 = game:GetFastFlag("ActivityHistoryFeatureTelemetry");
local v23 = {
    AllEvents = "All Events", 
    FilterMenu = "Filter Menu"
};
return function(v24) --[[ Line: 53 ]] --[[ Name: ActivityHistoryMain ]]
    -- upvalues: v1 (copy), v12 (copy), l_Localization_0 (copy), l_Analytics_0 (copy), v23 (copy), l_ActivityHistoryFeatureTelemetry_0 (copy), l_useToggleState_0 (copy), v4 (copy), v18 (copy), l_SectionHeaderType_0 (copy), v13 (copy), v17 (copy), l_game_FastInt_1 (copy), l_game_FastInt_0 (copy), l_game_FastInt_2 (copy), l_joinTags_0 (copy), v8 (copy), v15 (copy), v16 (copy), v14 (copy)
    local v25 = v1.useContext(v12);
    local v26 = l_Localization_0:use();
    local v27 = l_Analytics_0:use();
    local v28, v29 = v1.useState(v23.AllEvents);
    local v30, v31 = v1.useState({});
    local v32 = nil;
    local v33 = nil;
    if l_ActivityHistoryFeatureTelemetry_0 then
        local v34, v35 = v25.usePlaceAndUniverseId();
        v32 = v34;
        v33 = v35;
    else
        local v36, v37 = v25.DEPRECATED_usePlaceAndUniverseId(v24.plugin);
        v32 = v36;
        v33 = v37;
    end;
    local v38 = v1.useRef({});
    local v39 = l_useToggleState_0(false);
    local v40 = v1.useMemo(function() --[[ Line: 72 ]]
        -- upvalues: v38 (copy)
        return function() --[[ Line: 73 ]]
            -- upvalues: v38 (ref)
            v38.current = {};
        end;
    end, {});
    local v45 = v1.useMemo(function() --[[ Line: 78 ]]
        -- upvalues: v38 (copy), v27 (copy), v32 (ref), v33 (ref)
        return function() --[[ Line: 79 ]]
            -- upvalues: v38 (ref), v27 (ref), v32 (ref), v33 (ref)
            local v41 = 0;
            local v42 = v38.current or {};
            for _, _ in pairs(v42) do
                v41 = v41 + 1;
            end;
            v27:report("bubblesSeenOnSessionEnd", v41, v32, v33);
        end;
    end, {
        v38
    });
    local v50 = v1.useMemo(function() --[[ Line: 89 ]]
        -- upvalues: v38 (copy), v27 (copy), v32 (ref), v33 (ref)
        return function() --[[ Line: 90 ]]
            -- upvalues: v38 (ref), v27 (ref), v32 (ref), v33 (ref)
            local v46 = 0;
            local v47 = v38.current or {};
            for _, _ in pairs(v47) do
                v46 = v46 + 1;
            end;
            v27:report("bubblesSeenOnSessionEnd", v46, v32, v33);
        end;
    end, {
        v38, 
        v32, 
        v33
    });
    if l_ActivityHistoryFeatureTelemetry_0 then
        v25.useConnectToDataModelSessionEffect(v40, v50);
    else
        v25.useConnectToDataModelSessionEffect(v40, v45);
    end;
    local v52 = v1.useCallback(function(v51) --[[ Line: 106 ]]
        -- upvalues: v38 (copy), v4 (ref)
        v38.current = v4.Dictionary.join(v38.current, v51);
    end, {
        v38
    });
    local v53 = v18();
    v1.useEffect(function() --[[ Line: 112 ]]
        -- upvalues: v30 (copy), v53 (copy)
        local v54 = {};
        for v55, _ in pairs(v30) do
            table.insert(v54, v55);
        end;
        v53.fetchUsernames(v54);
    end, {
        v30, 
        v53.fetchUsernames
    });
    local v57 = nil;
    v57 = v1.useCallback(function(v58, v59, v60, v61, v62, v63) --[[ Line: 122 ]]
        -- upvalues: v25 (copy), v32 (ref), v33 (ref), v31 (copy), v4 (ref), l_SectionHeaderType_0 (ref)
        v25.activityHistoryClient.fetchActivityHistory(v32, v33, v59 ~= "" and v59 or nil, v60, v61, function(v64) --[[ Line: 136 ]]
            -- upvalues: v31 (ref), v4 (ref), v61 (copy), v63 (copy), l_SectionHeaderType_0 (ref), v58 (copy), v62 (copy)
            local v65 = {};
            for _, v67 in pairs(v64.responseBody.events) do
                v65[v67.userId] = true;
            end;
            v31(function(v68) --[[ Line: 142 ]]
                -- upvalues: v4 (ref), v65 (copy)
                return v4.Dictionary.join(v68, v65);
            end);
            local l_events_0 = v64.responseBody.events;
            local v70 = if not v61 and v64.responseBody.hasMore and #l_events_0 > 0 then v64.responseBody.nextCursor else nil;
            local v71 = if v61 and v64.responseBody.hasMore and #l_events_0 > 0 then v64.responseBody.nextCursor else nil;
            if v63 ~= nil and v63.DaysAgo ~= nil and v63.DaysAgo > 0 then
                if v63.FirstFetch then
                    v63.FirstFetch = false;
                    if l_events_0[1] ~= nil then
                        l_events_0[1].headerType = l_SectionHeaderType_0.Middle;
                    end;
                elseif not v64.responseBody.hasMore and v61 and l_events_0[1] ~= nil then
                    l_events_0[1].headerType = l_SectionHeaderType_0.Top;
                end;
            end;
            v58(l_events_0, v70, v71, v61, v62);
        end);
    end, {
        v25.activityHistoryClient, 
        v32, 
        v33
    });
    local v72 = v1.useMemo(function() --[[ Line: 179 ]]
        -- upvalues: v13 (ref), v53 (copy), v26 (copy)
        return v13.getFilterEmptyState(v53.cache, v26);
    end, {
        v53.cache, 
        v26
    });
    local v73, v74 = v1.useState(v72);
    local v75, v76 = v1.useState(function() --[[ Line: 184 ]]
        -- upvalues: v13 (ref), v72 (copy), v32 (ref), v26 (copy)
        return v13.filterOptionsToFilterFn(v72, v32, v26);
    end);
    local v77, v78 = v1.useState({
        shortString = v26:getText("ActivityHistoryMain", "AllEvents"), 
        descriptiveStrings = {}
    });
    local v79 = #v77.descriptiveStrings > 0;
    local v80 = v17(v57, v75, l_game_FastInt_1, l_game_FastInt_0, l_game_FastInt_2);
    local v84 = v1.useCallback(function(v81) --[[ Line: 202 ]]
        -- upvalues: v31 (copy), v4 (ref), v80 (copy)
        local v82 = {
            [v81.userId] = true
        };
        v31(function(v83) --[[ Line: 204 ]]
            -- upvalues: v4 (ref), v82 (copy)
            return v4.Dictionary.join(v83, v82);
        end);
        v80.addNewEvent(v81);
    end, {
        v80.addNewEvent
    });
    if l_ActivityHistoryFeatureTelemetry_0 then
        v1.useEffect(v25.activityHistoryClient.activityFeedRTEEffect(v25, v33, v84), {
            v25, 
            v33, 
            v84
        });
    else
        v1.useEffect(v25.activityHistoryClient.DEPRECATED_activityFeedRTEEffect(v24.plugin, v33, v84), {
            v24.plugin, 
            v33, 
            v84
        });
    end;
    local v98 = v1.useCallback(function() --[[ Line: 232 ]]
        -- upvalues: v13 (ref), v72 (copy), v73 (copy), v80 (copy), v76 (copy), v32 (ref), v26 (copy), v53 (copy), v78 (copy), v27 (copy), v33 (ref), v29 (copy), v23 (ref)
        local v85 = v13.mergeFilterOptions(v72, v73);
        local v86 = v13.getUnixMsFromDateIndex(v85.JumpToDateIndex);
        local v87 = v13.getNumDaysFromDateIndex(v85.JumpToDateIndex);
        if v87 > 0 then
            v80.jumpToDate(v86, {
                DaysAgo = v87, 
                FirstFetch = true
            });
        else
            v80.jumpToDate(nil);
        end;
        v76(function() --[[ Line: 247 ]]
            -- upvalues: v13 (ref), v85 (copy), v32 (ref), v26 (ref)
            return v13.filterOptionsToFilterFn(v85, v32, v26);
        end);
        local v88 = v13.filterOptionsToStrings(v85, v26, v53.cache);
        if #v88.shortString == 0 then
            v78({
                shortString = v26:getText("ActivityHistoryMain", "AllEvents"), 
                descriptiveStrings = {}
            });
        else
            v78(v88);
        end;
        local v89 = 0;
        local v90 = 0;
        local v91 = 0;
        local v92 = 0;
        local v93 = "";
        for v94, _ in pairs(v85.EventCategories) do
            if v85.EventCategories[v94] then
                if #v93 > 0 then
                    v93 = v93 .. ",";
                end;
                v91 = v91 + 1;
                v93 = v93 .. v94;
            end;
            v92 = v92 + 1;
        end;
        for v96, _ in pairs(v85.Collaborators) do
            if v85.Collaborators[v96] then
                v89 = v89 + 1;
            end;
            v90 = v90 + 1;
        end;
        v27:report("applyFilters", v89, v90, v91, v92, v93, v87, v32, v33);
        v29(v23.AllEvents);
    end, {
        v73, 
        v80.jumpToDate, 
        v76, 
        v26, 
        v53.cache, 
        v78, 
        v72
    });
    local v100 = v1.useCallback(function() --[[ Line: 312 ]]
        -- upvalues: v27 (copy), v32 (ref), v33 (ref), v74 (copy), v13 (ref), v72 (copy), v76 (copy), v26 (copy), v78 (copy), v80 (copy), v29 (copy), v23 (ref)
        v27:report("clearFilters", v32, v33);
        v74(function(v99) --[[ Line: 314 ]]
            -- upvalues: v13 (ref), v72 (ref), v76 (ref), v32 (ref), v26 (ref), v78 (ref), v80 (ref)
            if not v13.compareFilterOptions(v99, v72) then
                v76(function() --[[ Line: 317 ]]
                    -- upvalues: v13 (ref), v72 (ref), v32 (ref), v26 (ref)
                    return v13.filterOptionsToFilterFn(v72, v32, v26);
                end);
                v78({
                    shortString = v26:getText("ActivityHistoryMain", "AllEvents"), 
                    descriptiveStrings = {}
                });
                v80.jumpToDate(nil);
                return v72;
            else
                return v99;
            end;
        end);
        v29(v23.AllEvents);
    end, {
        v74, 
        v76, 
        v78, 
        v26, 
        v32, 
        v80.jumpToDate, 
        v72
    });
    local v103 = v1.useCallback(function(v101) --[[ Line: 346 ]]
        -- upvalues: v74 (copy), v13 (ref)
        v74(function(v102) --[[ Line: 347 ]]
            -- upvalues: v13 (ref), v101 (copy)
            if not v13.compareFilterOptions(v102, v101) then
                return v13.mergeFilterOptions(v102, v101);
            else
                return v102;
            end;
        end);
    end, {
        v74
    });
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Column", "Component-ActivityHistoryMain")
    }, {
        EventList = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("X-Column", "CX-Invisible"), 
            LayoutOrder = v8:getNextOrder(), 
            Visible = v28 == v23.AllEvents
        }, {
            Header = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0(v39.enabled and "HeaderHovered" or nil, not v24.isPublishedGame and "HeaderDisabled" or nil), 
                [v1.Event.MouseEnter] = v39.enable, 
                [v1.Event.MouseLeave] = v39.disable
            }, {
                Tooltip = if v39.enabled and v79 then v1.createElement(v15, {
                    Fragments = v77.descriptiveStrings
                }) else nil, 
                FilterHeader = v1.createElement("TextButton", {
                    [v1.Tag] = l_joinTags_0("X-Row", "CX-Invisible"), 
                    [v1.Event.Activated] = function() --[[ Line: 380 ]]
                        -- upvalues: v29 (copy), v23 (ref)
                        v29(v23.FilterMenu);
                    end, 
                    Text = "", 
                    LayoutOrder = v8:getNextOrder()
                }, {
                    FilterHeaderText = v1.createElement("TextLabel", {
                        [v1.Tag] = l_joinTags_0("X-Fit", "CX-Invisible"), 
                        Text = v77.shortString, 
                        LayoutOrder = v8:getNextOrder()
                    }), 
                    HeaderIcons = v1.createElement("Frame", {
                        [v1.Tag] = l_joinTags_0("X-Row", "CX-Invisible"), 
                        LayoutOrder = v8:getNextOrder()
                    }, {
                        ClearFiltersIconContainer = if not v79 then nil else v1.createElement("Frame", {
                            [v1.Tag] = l_joinTags_0("CX-Invisible", "HeaderIcon"), 
                            LayoutOrder = v8:getNextOrder()
                        }, {
                            ClearFiltersIcon = v1.createElement("ImageButton", {
                                [v1.Event.Activated] = v100, 
                                LayoutOrder = v8:getNextOrder()
                            })
                        }), 
                        FilterHeaderIconContainer = v1.createElement("Frame", {
                            [v1.Tag] = l_joinTags_0("CX-Invisible", "HeaderIcon"), 
                            LayoutOrder = v8:getNextOrder()
                        }, {
                            FilterHeaderIcon = v1.createElement("ImageLabel", {
                                LayoutOrder = v8:getNextOrder()
                            })
                        })
                    })
                })
            }), 
            ActivityHistoryBubbleListContainer = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("CX-Invisible"), 
                LayoutOrder = v8:getNextOrder()
            }, {
                ActivityHistoryBubbleList = if not v24.isPublishedGame then v1.createElement(v16, {}) else v1.createElement(v14, {
                    [v1.Tag] = ".ActivityHistoryBubbleList", 
                    Vlref = v80.vlref, 
                    Events = v80.eventList, 
                    IndexOffset = 1e999, 
                    OnViewableItemsChanged = v52, 
                    OnScroll = v80.onScroll, 
                    ShowHeaderLoadingIndicator = v80.fetchPreviousPageInProgress, 
                    ShowFooterLoadingIndicator = v80.fetchNextPageInProgress, 
                    OpenFiltersFn = function() --[[ Line: 434 ]] --[[ Name: OpenFiltersFn ]]
                        -- upvalues: v29 (copy), v23 (ref)
                        v29(v23.FilterMenu);
                    end
                })
            })
        }), 
        FilterMenu = v1.createElement("Frame", {
            LayoutOrder = v8:getNextOrder(), 
            Visible = v28 ~= v23.AllEvents
        }, {
            FilterMenu = v1.createElement(v13.FilterMenu, {
                collaborators = v53.cache, 
                selectedFilters = v73, 
                onApply = v98, 
                onClear = v100, 
                onChange = v103
            })
        })
    });
end;