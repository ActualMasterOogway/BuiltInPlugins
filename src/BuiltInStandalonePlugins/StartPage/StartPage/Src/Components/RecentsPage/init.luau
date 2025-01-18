local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useContext_0 = v1.useContext;
local v3 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)();
local v4 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v5 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPagePlaceOpenAttributionTelemetry)();
local v6 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagDynamicRecentsQuery)();
local v7 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAlertForUsersTextChat)();
local v8 = require(l_script_FirstAncestor_0.Src.Components.GamePage);
local v9 = require(l_script_FirstAncestor_0.Src.Components.InfoTile);
local v10 = if v3 then require(l_script_FirstAncestor_0.Src.Components.NetworkView) else require(l_script_FirstAncestor_0.Src.Components.DEPRECATED_NetworkView);
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
local v12 = require(l_script_FirstAncestor_0.Src.Util.Services);
local l_StartPageManager_0 = v12.StartPageManager;
local l_StudioService_0 = v12.StudioService;
local v15 = if v3 then require(l_script_FirstAncestor_0.Src.Network.DiscoverRecents) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverRecents);
local v16 = require(l_script_FirstAncestor_0.Src.Network.DiscoverCreatorEligibilityAndOpenPlace);
local v17 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v18 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.StartPageTelemetryEvent);
local v19 = require(l_script_FirstAncestor_0.Src.Util.Dialogs);
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local v21 = UDim2.new(0, 200, 0, 200);
local v22 = UDim2.new(0, 225, 0, 348);
local v23 = if not v6 then {
    searchKey = "Recents", 
    search = "", 
    creatorType = "User", 
    creatorTargetId = tostring(l_StudioService_0:GetUserId()), 
    isArchived = false, 
    isTemplates = false, 
    pageSize = 10, 
    getRecentLocalFiles = true, 
    getRecentAPIGames = true
} else nil;
local function _() --[[ Line: 62 ]] --[[ Name: RecentQuery ]]
    -- upvalues: v6 (copy), l_StudioService_0 (copy)
    assert(v6, "FFlagDynamicRecentsQuery must be enabled to use RecentQuery");
    return {
        searchKey = "Recents", 
        search = "", 
        creatorType = "User", 
        creatorTargetId = tostring(l_StudioService_0:GetUserId()), 
        isArchived = false, 
        isTemplates = false, 
        pageSize = 10, 
        getRecentLocalFiles = true, 
        getRecentAPIGames = true
    };
end;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v32(v26) --[[ Line: 103 ]] --[[ Name: PageComponent ]]
    -- upvalues: l_join_0 (copy), v6 (copy), l_StudioService_0 (copy), v23 (copy), v1 (copy), v10 (copy), v9 (copy), v21 (copy)
    local l_l_join_0_0 = l_join_0;
    local v28;
    if v6 then
        assert(v6, "FFlagDynamicRecentsQuery must be enabled to use RecentQuery");
        v28 = {
            searchKey = "Recents", 
            search = "", 
            creatorType = "User", 
            creatorTargetId = tostring(l_StudioService_0:GetUserId()), 
            isArchived = false, 
            isTemplates = false, 
            pageSize = 10, 
            getRecentLocalFiles = true, 
            getRecentAPIGames = true
        };
    else
        v28 = v23;
    end;
    l_l_join_0_0 = l_l_join_0_0(v28, v26.BaseQuery or {});
    return v1.createElement(v10, l_join_0({
        Query = l_join_0(l_l_join_0_0, v26.NetworkQuery), 
        CellSize = v26.CellSize, 
        CellComponent = function(v29) --[[ Line: 112 ]] --[[ Name: CellComponent ]]
            -- upvalues: v1 (ref), v9 (ref), l_join_0 (ref), v21 (ref), v26 (copy)
            return v1.createElement(v9, l_join_0(v29, {
                ImageSize = v21, 
                OnClick = function(v30) --[[ Line: 117 ]] --[[ Name: OnClick ]]
                    -- upvalues: v26 (ref)
                    v26.OnClick(v30);
                end, 
                IsPrivacyVisible = v26.IsPrivacyVisible, 
                IsDateModifiedVisible = v26.IsDateModifiedVisible, 
                IsDropdownMenuVisible = v26.IsDropdownMenuVisible, 
                IsCreatorNameVisible = v26.IsCreatorNameVisible, 
                KebabMenu = v26.KebabMenu
            }));
        end, 
        FetchItems = v26.FetchItems, 
        AdjustQuery = function(v31) --[[ Line: 131 ]] --[[ Name: AdjustQuery ]]
            -- upvalues: l_join_0 (ref), l_l_join_0_0 (copy)
            l_join_0(l_l_join_0_0, v31);
        end
    }, v26.NetworkViewProps));
end;
local function v37(v33) --[[ Line: 138 ]] --[[ Name: RecentsPageComponent ]]
    -- upvalues: l_useContext_0 (copy), v19 (copy), v17 (copy), v1 (copy), v32 (copy), v22 (copy), v15 (copy), v16 (copy), l_StudioService_0 (copy), v5 (copy), v18 (copy), l_StartPageManager_0 (copy)
    local v34 = l_useContext_0(v19);
    local v35 = v17:use();
    return v1.createElement(v32, {
        BaseQuery = v33.BaseQuery, 
        IsPrivacyVisible = true, 
        IsDateModifiedVisible = true, 
        IsDropdownMenuVisible = true, 
        IsCreatorNameVisible = true, 
        KebabMenu = {
            "ConfigureExperience", 
            "ConfigurePlace", 
            "OpenPlace", 
            "PublicPrivateToggle", 
            "Archive", 
            "RemoveRecent"
        }, 
        CellSize = v22, 
        FetchItems = v15, 
        NetworkQuery = {
            searchKey = "Recents", 
            getRecentLocalFiles = true, 
            getRecentAPIGames = true
        }, 
        OnClick = function(v36) --[[ Line: 163 ]] --[[ Name: OnClick ]]
            -- upvalues: v16 (ref), l_StudioService_0 (ref), v34 (copy), v5 (ref), v35 (copy), v18 (ref), l_StartPageManager_0 (ref)
            if not v36.IsPlaceholder and v36.Id and v36.RootPlaceId then
                v16(l_StudioService_0:GetUserId(), v36.Id, v36.RootPlaceId, v34.showVerifyAge, v34.showAgeRestricted);
                if v5 then
                    v35:log(v18, {
                        telemetryType = "interaction", 
                        telemetrySubtype = "place_open", 
                        action = "recents_cloud"
                    });
                    return;
                end;
            elseif not v36.IsPlaceholder and v36.FilePath then
                l_StartPageManager_0:openLocalFile(v36.FilePath, false);
                if v5 then
                    v35:log(v18, {
                        telemetryType = "interaction", 
                        telemetrySubtype = "place_open", 
                        action = "recents_local"
                    });
                end;
            end;
        end, 
        NetworkViewProps = v33
    });
end;
return function(v38) --[[ Line: 194 ]] --[[ Name: RecentsPage ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), v8 (copy), v4 (copy), v37 (copy), v7 (copy)
    local v39 = l_Localization_0:use();
    return v1.createElement(v8, {
        Size = if v4 then nil else v38.Size, 
        PageName = "Recents", 
        HideTabs = true, 
        Tabs = {
            {
                Title = v39:getText("Plugin", "RecentsPage.Title"), 
                FailedTitle = v39:getText("Plugin", "NoExperiencesToDisplay"), 
                Key = "Recents", 
                PageComponent = v37, 
                Dropdowns = {}
            }
        }, 
        CanSwapBetweenViews = true, 
        IsDefaultGridView = true, 
        HasSearchBar = true, 
        IsAlertVisible = v7 and true
    });
end;