local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local l_useContext_0 = v1.useContext;
local v5 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)();
local v6 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v7 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAlertForUsersTextChat)();
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local v10 = require(l_script_FirstAncestor_0.Src.Util.Services);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v12 = require(l_script_FirstAncestor_0.Src.Components.InfoTile);
local v13 = if v5 then require(l_script_FirstAncestor_0.Src.Components.NetworkView) else require(l_script_FirstAncestor_0.Src.Components.DEPRECATED_NetworkView);
local v14 = require(l_script_FirstAncestor_0.Src.Components.GamePage);
local v15 = if v5 then require(l_script_FirstAncestor_0.Src.Network.DiscoverGroups) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverGroups);
local v16 = if v5 then require(l_script_FirstAncestor_0.Src.Network.DiscoverExperiences) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverExperiences);
local v17 = require(l_script_FirstAncestor_0.Src.Components.NoResultsFoundPage);
local v18 = require(l_script_FirstAncestor_0.Src.Network.DiscoverCreatorEligibilityAndOpenPlace);
local v19 = require(l_script_FirstAncestor_0.Src.Util.SortingOptions);
local v20 = require(l_script_FirstAncestor_0.Src.Util.Dialogs);
local v21 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAtomicTestsFixes);
local v22 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageWrappedTitles);
local v23 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPagePlaceOpenAttributionTelemetry)();
local l_StudioService_0 = v10.StudioService;
local v25 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v26 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.StartPageTelemetryEvent);
local v27 = UDim2.new(0, 200, 0, 200);
local v28 = UDim2.new(0, 225, 0, v22 and 325 or 295);
local function v30() --[[ Line: 87 ]] --[[ Name: getSortingDropdowns ]]
    -- upvalues: l_Localization_0 (copy), v19 (copy)
    local v29 = l_Localization_0:use();
    return {
        {
            DropdownLabel = v29:getText("Plugin", "SortOptions.Alphabetical"), 
            Key = "GameName", 
            Query = {
                sortParam = v19.GameName, 
                sortOrder = v19.Asc
            }
        }, 
        {
            DropdownLabel = v29:getText("Plugin", "SortOptions.Created"), 
            Key = "GameCreatedAsc", 
            Query = {
                sortParam = v19.GameCreated, 
                sortOrder = v19.Asc
            }
        }, 
        {
            DropdownLabel = v29:getText("Plugin", "SortOptions.CreatedDescending"), 
            Key = "GameCreatedDesc", 
            Query = {
                sortParam = v19.GameCreated, 
                sortOrder = v19.Desc
            }
        }, 
        {
            DropdownLabel = v29:getText("Plugin", "SortOptions.Modified"), 
            Key = "LastUpdated", 
            Query = {
                sortParam = v19.LastUpdated, 
                sortOrder = v19.Desc
            }
        }
    };
end;
local v31 = {
    searchKey = "Archive", 
    isArchived = true, 
    isTemplates = false, 
    pageSize = 30
};
local function v36(v32) --[[ Line: 132 ]] --[[ Name: CellComponent ]]
    -- upvalues: v25 (copy), l_useContext_0 (copy), v20 (copy), v1 (copy), v12 (copy), l_join_0 (copy), v27 (copy), v18 (copy), l_StudioService_0 (copy), v23 (copy), v26 (copy)
    local v33 = v25:use();
    local v34 = l_useContext_0(v20);
    return v1.createElement(v12, l_join_0(v32, {
        ImageSize = v27, 
        OnClick = function(v35) --[[ Line: 139 ]] --[[ Name: OnClick ]]
            -- upvalues: v18 (ref), l_StudioService_0 (ref), v34 (copy), v23 (ref), v33 (copy), v26 (ref)
            if v35.Id then
                v18(l_StudioService_0:GetUserId(), v35.Id, v35.RootPlaceId, v34.showVerifyAge, v34.showAgeRestricted);
                if v23 then
                    v33:log(v26, {
                        telemetryType = "interaction", 
                        telemetrySubtype = "place_open", 
                        action = "archive_page"
                    });
                end;
            end;
        end, 
        IsPrivacyVisible = true, 
        IsDateModifiedVisible = true, 
        IsDropdownMenuVisible = true, 
        IsCreatorNameVisible = false, 
        KebabMenu = {
            "RestoreArchive"
        }
    }));
end;
local function v40(v37) --[[ Line: 170 ]] --[[ Name: PageComponent ]]
    -- upvalues: l_join_0 (copy), v31 (copy), v1 (copy), v13 (copy), v28 (copy), v36 (copy), v16 (copy)
    local v38 = l_join_0(v31, v37.BaseQuery or {});
    return v1.createElement(v13, l_join_0({
        Query = l_join_0(v38, v37.NetworkQuery), 
        CellSize = v28, 
        CellComponent = v36, 
        FetchItems = v16, 
        AdjustQuery = function(v39) --[[ Line: 180 ]] --[[ Name: AdjustQuery ]]
            -- upvalues: l_join_0 (ref), v38 (copy)
            l_join_0(v38, v39);
        end
    }, v37.NetworkViewProps));
end;
local function v42(v41) --[[ Line: 187 ]] --[[ Name: OwnedArchivePageComponent ]]
    -- upvalues: v1 (copy), v40 (copy), v21 (copy), l_StudioService_0 (copy)
    return v1.createElement(v40, {
        BaseQuery = v41.BaseQuery, 
        NetworkQuery = {
            creatorType = "User", 
            creatorTargetId = if v21() then tostring(l_StudioService_0:GetUserId()) else l_StudioService_0:GetUserId()
        }, 
        NetworkViewProps = v41
    });
end;
local function v45(v43) --[[ Line: 201 ]] --[[ Name: GroupArchivePageComponent ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), v40 (copy), v5 (copy), v17 (copy), l_join_0 (copy)
    local v44 = l_Localization_0:use();
    if v43.BaseQuery and v43.BaseQuery.creatorTargetId then
        return v1.createElement(v40, {
            BaseQuery = v43.BaseQuery, 
            NetworkQuery = {
                creatorType = "Group"
            }, 
            NetworkViewProps = v43
        });
    else
        if not v5 then
            v43.InitialContentHasLoaded(0);
        end;
        return v1.createElement(v17, l_join_0(v43, {
            Title = v44:getText("Plugin", "NoGroupsToDisplay")
        }));
    end;
end;
return function(v46) --[[ Line: 227 ]] --[[ Name: ArchivePage ]]
    -- upvalues: l_Localization_0 (copy), l_useState_0 (copy), v30 (copy), l_useEffect_0 (copy), v15 (copy), v1 (copy), v14 (copy), v6 (copy), v42 (copy), v45 (copy), v7 (copy)
    local v47 = l_Localization_0:use();
    local v48, v49 = l_useState_0({});
    local v50 = v30();
    l_useEffect_0(function() --[[ Line: 233 ]]
        -- upvalues: v15 (ref), v49 (copy)
        v15(v49);
    end, {});
    return v1.createElement(v14, {
        Size = if v6 then nil else v46.Size, 
        PageName = "Archive", 
        Tabs = {
            {
                Title = v47:getText("Plugin", "ArchivePage.Owned"), 
                FailedTitle = v47:getText("Plugin", "NoExperiencesToDisplay"), 
                Key = "Owned", 
                PageComponent = v42, 
                Dropdowns = {
                    SortDropdown = v50, 
                    DefaultSortIndex = 4
                }
            }, 
            {
                Title = v47:getText("Plugin", "ArchivePage.Group"), 
                FailedTitle = v47:getText("Plugin", "NoGroupExperiencesToDisplay"), 
                Key = "Group", 
                PageComponent = v45, 
                Dropdowns = {
                    SortDropdown = v50, 
                    DefaultSortIndex = 4, 
                    GroupDropdown = if #v48 > 0 then v48 else nil
                }
            }
        }, 
        CanSwapBetweenViews = true, 
        IsDefaultGridView = true, 
        HasSearchBar = true, 
        CellPadding = UDim2.new(0, 16, 0, 16), 
        IsAlertVisible = v7 and true
    });
end;