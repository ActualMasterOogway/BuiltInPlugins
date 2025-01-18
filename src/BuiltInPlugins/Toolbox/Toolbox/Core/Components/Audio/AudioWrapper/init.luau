local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v10 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioScroller);
local v11 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioTabs);
local v12 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v13 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v14 = require(l_script_FirstAncestor_0.Core.Util.Images);
local v15 = require(l_script_FirstAncestor_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local v16 = require(l_script_FirstAncestor_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v17 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local v18 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v19 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v20 = require(l_script_FirstAncestor_0.Core.Components.CategoryDropDown.CategoryDropDown);
local v21 = require(l_script_FirstAncestor_0.Core.Components.CallToActionBanner.CallToActionBanner);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local v23 = require(l_script_FirstAncestor_0.Core.Thunks.GetAssetPreviewDataForStartup);
local v24 = require(l_script_FirstAncestor_0.Core.Util.getStartupAssetId);
local l_withContext_0 = l_ContextServices_0.withContext;
local v26 = require(l_Packages_0.Dash);
local l_Pane_0 = v2.UI.Pane;
local l_withAbsoluteSizeAndPosition_0 = v2.Wrappers.withAbsoluteSizeAndPosition;
local v29 = v3.PureComponent:extend("AudioWrapper");
local v30 = table.freeze({
    Creator = {
        Id = 1750384777, 
        Name = "Monstercat"
    }
});
v29.init = function(v31, _) --[[ Line: 123 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v12 (copy), v13 (copy), v30 (copy), v11 (copy), v21 (copy), v14 (copy), v20 (copy)
    v31.sizerRef = v3.createRef();
    v31.state = {
        selectedTab = v12.SOUND_EFFECTS.name, 
        audioTabSize = UDim2.new(0, 330, 0, v13.AUDIO_TABS_HEIGHT)
    };
    v31.onTabSelect = function(v33) --[[ Line: 130 ]]
        -- upvalues: v31 (copy), v3 (ref)
        local l_props_0 = v31.props;
        local l_state_0 = v31.state;
        local v36 = if l_state_0.selectedCategory then l_state_0.selectedCategory.name else nil;
        local l_LogPageView_0 = l_props_0.LogPageView;
        v31:setState({
            selectedTab = v33, 
            selectedCategory = v3.None
        });
        l_LogPageView_0(v33, v36);
    end;
    v31.onCategorySelect = function(v38) --[[ Line: 140 ]]
        -- upvalues: v31 (copy), v3 (ref)
        local l_props_1 = v31.props;
        local l_state_1 = v31.state;
        local v41 = v38 or v3.None;
        local v42 = if v38 then v38.name else nil;
        local l_selectedTab_0 = l_state_1.selectedTab;
        local l_LogPageView_1 = l_props_1.LogPageView;
        v31:setState({
            selectedCategory = v41
        });
        l_LogPageView_1(l_selectedTab_0, v42);
    end;
    v31.renderTopContent = function() --[[ Line: 152 ]]
        -- upvalues: v31 (copy), v30 (ref), v12 (ref), v3 (ref), v11 (ref), v21 (ref), v14 (ref), v20 (ref)
        local l_props_2 = v31.props;
        local l_state_2 = v31.state;
        local l_selectedTab_1 = l_state_2.selectedTab;
        local l_audioTabSize_0 = l_state_2.audioTabSize;
        local l_Localization_0 = l_props_2.Localization;
        local v50 = l_props_2.Settings:get("Plugin");
        local l_SearchWithOptions_0 = l_props_2.SearchWithOptions;
        local v52 = l_props_2.AssetAnalytics:get();
        local function v53() --[[ Line: 163 ]]
            -- upvalues: l_SearchWithOptions_0 (copy), v31 (ref), v50 (copy), v30 (ref), v52 (copy)
            l_SearchWithOptions_0(v31.props.Network.networkInterface, v50, v30);
            v52:onCallToActionBannerClicked(v30.Creator.Id);
        end;
        local v54 = l_selectedTab_1 == v12.MUSIC.name;
        return v3.createElement("Frame", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1
        }, {
            v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 11)
            }), 
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 10)
            }), 
            v3.createElement("Frame", {
                LayoutOrder = 1, 
                Size = l_audioTabSize_0, 
                BackgroundColor3 = l_props_2.Stylizer.audioTabs.backgroundButtonColor
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }); 
                v3.createElement(v11, {
                    Size = UDim2.new(1, 0, 0, 30), 
                    SelectedTab = v31.state.selectedTab, 
                    OnTabSelect = v31.onTabSelect
                })
            }), 
            CallToActionBanner = if v54 then v21.Generator({
                LayoutOrder = 2, 
                Image = v14.MONSTER_CAT_BANNER, 
                Text = l_Localization_0:getText("Audio", "FindTracks", {
                    creatorName = v30.Creator.Name
                }), 
                OnClick = v53
            }) else nil, 
            v3.createElement(v20, {
                LayoutOrder = 3, 
                Subcategories = l_props_2.SubcategoryDict, 
                AudioType = l_selectedTab_1, 
                OnCategorySelect = v31.onCategorySelect
            })
        });
    end;
    v31.onAbsoluteSizeChanged = function(v55) --[[ Line: 228 ]]
        -- upvalues: v31 (copy), v13 (ref)
        if v55.AbsoluteSize.X < 375 then
            v31:setState({
                audioTabSize = UDim2.new(1, 0, 0, v13.AUDIO_TABS_HEIGHT)
            });
            return;
        else
            v31:setState({
                audioTabSize = UDim2.new(0, 330, 0, v13.AUDIO_TABS_HEIGHT)
            });
            return;
        end;
    end;
    v31.logImpression = function(v56, v57, v58, v59) --[[ Line: 236 ]]
        -- upvalues: v31 (copy)
        local l_props_3 = v31.props;
        local l_state_3 = v31.state;
        local l_selectedTab_2 = l_state_3.selectedTab;
        local v63 = if l_state_3.selectedCategory then l_state_3.selectedCategory.name else nil;
        if l_props_3.LogAssetImpression then
            return l_props_3.LogAssetImpression(v56, v59, v57, v58, l_props_3.AbsoluteSize, l_props_3.AbsolutePosition, {
                audioType = l_selectedTab_2, 
                categoryName = v63
            });
        else
            return;
        end;
    end;
end;
v29.didMount = function(v64) --[[ Line: 261 ]] --[[ Name: didMount ]]
    -- upvalues: v24 (copy)
    local l_props_4 = v64.props;
    local v66 = tonumber((v24()));
    if v66 then
        local l_OnAssetPreviewButtonClicked_0 = l_props_4.OnAssetPreviewButtonClicked;
        l_props_4.getAssetPreviewDataForStartup(v66, l_props_4.TryInsert, l_props_4.Localization, v64.props.Network.networkInterface, l_OnAssetPreviewButtonClicked_0);
    end;
    if v64.sizerRef.current then
        v64.onAbsoluteSizeChanged(v64.sizerRef.current);
    end;
end;
v29.render = function(v68) --[[ Line: 282 ]] --[[ Name: render ]]
    -- upvalues: v26 (copy), v3 (copy), l_Pane_0 (copy), v5 (copy), v10 (copy)
    local l_props_5 = v68.props;
    local l_state_4 = v68.state;
    local l_AssetSections_0 = l_props_5.AssetSections;
    local l_CanInsertAsset_0 = l_props_5.CanInsertAsset;
    local l_SortName_0 = l_props_5.SortName;
    local l_TryInsert_0 = l_props_5.TryInsert;
    local v75 = l_AssetSections_0[#l_AssetSections_0] and l_AssetSections_0[#l_AssetSections_0].name or nil;
    local l_selectedTab_3 = l_state_4.selectedTab;
    local l_selectedCategory_0 = l_state_4.selectedCategory;
    local l_Stylizer_0 = l_props_5.Stylizer;
    local v79 = nil;
    if l_selectedCategory_0 then
        v79 = {
            l_selectedCategory_0.name
        };
    end;
    local v80 = v26.join({
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Ref] = v68.sizerRef, 
        [v3.Change.AbsoluteSize] = v68.onAbsoluteSizeChanged
    }, l_props_5.WrapperProps);
    return v3.createElement(l_Pane_0, v80, {
        Results = v5.Generator({
            networkInterface = v68.props.Network.networkInterface, 
            categoryName = l_selectedTab_3, 
            sortName = l_SortName_0, 
            queryParams = {}, 
            sectionName = v75, 
            initialPageSize = 20, 
            tags = v79, 
            render = function(v81) --[[ Line: 318 ]] --[[ Name: render ]]
                -- upvalues: v10 (ref), l_TryInsert_0 (copy), l_CanInsertAsset_0 (copy), v68 (copy), l_selectedTab_3 (copy), l_props_5 (copy)
                return v10.Generator({
                    Assets = v81.assets, 
                    Loading = v81.loading, 
                    Total = v81.total, 
                    FetchNextPage = v81.fetchNextPage, 
                    TryInsert = l_TryInsert_0, 
                    CanInsertAsset = l_CanInsertAsset_0, 
                    RenderTopContent = v68.renderTopContent, 
                    AudioType = l_selectedTab_3, 
                    LogImpression = v68.logImpression, 
                    OnAssetPreviewButtonClicked = l_props_5.OnAssetPreviewButtonClicked, 
                    ParentAbsoluteSize = l_props_5.AbsoluteSize, 
                    TryOpenAssetConfig = l_props_5.TryOpenAssetConfig
                });
            end
        })
    });
end;
local function v82() --[[ Line: 338 ]]
    return {};
end;
local function v92(v83) --[[ Line: 342 ]]
    -- upvalues: v17 (copy), v16 (copy), v23 (copy)
    return {
        SearchWithOptions = function(v84, v85, v86) --[[ Line: 344 ]] --[[ Name: SearchWithOptions ]]
            -- upvalues: v83 (copy), v17 (ref)
            v83(v17(v84, v85, v86));
        end, 
        getPageInfoAnalyticsContextInfo = function() --[[ Line: 348 ]] --[[ Name: getPageInfoAnalyticsContextInfo ]]
            -- upvalues: v83 (copy), v16 (ref)
            return v83(v16());
        end, 
        getAssetPreviewDataForStartup = function(v87, v88, v89, v90, v91) --[[ Line: 352 ]] --[[ Name: getAssetPreviewDataForStartup ]]
            -- upvalues: v83 (copy), v23 (ref)
            v83(v23(v87, v88, v89, v90, v91));
        end
    };
end;
v29 = l_withContext_0({
    AssetAnalytics = v15, 
    Localization = l_ContextServices_0.Localization, 
    Settings = v18, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v19
})(v29);
return l_withAbsoluteSizeAndPosition_0((v4.connect(v82, v92)(v29)));