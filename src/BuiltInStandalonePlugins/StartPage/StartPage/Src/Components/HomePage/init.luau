local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useRef_0 = v1.useRef;
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local l_useContext_0 = v1.useContext;
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local v7 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)();
local v8 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v9 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAddingRecentsPage)();
local l_useCallback_0 = v1.useCallback;
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local l_counter_0 = v6.Util.counter;
local l_Localization_0 = v6.ContextServices.Localization;
local l_Plugin_0 = v6.ContextServices.Plugin;
local l_ScrollingFrame_0 = v6.UI.ScrollingFrame;
local v16 = require(l_script_FirstAncestor_0.Src.Components.Alert);
local v17 = require(l_script_FirstAncestor_0.Src.Components.HomeSectionHeader);
local v18 = require(l_script_FirstAncestor_0.Src.Components.InfoTile);
local v19 = if v7 then require(l_script_FirstAncestor_0.Src.Components.NetworkView) else require(l_script_FirstAncestor_0.Src.Components.DEPRECATED_NetworkView);
local v20 = require(l_script_FirstAncestor_0.Src.Components.ScrollingCarousel);
local v21 = require(l_script_FirstAncestor_0.Src.Components.TutorialTile);
local v22 = require(l_script_FirstAncestor_0.Src.Components.Tour3TutorialTile);
local v23 = if v7 then require(l_script_FirstAncestor_0.Src.Network.DiscoverExperiences) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverExperiences);
local v24 = if v7 then require(l_script_FirstAncestor_0.Src.Network.DiscoverRecents) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverRecents);
local v25 = if v7 then require(l_script_FirstAncestor_0.Src.Network.DiscoverMomentum) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverMomentum);
local v26 = require(l_script_FirstAncestor_0.Src.Network.DiscoverCreatorEligibilityAndOpenPlace);
local v27 = require(l_script_FirstAncestor_0.Src.Resources.PlaceholderMomentumContent);
local v28 = require(l_script_FirstAncestor_0.Src.Util.Services);
local l_StartPageManager_0 = v28.StartPageManager;
local v30 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v31 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.StartPageTelemetryEvent);
local l_StudioService_0 = v28.StudioService;
local v33 = require(l_script_FirstAncestor_0.Src.Util.Dialogs);
local v34 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAtomicTestsFixes);
local v35 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageWrappedTitles)();
local v36 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPagePlaceOpenAttributionTelemetry)();
local v37 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagDynamicUserIDRecentPage)();
local v38 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAlertForUsersTextChat)();
local v39 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntNewUserThreshold)();
local v40 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFStringLuaStartPageBannerLink)();
local v41 = if not v37 then {
    searchKey = "Recents", 
    search = "", 
    creatorType = "User", 
    creatorTargetId = if v34() then tostring(l_StudioService_0:GetUserId()) else l_StudioService_0:GetUserId(), 
    isArchived = false, 
    isTemplates = false, 
    pageSize = 10, 
    getRecentLocalFiles = true, 
    getRecentAPIGames = true
} else nil;
local function v42() --[[ Line: 96 ]] --[[ Name: RecentQuery ]]
    -- upvalues: v37 (copy), v34 (copy), l_StudioService_0 (copy)
    assert(v37, "FFlagDynamicUserIDRecentPage must be enabled to use RecentQuery");
    return {
        searchKey = "Recents", 
        search = "", 
        creatorType = "User", 
        creatorTargetId = if v34() then tostring(l_StudioService_0:GetUserId()) else l_StudioService_0:GetUserId(), 
        isArchived = false, 
        isTemplates = false, 
        pageSize = 10, 
        getRecentLocalFiles = true, 
        getRecentAPIGames = true
    };
end;
local v43 = {
    searchKey = "Templates", 
    search = "All", 
    isTemplates = true, 
    pageSize = 30
};
local v44 = {
    searchKey = "Network", 
    pageSize = 30
};
local function v49(v45) --[[ Line: 125 ]] --[[ Name: RecentsCellComponent ]]
    -- upvalues: v30 (copy), l_useContext_0 (copy), v33 (copy), v1 (copy), v18 (copy), l_join_0 (copy), v26 (copy), l_StudioService_0 (copy), l_StartPageManager_0 (copy), v36 (copy), v31 (copy)
    local v46 = v30:use();
    local v47 = l_useContext_0(v33);
    return v1.createElement(v18, l_join_0(v45, {
        ImageSize = UDim2.new(0, 200, 0, 200), 
        OnClick = function(v48) --[[ Line: 134 ]] --[[ Name: OnClick ]]
            -- upvalues: v26 (ref), l_StudioService_0 (ref), v47 (copy), l_StartPageManager_0 (ref), v36 (ref), v46 (copy), v31 (ref)
            if v48.RootPlaceId then
                v26(l_StudioService_0:GetUserId(), v48.Id, v48.RootPlaceId, v47.showVerifyAge, v47.showAgeRestricted);
            elseif v48.FilePath then
                l_StartPageManager_0:openLocalFile(v48.FilePath, false);
            end;
            if v36 then
                v46:log(v31, {
                    telemetryType = "interaction", 
                    telemetrySubtype = "place_open", 
                    action = "home_recent_sort", 
                    name = v48.RootPlaceId and "published" or v48.FilePath and "local_file" or "unknown"
                });
            end;
        end, 
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
        }
    }));
end;
local function v53(v50) --[[ Line: 176 ]] --[[ Name: TemplatesCellComponent ]]
    -- upvalues: v30 (copy), v1 (copy), v18 (copy), l_join_0 (copy), v26 (copy), l_StudioService_0 (copy), v36 (copy), v31 (copy)
    local v51 = v30:use();
    return v1.createElement(v18, l_join_0(v50, {
        ImageSize = UDim2.new(0, 200, 0, 200), 
        OnClick = function(v52) --[[ Line: 182 ]] --[[ Name: OnClick ]]
            -- upvalues: v26 (ref), l_StudioService_0 (ref), v36 (ref), v51 (copy), v31 (ref)
            if v52.RootPlaceId then
                v26(l_StudioService_0:GetUserId(), v52.Id, v52.RootPlaceId, function() --[[ Line: 188 ]]

                end, function() --[[ Line: 189 ]]

                end);
                if v36 then
                    v51:log(v31, {
                        telemetryType = "interaction", 
                        telemetrySubtype = "place_open", 
                        action = "home_template_sort", 
                        name = v52.Name or v52.Id
                    });
                end;
            end;
        end
    }));
end;
local function v57(v54) --[[ Line: 205 ]] --[[ Name: MomentumCellComponent ]]
    -- upvalues: v30 (copy), v1 (copy), v18 (copy), l_join_0 (copy), v31 (copy), l_StartPageManager_0 (copy)
    local v55 = v30:use();
    return v1.createElement(v18, l_join_0(v54, {
        ImageSize = UDim2.new(0, 200, 0, 161), 
        IsDescriptionVisible = true, 
        OnClick = function(v56) --[[ Line: 212 ]] --[[ Name: OnClick ]]
            -- upvalues: v55 (copy), v31 (ref), l_StartPageManager_0 (ref)
            v55:log(v31, {
                telemetryType = "interaction", 
                telemetrySubtype = "momentum", 
                action = v56.Link and "open_link" or "launch_tutorial", 
                name = v56.Name, 
                link = v56.Link
            });
            if v56.Link then
                l_StartPageManager_0:openLink(v56.Link);
                return;
            else
                if v56.LaunchTutorialOnClick then
                    l_StartPageManager_0:startTutorial();
                end;
                return;
            end;
        end
    }));
end;
return function(v58) --[[ Line: 230 ]] --[[ Name: HomePage ]]
    -- upvalues: l_useRef_0 (copy), l_useEffect_0 (copy), v7 (copy), l_Plugin_0 (copy), v30 (copy), l_Localization_0 (copy), l_useState_0 (copy), l_StartPageManager_0 (copy), v8 (copy), l_useCallback_0 (copy), v31 (copy), l_counter_0 (copy), v27 (copy), v25 (copy), v6 (copy), v1 (copy), l_ScrollingFrame_0 (copy), v22 (copy), v21 (copy), v38 (copy), v39 (copy), v16 (copy), v40 (copy), v17 (copy), v9 (copy), v19 (copy), v35 (copy), v20 (copy), v49 (copy), v37 (copy), v42 (copy), v41 (copy), v24 (copy), v53 (copy), v43 (copy), v23 (copy), v57 (copy), v44 (copy)
    local v59 = l_useRef_0(nil);
    local v60 = l_useRef_0(nil);
    local v61 = l_useRef_0(nil);
    l_useEffect_0(function() --[[ Line: 236 ]]
        -- upvalues: v59 (copy), v61 (copy)
        if v59.current == nil then
            v59.current = os.clock();
            v61.current = os.time();
        end;
    end, {});
    local v62 = nil;
    if v7 then
        v62 = l_Plugin_0:use():get();
    end;
    local v63 = v30:use();
    local v64 = l_Localization_0:use();
    local v65, v66 = l_useState_0(0);
    local v67 = not l_StartPageManager_0:isTutorialBannerClosed();
    if game:GetFastFlag("DebugShowStudioTour2") or game:GetFastFlag("DebugShowStudioTour3") then
        v67 = true;
    end;
    local v68, v69 = l_useState_0(v67);
    local v70, v71 = l_useState_0(function() --[[ Line: 258 ]]
        -- upvalues: v62 (ref)
        return not v62:GetSetting("LuaStartPageHasAlertBeenClosed3");
    end);
    local v72 = nil;
    local v73 = nil;
    if not v8 then
        local v74, v75 = l_useState_0(nil);
        v72 = v74;
        v73 = v75;
    end;
    local v76, v77 = l_useState_0(true);
    local v82 = l_useCallback_0(function(v78) --[[ Line: 269 ]]
        -- upvalues: v77 (copy), v7 (ref), v59 (copy), v60 (copy), v63 (copy), v31 (ref), v61 (copy), v62 (ref), v66 (copy)
        v77(v78 > 0);
        if v7 then
            if v59.current ~= nil and v60.current == nil then
                local v79 = os.clock();
                v60.current = v79;
                v63:log(v31, {
                    telemetryType = "performance", 
                    telemetrySubtype = "page_load", 
                    measurementName = "initial_load_time", 
                    timeElapsedMilliseconds = math.round((v79 - v59.current) * 1000), 
                    context = "home_page"
                });
                if v61.current ~= nil then
                    local l_v62_PluginComponent_0 = v62:GetPluginComponent("StartPageBridge");
                    if l_v62_PluginComponent_0 then
                        l_v62_PluginComponent_0:SetStartPageFirstRenderTimeAsync((math.round(v61.current * 1000)));
                        return;
                    end;
                end;
            end;
        else
            v66(function(v81) --[[ Line: 292 ]]
                return v81 + 1;
            end);
        end;
    end, if v7 then nil else {
        v65
    });
    local v83 = nil;
    if not v7 then
        v83 = l_useCallback_0(function() --[[ Line: 300 ]]
            -- upvalues: v66 (copy)
            v66(function(v84) --[[ Line: 301 ]]
                return v84 + 1;
            end);
        end, {});
    end;
    local v85 = nil;
    if not v8 then
        v85 = 750;
        if v76 then
            v85 = v85 + 400;
        end;
        if v68 and v72 then
            v85 = v85 + v72.Y;
        end;
    end;
    local v86 = l_counter_0();
    local v88 = l_useCallback_0(function(...) --[[ Line: 327 ]]
        -- upvalues: v27 (ref), v64 (copy), v25 (ref)
        local v87 = v27.get(v64);
        return v25(v87, ...);
    end, {
        v64:getLocale()
    });
    local v89 = nil;
    if not v7 then
        v89 = v65 >= 2;
        if v89 and v59.current ~= nil and v60.current == nil then
            local v90 = os.clock();
            v60.current = v90;
            v63:log(v31, {
                telemetryType = "performance", 
                telemetrySubtype = "page_load", 
                measurementName = "initial_load_time", 
                timeElapsedMilliseconds = math.round((v90 - v59.current) * 1000), 
                context = "home_page"
            });
            local v91 = v6.ContextServices.Plugin:use():get();
            if v91 and v61.current ~= nil then
                local l_v91_PluginComponent_0 = v91:GetPluginComponent("StartPageBridge");
                if l_v91_PluginComponent_0 then
                    l_v91_PluginComponent_0:SetStartPageFirstRenderTimeAsync((math.round(v61.current * 1000)));
                end;
            end;
        end;
    end;
    return v1.createElement(l_ScrollingFrame_0, {
        Size = if v8 then nil else v58.Size, 
        Position = if v8 then nil else v58.Position, 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasSize = if v8 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0, v85), 
        ScrollBarThickness = 0, 
        [v1.Tag] = v8 and "StartPage-HomePageColumn X-Fill" or "StartPage-HomePageColumn"
    }, {
        TutorialBanner = if v68 then v1.createElement("Frame", {
            LayoutOrder = v86(), 
            [v1.Change.AbsoluteSize] = if v8 then nil else function(v93) --[[ Line: 377 ]]
                -- upvalues: v73 (ref)
                v73(v93.AbsoluteSize);
            end, 
            [v1.Tag] = "X-FitY X-Column X-Transparent"
        }, {
            v1.createElement("Frame", {
                [v1.Tag] = "X-FitY StartPage-LeftPadding32 X-Transparent"
            }, {
                v1.createElement(if l_StartPageManager_0:getTutorialVersionForUser() == "StudioTour3" then v22 else v21, {
                    HasParentLoaded = if v8 then nil else v89, 
                    OnClose = function() --[[ Line: 391 ]] --[[ Name: OnClose ]]
                        -- upvalues: v69 (copy), l_StartPageManager_0 (ref)
                        v69(false);
                        l_StartPageManager_0:setTutorialBannerClosed(true);
                    end
                })
            }), 
            v1.createElement("Frame", {
                LayoutOrder = v86(), 
                Size = UDim2.new(1, 0, 0, 1), 
                [v1.Tag] = "StartPage-BorderColor"
            })
        }) else v1.createElement("Frame", {
            LayoutOrder = v86(), 
            Size = UDim2.new(1, 0, 0, 7), 
            [v1.Tag] = "X-Transparent"
        }), 
        AlertBanner = if not (not (v38 and l_StartPageManager_0:getDaysSinceFirstUserLogin() >= v39) or v68) and v70 then v1.createElement("Frame", {
            LayoutOrder = v86(), 
            [v1.Tag] = "X-FitY StartPage-LeftPadding32 X-Transparent"
        }, {
            v1.createElement(v16, {
                Title = v64:getText("Plugin", "AlertBanner.Title"), 
                Body = v64:getText("Plugin", "AlertBanner.Body"), 
                Size = UDim2.new(1, 0, 0, 52), 
                OnClose = function() --[[ Line: 423 ]] --[[ Name: OnClose ]]
                    -- upvalues: v62 (ref), v71 (copy)
                    v62:SetSetting("LuaStartPageHasAlertBeenClosed3", true);
                    v71(false);
                end, 
                OnClick = function() --[[ Line: 428 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_StartPageManager_0 (ref), v40 (ref)
                    l_StartPageManager_0:openLink(v40);
                end
            })
        }) else nil, 
        RecentExperiences = if v76 then v1.createElement("Frame", {
            LayoutOrder = v86(), 
            [v1.Tag] = "X-FitY StartPage-LeftPadding32 X-ColumnM X-Transparent"
        }, {
            v1.createElement(v17, {
                Size = if v8 then nil else UDim2.new(1, 0, 0, 48), 
                Title = v64:getText("Plugin", "HomePage.MyRecentExperiences"), 
                ButtonText = v64:getText("Plugin", "SeeAll"), 
                HasParentLoaded = if v8 then nil else v89, 
                OnButtonClick = function() --[[ Line: 445 ]] --[[ Name: OnButtonClick ]]
                    -- upvalues: v63 (copy), v31 (ref), v9 (ref), v58 (copy)
                    v63:log(v31, {
                        telemetryType = "navigation", 
                        telemetrySubtype = "page", 
                        context = "see_all_recents", 
                        from = "Home", 
                        to = v9 and "Recents" or "Experiences"
                    });
                    v58.OnPageSwap(v9 and "Recents" or "Experiences");
                end
            }), 
            v1.createElement(v19, {
                Size = UDim2.new(1, 0, 0, v35 and 355 or 325), 
                DisplayComponent = v20, 
                MaxCount = 6, 
                PageSize = 10, 
                HasParentLoaded = if v8 then nil else v89, 
                ShowRecentAPIGames = true, 
                ShowRecentLocalFiles = true, 
                OnItemCountUpdated = if v7 then v82 else nil, 
                InitialContentHasLoaded = if not v7 then v82 else nil, 
                CellComponent = v49, 
                CellSize = UDim2.new(0, 224, 0, v35 and 348 or 318), 
                CellPadding = UDim2.new(0, 16, 0, 16), 
                Query = if v37 then v42() else v41, 
                FetchItems = v24
            })
        }) else nil, 
        Templates = v1.createElement("Frame", {
            LayoutOrder = v86(), 
            [v1.Tag] = "StartPage-LeftPadding32 X-FitY X-ColumnM X-Transparent"
        }, {
            v1.createElement(v17, {
                Size = if v8 then nil else UDim2.new(1, 0, 0, 70), 
                Title = v64:getText("Plugin", "HomePage.Templates.Heading"), 
                Description = v64:getText("Plugin", "HomePage.Templates.Description"), 
                ButtonText = v64:getText("Plugin", "SeeAll"), 
                HasParentLoaded = if v8 then nil else v89, 
                OnButtonClick = function() --[[ Line: 490 ]] --[[ Name: OnButtonClick ]]
                    -- upvalues: v63 (copy), v31 (ref), v58 (copy)
                    v63:log(v31, {
                        telemetryType = "navigation", 
                        telemetrySubtype = "page", 
                        context = "see_all_templates", 
                        from = "Home", 
                        to = "Templates"
                    });
                    v58.OnPageSwap("Templates");
                end
            }), 
            v1.createElement(v19, {
                Size = UDim2.new(1, 0, 0, 264), 
                DisplayComponent = v20, 
                HasParentLoaded = if v8 then nil else v89, 
                MaxCount = 6, 
                InitialContentHasLoaded = if v7 then nil else v83, 
                CellComponent = v53, 
                CellSize = UDim2.new(0, 225, 0, 252), 
                CellPadding = UDim2.new(0, 16, 0, 16), 
                Query = v43, 
                FetchItems = v23
            })
        }), 
        Momentum = v1.createElement("Frame", {
            LayoutOrder = v86(), 
            [v1.Tag] = "StartPage-LeftPadding32 X-FitY X-ColumnM X-Transparent"
        }, {
            v1.createElement(v17, {
                Size = UDim2.new(1, 0, 0, 60), 
                Title = v64:getText("Plugin", "HomePage.DiscoverStudio.Heading"), 
                Description = v64:getText("Plugin", "HomePage.DiscoverStudio.Description"), 
                HasParentLoaded = if v8 then nil else v89
            }), 
            v1.createElement(v19, {
                Size = UDim2.new(1, 0, 0, 270), 
                DisplayComponent = v20, 
                HasParentLoaded = if v8 then nil else v89, 
                InitialContentHasLoaded = if v7 then nil else v83, 
                CellComponent = v57, 
                CellSize = UDim2.new(0, 225, 0, 266), 
                CellPadding = UDim2.new(0, 16, 0, 16), 
                Query = v44, 
                FetchItems = v88
            })
        }), 
        Spacer = if v8 then v1.createElement("Frame", {
            LayoutOrder = v86(), 
            Size = UDim2.new(1, 0, 0, 40), 
            [v1.Tag] = "X-Transparent"
        }) else nil
    });
end;