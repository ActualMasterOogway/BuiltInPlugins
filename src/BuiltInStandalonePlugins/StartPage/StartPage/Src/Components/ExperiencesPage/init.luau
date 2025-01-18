local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local l_useContext_0 = v1.useContext;
local v5 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)();
local v6 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v7 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPagePlaceOpenAttributionTelemetry)();
local v8 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAlertForUsersTextChat)();
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v12 = require(l_script_FirstAncestor_0.Src.Components.InfoTile);
local v13 = if v5 then require(l_script_FirstAncestor_0.Src.Components.NetworkView) else require(l_script_FirstAncestor_0.Src.Components.DEPRECATED_NetworkView);
local v14 = require(l_script_FirstAncestor_0.Src.Components.GamePage);
local v15 = require(l_script_FirstAncestor_0.Src.Components.NoResultsFoundPage);
local v16 = if v5 then require(l_script_FirstAncestor_0.Src.Network.DiscoverGroups) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverGroups);
local v17 = if v5 then require(l_script_FirstAncestor_0.Src.Network.DiscoverExperiences) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverExperiences);
local v18 = if v5 then require(l_script_FirstAncestor_0.Src.Network.DiscoverRecents) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverRecents);
local v19 = require(l_script_FirstAncestor_0.Src.Network.DiscoverCreatorEligibilityAndOpenPlace);
local v20 = require(l_script_FirstAncestor_0.Src.Util.Dialogs);
local v21 = require(l_script_FirstAncestor_0.Src.Util.SortingOptions);
local v22 = require(l_script_FirstAncestor_0.Src.Util.Services);
local l_StartPageManager_0 = v22.StartPageManager;
local l_StudioService_0 = v22.StudioService;
local v25 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v26 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.StartPageTelemetryEvent);
local v27 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAtomicTestsFixes);
local v28 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageWrappedTitles)();
local v29 = UDim2.new(0, 200, 0, 200);
local v30 = UDim2.new(0, 225, 0, v28 and 325 or 295);
local v31 = UDim2.new(0, 225, 0, v28 and 348 or 318);
local function v33() --[[ Line: 96 ]] --[[ Name: getSortingDropdowns ]]
    -- upvalues: l_Localization_0 (copy), v21 (copy)
    local v32 = l_Localization_0:use();
    return {
        {
            DropdownLabel = v32:getText("Plugin", "SortOptions.Alphabetical"), 
            Key = "GameName", 
            Query = {
                sortParam = v21.GameName, 
                sortOrder = v21.Asc
            }
        }, 
        {
            DropdownLabel = v32:getText("Plugin", "SortOptions.Created"), 
            Key = "GameCreatedAsc", 
            Query = {
                sortParam = v21.GameCreated, 
                sortOrder = v21.Asc
            }
        }, 
        {
            DropdownLabel = v32:getText("Plugin", "SortOptions.CreatedDescending"), 
            Key = "GameCreatedDesc", 
            Query = {
                sortParam = v21.GameCreated, 
                sortOrder = v21.Desc
            }
        }, 
        {
            DropdownLabel = v32:getText("Plugin", "SortOptions.Modified"), 
            Key = "LastUpdated", 
            Query = {
                sortParam = v21.LastUpdated, 
                sortOrder = v21.Desc
            }
        }
    };
end;
local v34 = {
    searchKey = "Experiences", 
    isArchived = false, 
    isTemplates = false, 
    pageSize = 30
};
local function v40(v35) --[[ Line: 141 ]] --[[ Name: PageComponent ]]
    -- upvalues: l_join_0 (copy), v34 (copy), v1 (copy), v13 (copy), v12 (copy), v29 (copy)
    local v36 = l_join_0(v34, v35.BaseQuery or {});
    return v1.createElement(v13, l_join_0({
        Query = l_join_0(v36, v35.NetworkQuery), 
        CellSize = v35.CellSize, 
        CellComponent = function(v37) --[[ Line: 149 ]] --[[ Name: CellComponent ]]
            -- upvalues: v1 (ref), v12 (ref), l_join_0 (ref), v29 (ref), v35 (copy)
            return v1.createElement(v12, l_join_0(v37, {
                ImageSize = v29, 
                OnClick = function(v38) --[[ Line: 154 ]] --[[ Name: OnClick ]]
                    -- upvalues: v35 (ref)
                    v35.OnClick(v38);
                end, 
                IsPrivacyVisible = v35.IsPrivacyVisible, 
                IsDateModifiedVisible = v35.IsDateModifiedVisible, 
                IsDropdownMenuVisible = v35.IsDropdownMenuVisible, 
                IsCreatorNameVisible = v35.IsCreatorNameVisible, 
                KebabMenu = v35.KebabMenu
            }));
        end, 
        FetchItems = v35.FetchItems, 
        AdjustQuery = function(v39) --[[ Line: 168 ]] --[[ Name: AdjustQuery ]]
            -- upvalues: l_join_0 (ref), v36 (copy)
            l_join_0(v36, v39);
        end
    }, v35.NetworkViewProps));
end;
local function v45(v41) --[[ Line: 175 ]] --[[ Name: OwnedPageComponent ]]
    -- upvalues: v25 (copy), l_useContext_0 (copy), v20 (copy), v1 (copy), v40 (copy), v30 (copy), v17 (copy), v27 (copy), l_StudioService_0 (copy), v19 (copy), v7 (copy), v26 (copy)
    local v42 = v25:use();
    local v43 = l_useContext_0(v20);
    return v1.createElement(v40, {
        BaseQuery = v41.BaseQuery, 
        IsPrivacyVisible = true, 
        IsDateModifiedVisible = true, 
        IsDropdownMenuVisible = true, 
        IsCreatorNameVisible = false, 
        KebabMenu = {
            "ConfigureExperience", 
            "ConfigurePlace", 
            "OpenPlace", 
            "PublicPrivateToggle", 
            "Archive"
        }, 
        CellSize = v30, 
        FetchItems = v17, 
        NetworkQuery = {
            creatorType = "User", 
            creatorTargetId = if v27() then tostring(l_StudioService_0:GetUserId()) else l_StudioService_0:GetUserId()
        }, 
        OnClick = function(v44) --[[ Line: 200 ]] --[[ Name: OnClick ]]
            -- upvalues: v19 (ref), l_StudioService_0 (ref), v43 (copy), v7 (ref), v42 (copy), v26 (ref)
            if not v44.IsPlaceholder and v44.Id and v44.RootPlaceId then
                v19(l_StudioService_0:GetUserId(), v44.Id, v44.RootPlaceId, v43.showVerifyAge, v43.showAgeRestricted);
                if v7 then
                    v42:log(v26, {
                        telemetryType = "interaction", 
                        telemetrySubtype = "place_open", 
                        action = "experiences_owned_tab"
                    });
                end;
            end;
        end, 
        NetworkViewProps = v41
    });
end;
local function v51(v46) --[[ Line: 222 ]] --[[ Name: GroupPageComponent ]]
    -- upvalues: v25 (copy), l_Localization_0 (copy), l_useContext_0 (copy), v20 (copy), v1 (copy), v40 (copy), v30 (copy), v17 (copy), v19 (copy), l_StudioService_0 (copy), v7 (copy), v26 (copy), v5 (copy), v15 (copy), l_join_0 (copy)
    local v47 = v25:use();
    local v48 = l_Localization_0:use();
    local v49 = l_useContext_0(v20);
    if v46.BaseQuery and v46.BaseQuery.creatorTargetId then
        return v1.createElement(v40, {
            BaseQuery = v46.BaseQuery, 
            IsPrivacyVisible = true, 
            IsDateModifiedVisible = true, 
            IsDropdownMenuVisible = true, 
            IsCreatorNameVisible = false, 
            KebabMenu = {
                "ConfigureExperience", 
                "ConfigurePlace", 
                "OpenPlace", 
                "PublicPrivateToggle", 
                "Archive"
            }, 
            CellSize = v30, 
            FetchItems = v17, 
            NetworkQuery = {
                creatorType = "Group"
            }, 
            OnClick = function(v50) --[[ Line: 246 ]] --[[ Name: OnClick ]]
                -- upvalues: v19 (ref), l_StudioService_0 (ref), v49 (copy), v7 (ref), v47 (copy), v26 (ref)
                if not v50.IsPlaceholder and v50.Id and v50.RootPlaceId then
                    v19(l_StudioService_0:GetUserId(), v50.Id, v50.RootPlaceId, v49.showVerifyAge, v49.showAgeRestricted);
                    if v7 then
                        v47:log(v26, {
                            telemetryType = "interaction", 
                            telemetrySubtype = "place_open", 
                            action = "experiences_group_tab"
                        });
                    end;
                end;
            end, 
            NetworkViewProps = v46
        });
    else
        if not v5 then
            v46.InitialContentHasLoaded(0);
        end;
        return v1.createElement(v15, l_join_0(v46, {
            Title = v48:getText("Plugin", "NoGroupsToDisplay")
        }));
    end;
end;
local function v56(v52) --[[ Line: 281 ]] --[[ Name: SharedPageComponent ]]
    -- upvalues: v25 (copy), l_useContext_0 (copy), v20 (copy), v1 (copy), v40 (copy), v31 (copy), v17 (copy), v27 (copy), l_StudioService_0 (copy), v19 (copy), v7 (copy), v26 (copy)
    local v53 = v25:use();
    local v54 = l_useContext_0(v20);
    return v1.createElement(v40, {
        BaseQuery = v52.BaseQuery, 
        IsPrivacyVisible = true, 
        IsDateModifiedVisible = true, 
        IsDropdownMenuVisible = true, 
        IsCreatorNameVisible = true, 
        KebabMenu = {
            "OpenPlace", 
            "RemoveShared"
        }, 
        CellSize = v31, 
        FetchItems = v17, 
        NetworkQuery = {
            searchKey = "Experiences", 
            creatorType = "Team", 
            creatorTargetId = if v27() then tostring(l_StudioService_0:GetUserId()) else l_StudioService_0:GetUserId()
        }, 
        OnClick = function(v55) --[[ Line: 304 ]] --[[ Name: OnClick ]]
            -- upvalues: v19 (ref), l_StudioService_0 (ref), v54 (copy), v7 (ref), v53 (copy), v26 (ref)
            if not v55.IsPlaceholder and v55.Id and v55.RootPlaceId then
                v19(l_StudioService_0:GetUserId(), v55.Id, v55.RootPlaceId, v54.showVerifyAge, v54.showAgeRestricted);
                if v7 then
                    v53:log(v26, {
                        telemetryType = "interaction", 
                        telemetrySubtype = "place_open", 
                        action = "experiences_shared_tab"
                    });
                end;
            end;
        end, 
        NetworkViewProps = v52
    });
end;
local function v60(v57) --[[ Line: 326 ]] --[[ Name: LocalPageComponent ]]
    -- upvalues: v25 (copy), v1 (copy), v40 (copy), v30 (copy), v18 (copy), l_StartPageManager_0 (copy), v7 (copy), v26 (copy)
    local v58 = v25:use();
    return v1.createElement(v40, {
        BaseQuery = v57.BaseQuery, 
        IsPrivacyVisible = true, 
        IsDateModifiedVisible = true, 
        IsDropdownMenuVisible = false, 
        IsCreatorNameVisible = false, 
        KebabMenu = {
            "RemoveRecent"
        }, 
        CellSize = v30, 
        FetchItems = v18, 
        NetworkQuery = {
            searchKey = "Local", 
            getRecentLocalFiles = true, 
            getRecentAPIGames = false
        }, 
        OnClick = function(v59) --[[ Line: 344 ]] --[[ Name: OnClick ]]
            -- upvalues: l_StartPageManager_0 (ref), v7 (ref), v58 (copy), v26 (ref)
            if not v59.IsPlaceholder and v59.FilePath then
                l_StartPageManager_0:openLocalFile(v59.FilePath, false);
                if v7 then
                    v58:log(v26, {
                        telemetryType = "interaction", 
                        telemetrySubtype = "place_open", 
                        action = "experiences_local_tab"
                    });
                end;
            end;
        end, 
        NetworkViewProps = v57
    });
end;
return function(v61) --[[ Line: 364 ]] --[[ Name: ExperiencesPage ]]
    -- upvalues: l_Localization_0 (copy), l_useState_0 (copy), v33 (copy), l_useEffect_0 (copy), v16 (copy), v1 (copy), v14 (copy), v6 (copy), v45 (copy), v51 (copy), v56 (copy), v60 (copy), v8 (copy)
    local v62 = l_Localization_0:use();
    local v63, v64 = l_useState_0({});
    local v65 = v33();
    l_useEffect_0(function() --[[ Line: 370 ]]
        -- upvalues: v16 (ref), v64 (copy)
        v16(v64);
    end, {});
    return v1.createElement(v14, {
        Size = if v6 then nil else v61.Size, 
        PageName = "Experiences", 
        Tabs = {
            {
                Title = v62:getText("Plugin", "ExperiencesPage.Owned"), 
                FailedTitle = v62:getText("Plugin", "NoExperiencesToDisplay"), 
                Key = "Owned", 
                PageComponent = v45, 
                Dropdowns = {
                    SortDropdown = v65, 
                    DefaultSortIndex = 4
                }
            }, 
            {
                Title = v62:getText("Plugin", "ExperiencesPage.Group"), 
                FailedTitle = v62:getText("Plugin", "NoGroupExperiencesToDisplay"), 
                Key = "Group", 
                PageComponent = v51, 
                Dropdowns = {
                    SortDropdown = v65, 
                    DefaultSortIndex = 4, 
                    GroupDropdown = if #v63 > 0 then v63 else nil
                }
            }, 
            {
                Title = v62:getText("Plugin", "ExperiencesPage.Shared"), 
                FailedTitle = v62:getText("Plugin", "NoSharedExperiencesToDisplay"), 
                Key = "Shared", 
                PageComponent = v56, 
                Dropdowns = {
                    SortDropdown = v65, 
                    DefaultSortIndex = 4
                }
            }, 
            {
                Title = v62:getText("Plugin", "ExperiencesPage.Local"), 
                FailedTitle = v62:getText("Plugin", "NoLocalFilesToDisplay"), 
                Key = "Local", 
                PageComponent = v60, 
                Dropdowns = {}
            }
        }, 
        CanSwapBetweenViews = true, 
        IsDefaultGridView = true, 
        HasSearchBar = true, 
        IsAlertVisible = v8 and true
    });
end;