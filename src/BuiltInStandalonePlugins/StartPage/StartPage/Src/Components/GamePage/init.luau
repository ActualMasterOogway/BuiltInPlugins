local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v4 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v5 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAddingRecentsPage)();
local v6 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAlertForUsersTextChat)();
local v7 = game:DefineFastFlag("StartPageTruncateGroupDropdown", false);
local v8 = require(l_script_FirstAncestor_0.Src.Util.TypedDash);
local l_map_0 = v8.map;
local l_join_0 = v8.join;
local v11 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_counter_0 = v11.Util.counter;
local l_Localization_0 = v11.ContextServices.Localization;
local l_UI_0 = v11.UI;
local l_Grid_0 = l_UI_0.Grid;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Image_0 = l_UI_0.Image;
local v18 = require(l_script_FirstAncestor_0.Src.Components.Alert);
local v19 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v20 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.StartPageTelemetryEvent);
local v21 = require(l_script_FirstAncestor_0.Src.Components.Shimmer);
local v22 = require(l_script_FirstAncestor_0.Src.Components.PillTabs);
local v23 = require(l_script_FirstAncestor_0.Src.Components.ExperiencesTable);
local v24 = require(l_script_FirstAncestor_0.Src.Components.SearchBarWithPills);
local v25 = require(l_script_FirstAncestor_0.Src.Components.NoResultsFoundPage);
local v26 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local l_ContextServices_0 = v11.ContextServices;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v29 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntNewUserThreshold)();
local v30 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFStringLuaStartPageBannerLink)();
local function _(v31) --[[ Line: 79 ]] --[[ Name: getLabels ]]
    -- upvalues: l_map_0 (copy)
    if not v31 then
        return;
    else
        return l_map_0(v31, function(v32) --[[ Line: 83 ]]
            return v32.DropdownLabel;
        end);
    end;
end;
return function(v34) --[[ Line: 88 ]] --[[ Name: GamePage ]]
    -- upvalues: l_ContextServices_0 (copy), v19 (copy), l_Localization_0 (copy), l_useState_0 (copy), v4 (copy), v26 (copy), l_map_0 (copy), l_join_0 (copy), l_counter_0 (copy), v1 (copy), v24 (copy), v6 (copy), l_StartPageManager_0 (copy), v29 (copy), v18 (copy), v30 (copy), v5 (copy), v22 (copy), v20 (copy), v21 (copy), l_SelectInput_0 (copy), v7 (copy), l_Image_0 (copy), l_Grid_0 (copy), v23 (copy), v25 (copy)
    local v35 = l_ContextServices_0.Plugin:use():get();
    local v36 = v19:use();
    local v37 = l_Localization_0:use();
    local v38, v39 = l_useState_0(1);
    local v40, v41 = l_useState_0({});
    local v42, v43 = l_useState_0("");
    local v45, v46 = l_useState_0(function() --[[ Line: 96 ]]
        -- upvalues: v35 (copy), v34 (copy)
        local l_v35_Setting_0 = v35:GetSetting("LuaStartPageHasAlertBeenClosed3");
        return v34.IsAlertVisible and not l_v35_Setting_0;
    end);
    local v47 = nil;
    local v48 = nil;
    if not v4 then
        local v49, v50 = l_useState_0(false);
        v47 = v49;
        v48 = v50;
    end;
    local v53, v54 = l_useState_0(function() --[[ Line: 110 ]]
        -- upvalues: v35 (copy)
        local l_v35_Setting_1 = v35:GetSetting("LuaStartPageIsOnGridView");
        local v52 = true;
        if l_v35_Setting_1 ~= nil then
            v52 = l_v35_Setting_1;
        end;
        return v52;
    end);
    local v55, v56 = v26("PointingHand");
    local l_Dropdowns_0 = v34.Tabs[v38].Dropdowns;
    local v58, v59 = l_useState_0(if l_Dropdowns_0 and l_Dropdowns_0.DefaultSortIndex then l_Dropdowns_0.DefaultSortIndex else 1);
    local v60, v61 = l_useState_0(1);
    local v62 = nil;
    local v63 = nil;
    if l_Dropdowns_0 then
        if v53 then
            local l_SortDropdown_0 = l_Dropdowns_0.SortDropdown;
            v62 = if not l_SortDropdown_0 then nil else l_map_0(l_SortDropdown_0, function(v65) --[[ Line: 83 ]]
                return v65.DropdownLabel;
            end);
        else
            v62 = nil;
        end;
        local l_GroupDropdown_0 = l_Dropdowns_0.GroupDropdown;
        v63 = if not l_GroupDropdown_0 then nil else l_map_0(l_GroupDropdown_0, function(v67) --[[ Line: 83 ]]
            return v67.DropdownLabel;
        end);
    end;
    local v68 = {};
    if l_Dropdowns_0 then
        if l_Dropdowns_0.SortDropdown then
            v68 = l_join_0(v68, l_Dropdowns_0.SortDropdown[v58].Query);
        end;
        if l_Dropdowns_0.GroupDropdown and #l_Dropdowns_0.GroupDropdown > 0 then
            v68 = l_join_0(v68, l_Dropdowns_0.GroupDropdown[v60].Query);
        end;
    end;
    if v42 then
        v68.search = v42;
    end;
    if v40 then
        v68 = l_join_0(v68, v40);
    end;
    local v69 = l_counter_0();
    return v1.createElement("Frame", {
        Size = if v4 then nil else v34.Size, 
        Position = if v4 then nil else v34.Position, 
        [v1.Tag] = v4 and "StartPage-GamePagePadding X-ColumnM X-Left X-Fill X-Transparent" or "StartPage-GamePagePadding X-ColumnM X-Left X-Transparent"
    }, {
        SearchBar = if v34.HasSearchBar then v1.createElement(v24, {
            Size = UDim2.new(1, -30, 0, 48), 
            LayoutOrder = v69(), 
            PlaceholderText = v37:getText("Plugin", "SearchPlaceholder"), 
            OnSearchRequested = function(v70) --[[ Line: 176 ]] --[[ Name: OnSearchRequested ]]
                -- upvalues: v42 (copy), v43 (copy), v4 (ref), v48 (ref)
                if v70 ~= v42 then
                    v43(v70);
                    if not v4 then
                        v48(false);
                    end;
                end;
            end, 
            ShowSearchIcon = true, 
            Dropdowns = l_Dropdowns_0, 
            ResultComponent = v34.Tabs[v38].PageComponent, 
            Type = v34.Tabs[v38].Title, 
            BaseQuery = v68, 
            [v1.Tag] = "X-Pad"
        }) else nil, 
        AlertBanner = if v6 and l_StartPageManager_0:getDaysSinceFirstUserLogin() >= v29 and v45 then v1.createElement(v18, {
            Title = v37:getText("Plugin", "AlertBanner.Title"), 
            Body = v37:getText("Plugin", "AlertBanner.Body"), 
            Size = UDim2.new(1, -30, 0, 52), 
            OnClose = function() --[[ Line: 203 ]] --[[ Name: OnClose ]]
                -- upvalues: v35 (copy), v46 (copy)
                v35:SetSetting("LuaStartPageHasAlertBeenClosed3", true);
                v46(false);
            end, 
            OnClick = function() --[[ Line: 208 ]] --[[ Name: OnClick ]]
                -- upvalues: l_StartPageManager_0 (ref), v30 (ref)
                l_StartPageManager_0:openLink(v30);
            end
        }) else nil, 
        Controls = if v5 and v34.HideTabs then nil else v1.createElement("Frame", {
            LayoutOrder = v69(), 
            [v1.Tag] = "X-FitY X-Transparent"
        }, {
            Pills = v1.createElement(v22, {
                Tabs = v34.Tabs, 
                DefaultSelectedTab = v34.Tabs[1].Key, 
                OnTabSelected = function(v71) --[[ Line: 224 ]] --[[ Name: OnTabSelected ]]
                    -- upvalues: v38 (copy), v36 (copy), v20 (ref), v34 (copy), v21 (ref), v4 (ref), v48 (ref), v39 (copy)
                    if v71 ~= v38 then
                        v36:log(v20, {
                            telemetryType = "navigation", 
                            telemetrySubtype = "tab", 
                            context = v34.PageName, 
                            from = v34.Tabs[v38].Key, 
                            to = v34.Tabs[v71].Key
                        });
                        v21.restartAnimation();
                        if not v4 then
                            v48(false);
                        end;
                        v39(v71);
                    end;
                end
            }), 
            DropdownControls = v1.createElement("Frame", {
                Size = UDim2.new(1, -30, 0, 32), 
                [v1.Tag] = "X-RowS X-Right X-Transparent"
            }, {
                GroupDropdown = if v63 and (v4 or v47) then v1.createElement(l_SelectInput_0, {
                    LayoutOrder = v69(), 
                    PlaceholderText = v37:getText("Plugin", "GroupDropdown.Placeholder"), 
                    Size = UDim2.new(0, 186, 0, 32), 
                    SelectedIndex = v60, 
                    Items = v63, 
                    Variant = "modern", 
                    TextTruncate = if v7 then Enum.TextTruncate.AtEnd else nil, 
                    OnItemActivated = function(_, v73) --[[ Line: 258 ]] --[[ Name: OnItemActivated ]]
                        -- upvalues: v60 (copy), v21 (ref), v4 (ref), v48 (ref), v61 (copy)
                        if v73 ~= v60 then
                            v21.restartAnimation();
                            if not v4 then
                                v48(false);
                            end;
                            v61(v73);
                        end;
                    end
                }) else nil, 
                ToggleView = if v34.CanSwapBetweenViews and (v4 or v47) then v1.createElement("ImageButton", {
                    LayoutOrder = v69(), 
                    Size = UDim2.new(0, 30, 0, 32), 
                    [v1.Event.Activated] = function() --[[ Line: 276 ]]
                        -- upvalues: v35 (copy), v53 (copy), v54 (copy)
                        v35:SetSetting("LuaStartPageIsOnGridView", not v53);
                        v54(not v53);
                    end, 
                    [v1.Event.MouseEnter] = v55, 
                    [v1.Event.MouseLeave] = v56, 
                    [v1.Tag] = "X-Middle X-Center X-Corner StartPage-PageBackground"
                }, {
                    v1.createElement(l_Image_0, {
                        [v1.Tag] = v53 and "StartPage-ListIcon" or "StartPage-GridIcon"
                    })
                }) else nil, 
                SortDropdown = if v62 and (v4 or v47) then v1.createElement(l_SelectInput_0, {
                    LayoutOrder = v69(), 
                    PlaceholderText = v37:getText("Plugin", "SortDropdown.Placeholder"), 
                    Size = UDim2.new(0, 186, 0, 32), 
                    SelectedIndex = v58, 
                    Items = v62, 
                    Variant = "modern", 
                    OnItemActivated = function(_, v75) --[[ Line: 300 ]] --[[ Name: OnItemActivated ]]
                        -- upvalues: v58 (copy), v21 (ref), v4 (ref), v48 (ref), v59 (copy)
                        if v75 ~= v58 then
                            v21.restartAnimation();
                            if not v4 then
                                v48(false);
                            end;
                            v59(v75);
                        end;
                    end
                }) else nil
            })
        }), 
        Title = v1.createElement("Frame", {
            LayoutOrder = v69(), 
            Size = if v5 then UDim2.new(1, -30, 0, 45) else UDim2.new(0, 300, 0, 45), 
            [v1.Tag] = "X-Transparent"
        }, {
            Label = if not not v4 or v47 then v1.createElement("TextLabel", {
                Text = if v42 ~= "" then v37:getText("Plugin", "SearchResults") else v34.Tabs[v38].Title, 
                [v1.Tag] = "X-Fit StartPage-TextColor StartPage-TextSizeL StartPage-FontBold X-Transparent"
            }) else v1.createElement(v21.Component, {
                Size = UDim2.new(1, 0, 1, 0)
            }), 
            Toggle = if v5 and v4 and v34.CanSwapBetweenViews and v34.HideTabs then v1.createElement("ImageButton", {
                Size = UDim2.new(0, 30, 0, 32), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                [v1.Event.Activated] = function() --[[ Line: 339 ]]
                    -- upvalues: v35 (copy), v53 (copy), v54 (copy)
                    v35:SetSetting("LuaStartPageIsOnGridView", not v53);
                    v54(not v53);
                end, 
                [v1.Event.MouseEnter] = v55, 
                [v1.Event.MouseLeave] = v56, 
                [v1.Tag] = "X-Middle X-Center X-Corner StartPage-PageBackground"
            }, {
                v1.createElement(l_Image_0, {
                    [v1.Tag] = v53 and "StartPage-ListIcon" or "StartPage-GridIcon"
                })
            }) else nil
        }), 
        PageComponent = v1.createElement("Frame", {
            LayoutOrder = v69(), 
            Size = UDim2.new(1, 0, 1, v34.HasSearchBar and -160 or -100), 
            [v1.Tag] = "X-Transparent"
        }, {
            v1.createElement(v34.Tabs[v38].PageComponent, {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, -16, 0, -16), 
                DisplayComponent = if v53 then l_Grid_0 else v23, 
                Dropdowns = l_Dropdowns_0, 
                NoContentDisplayComponent = function(v76) --[[ Line: 365 ]] --[[ Name: NoContentDisplayComponent ]]
                    -- upvalues: v1 (ref), v25 (ref), l_join_0 (ref), v42 (copy), v37 (copy), v34 (copy), v38 (copy)
                    return v1.createElement(v25, l_join_0(v76, {
                        Title = if v42 ~= "" then v37:getText("Plugin", "NoSearchResultsToDisplay") else v34.Tabs[v38].FailedTitle
                    }));
                end, 
                CanDisplayComponentAdjustQuery = not v53 and l_Dropdowns_0 and l_Dropdowns_0.SortDropdown, 
                DisplayComponentHasAdjustedQuery = not v53 and function(v77) --[[ Line: 378 ]]
                    -- upvalues: v4 (ref), v48 (ref), v41 (copy)
                    if not v4 then
                        v48(false);
                    end;
                    v41(v77);
                end or nil, 
                HasParentLoaded = if v4 then nil else v47, 
                InitialContentHasLoaded = v4 and function() --[[ Line: 389 ]]

                end or function(v78) --[[ Line: 390 ]]
                    -- upvalues: v48 (ref)
                    v48(v78);
                end, 
                CellSize = v34.CellSize, 
                CellPadding = UDim2.new(0, 16, 0, 16), 
                BaseQuery = v68
            })
        })
    });
end;