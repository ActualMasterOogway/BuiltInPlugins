local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v8 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v10 = require(l_Packages_0.Framework);
local v11 = require(l_Packages_0.Cryo);
local v12 = require(l_Packages_0.Roact);
local v13 = require(l_Packages_0.RoactRodux);
local v14 = require(l_script_FirstAncestor_0.Packages.RoactNavigation);
local v15 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local l_ContextServices_0 = v10.ContextServices;
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v18 = require(l_Packages_0.Dash);
local v19 = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v20 = require(l_script_FirstAncestor_0.Core.Components.Categorization.HomeView);
local v21 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioViewWrapper);
local v22 = require(l_script_FirstAncestor_0.Core.Components.Font.FontView);
local v23 = require(l_script_FirstAncestor_0.Core.Components.Categorization.ResultsView);
local v24 = require(l_script_FirstAncestor_0.Core.Components.Categorization.SubcategoriesView);
local v25 = require(l_script_FirstAncestor_0.Core.Components.Categorization.SubcategoriesSwimlaneView);
local v26 = require(l_script_FirstAncestor_0.Core.ContextServices.NavigationContext);
local v27 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v28 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v29 = require(l_script_FirstAncestor_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local v30 = require(l_script_FirstAncestor_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v31 = require(l_script_FirstAncestor_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local function _(v32) --[[ Line: 46 ]] --[[ Name: wrapViewForRoactNavigation ]]
    -- upvalues: v12 (copy), v11 (copy), v18 (copy), v31 (copy), v30 (copy), l_ContextServices_0 (copy), v29 (copy), v26 (copy), v28 (copy), v27 (copy), v14 (copy), v13 (copy)
    return function(v33) --[[ Line: 47 ]]
        -- upvalues: v12 (ref), v11 (ref), v18 (ref), v32 (copy), v31 (ref), v30 (ref), l_ContextServices_0 (ref), v29 (ref), v26 (ref), v28 (ref), v27 (ref), v14 (ref), v13 (ref)
        local v34 = v12.PureComponent:extend("NavWrapper");
        v34.init = function(v35, v36) --[[ Line: 49 ]] --[[ Name: init ]]
            -- upvalues: v11 (ref)
            v35.updatePageInfo = function(v37) --[[ Line: 50 ]]
                -- upvalues: v36 (copy)
                local l_networkInterface_0 = v36.Network.networkInterface;
                local v39 = v36.Settings:get("Plugin");
                v36.updatePageInfo(l_networkInterface_0, v39, v37);
            end;
            v35.logPageView = function(v40, v41) --[[ Line: 57 ]]
                -- upvalues: v36 (copy)
                local l_NavigationContext_0 = v36.NavigationContext;
                local v43 = v36.AssetAnalytics:get();
                local l_getPageInfoAnalyticsContextInfo_0 = v36.getPageInfoAnalyticsContextInfo;
                if l_getPageInfoAnalyticsContextInfo_0 then
                    local v45 = l_getPageInfoAnalyticsContextInfo_0();
                    v43:logPageView(v45.searchId, v40, v41, l_NavigationContext_0:getBreadcrumbRoute(), v45.toolboxTab, v45.currentCategory);
                end;
            end;
            v35.navigateTo = function(v46, v47, v48, v49) --[[ Line: 72 ]]
                -- upvalues: v35 (copy), v36 (copy)
                if v49.QueryParams then
                    v35.updatePageInfo({
                        queryParams = v49.QueryParams
                    });
                end;
                local l_NavigationContext_1 = v36.NavigationContext;
                v35.logPageView(v47, v48);
                l_NavigationContext_1:push(v46, v48, v49);
            end;
            v35.navigateGoBack = function() --[[ Line: 84 ]]
                -- upvalues: v36 (copy), v35 (copy), v11 (ref)
                local l_NavigationContext_2 = v36.NavigationContext;
                local v52 = v36.AssetAnalytics:get();
                local l_getPageInfoAnalyticsContextInfo_1 = v36.getPageInfoAnalyticsContextInfo;
                v35.updatePageInfo({
                    queryParams = v11.None
                });
                if l_getPageInfoAnalyticsContextInfo_1 then
                    local v54 = l_getPageInfoAnalyticsContextInfo_1();
                    local l_searchId_0 = v54.searchId;
                    local v56 = l_NavigationContext_2:getBreadcrumbRoute();
                    v52:logGoBack(l_searchId_0, v56[2], l_NavigationContext_2:getCurrentPath(), v56, v54.toolboxTab, v54.currentCategory);
                end;
                l_NavigationContext_2:popToTop();
            end;
        end;
        v34.render = function(v57) --[[ Line: 108 ]] --[[ Name: render ]]
            -- upvalues: v18 (ref), v33 (copy), v32 (ref)
            local v58 = v18.join(v57.props.navigation.state.params, {
                focused = v57.props.navigation.isFocused(), 
                navigateTo = v57.navigateTo, 
                navigateGoBack = v57.navigateGoBack, 
                logPageView = v57.logPageView
            }, if v33 then v33 else {}, v18.join(v57.props.navigation.state, {
                key = v18.None, 
                routeName = v18.None
            }));
            return v32(v58);
        end;
        v34.didMount = function(v59) --[[ Line: 130 ]] --[[ Name: didMount ]]
            v59.props.NavigationContext:updateNavigation(v59.props.navigation);
        end;
        local function v64(v60) --[[ Line: 136 ]] --[[ Name: mapDispatchToProps ]]
            -- upvalues: v31 (ref), v30 (ref)
            return {
                updatePageInfo = function(v61, v62, v63) --[[ Line: 138 ]] --[[ Name: updatePageInfo ]]
                    -- upvalues: v60 (copy), v31 (ref)
                    v60(v31(v61, v62, v63));
                end, 
                getPageInfoAnalyticsContextInfo = function() --[[ Line: 141 ]] --[[ Name: getPageInfoAnalyticsContextInfo ]]
                    -- upvalues: v60 (copy), v30 (ref)
                    return v60(v30());
                end
            };
        end;
        v34 = l_ContextServices_0.withContext({
            AssetAnalytics = v29, 
            NavigationContext = v26, 
            Network = v28, 
            Settings = v27
        })(v34);
        v34 = v14.withNavigation(v34);
        v34 = v13.connect(nil, v64)(v34);
        return v12.createElement(v34, v33);
    end;
end;
local function v68(v66) --[[ Line: 161 ]] --[[ Name: getAssetLogicWrapperProps ]]
    -- upvalues: v8 (copy)
    local v67 = v66.params or v66;
    return {
        CanInsertAsset = v67.CanInsertAsset, 
        LogAssetImpression = v67.LogAssetImpression, 
        OnAssetPreviewButtonClicked = v67.OnAssetPreviewButtonClicked, 
        OnSearchByCreator = if v8() then v67.OnSearchByCreator else nil, 
        TryInsert = v67.TryInsert, 
        TryOpenAssetConfig = v67.TryOpenAssetConfig
    };
end;
local v69 = {};
local v70 = {};
local l_HOME_0 = v15.NAVIGATION.HOME;
local function v87(v72) --[[ Line: 176 ]]
    -- upvalues: v21 (copy), v22 (copy), v20 (copy), v12 (copy), v18 (copy), v68 (copy), v15 (copy)
    local v73 = nil;
    v73 = if v72.AssetType == Enum.AssetType.Audio then v21 else if v72.AssetType == Enum.AssetType.FontFamily then v22 else v20;
    return v12.createElement(v73, v18.join(v68(v72), {
        AssetSections = v72.AssetSections, 
        CategoryName = v72.CategoryName, 
        OnClickSubcategory = function(v74, v75, v76, v77, v78) --[[ Line: 191 ]] --[[ Name: OnClickSubcategory ]]
            -- upvalues: v72 (copy), v15 (ref), v18 (ref), v68 (ref)
            if v75.childCount == 0 then
                v72.navigateTo(v15.NAVIGATION.RESULTS, v15.HOMEVIEW_SEARCH_CATEGORY, v74, v18.join(v72, v68(v72), {
                    CategoryName = v76, 
                    SortName = v77, 
                    SearchSource = v15.SEARCH_SOURCE.CATEGORY, 
                    QueryParams = v78, 
                    SwimlaneName = v74
                }));
                return;
            else
                v72.navigateTo(v15.NAVIGATION.SUBCATEGORY, v15.HOMEVIEW_SEARCH_CATEGORY, v74, v18.join(v72, v68(v72), {
                    CategoryName = v76, 
                    SortName = v77, 
                    SubcategoryPath = {
                        v74
                    }, 
                    SubcategoryDict = v75.children, 
                    TopKeywords = v72.TopKeywords, 
                    QueryParams = v78
                }));
                return;
            end;
        end, 
        OnClickSeeAllSubcategories = function(v79, v80, v81) --[[ Line: 227 ]] --[[ Name: OnClickSeeAllSubcategories ]]
            -- upvalues: v72 (copy), v15 (ref), v18 (ref), v68 (ref)
            v72.navigateTo(v15.NAVIGATION.ALL_SUBCATEGORIES, v15.HOMEVIEW_SEARCH_CATEGORY, v15.NAVIGATION.ALL_SUBCATEGORIES, v18.join(v72, v68(v72), {
                CategoryName = v80, 
                SortName = v81, 
                SubcategoryDict = v79
            }));
        end, 
        OnClickSeeAllAssets = function(v82, v83, v84, v85, v86) --[[ Line: 240 ]] --[[ Name: OnClickSeeAllAssets ]]
            -- upvalues: v72 (copy), v15 (ref), v18 (ref), v68 (ref)
            v72.navigateTo(v15.NAVIGATION.RESULTS, v82, v82, v18.join(v72, v68(v72), {
                CategoryName = v83, 
                SearchTerm = v85, 
                SectionName = v82, 
                SortName = v84, 
                QueryParams = v86, 
                SwimlaneName = v82
            }));
        end, 
        SubcategoryDict = v72.SubcategoryDict, 
        SortName = v72.SortName, 
        Size = UDim2.new(1, 0, 1, 0), 
        TopKeywords = v72.TopKeywords, 
        MaxWidth = v72.MaxWidth, 
        LogPageView = v72.logPageView
    }));
end;
local l_v87_0 = v87 --[[ copy: 31 -> 35 ]];
v70[l_HOME_0] = function(v89) --[[ Line: 47 ]]
    -- upvalues: v12 (copy), v11 (copy), v18 (copy), l_v87_0 (copy), v31 (copy), v30 (copy), l_ContextServices_0 (copy), v29 (copy), v26 (copy), v28 (copy), v27 (copy), v14 (copy), v13 (copy)
    local v90 = v12.PureComponent:extend("NavWrapper");
    v90.init = function(v91, v92) --[[ Line: 49 ]] --[[ Name: init ]]
        -- upvalues: v11 (ref)
        v91.updatePageInfo = function(v93) --[[ Line: 50 ]]
            -- upvalues: v92 (copy)
            local l_networkInterface_1 = v92.Network.networkInterface;
            local v95 = v92.Settings:get("Plugin");
            v92.updatePageInfo(l_networkInterface_1, v95, v93);
        end;
        v91.logPageView = function(v96, v97) --[[ Line: 57 ]]
            -- upvalues: v92 (copy)
            local l_NavigationContext_3 = v92.NavigationContext;
            local v99 = v92.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_2 = v92.getPageInfoAnalyticsContextInfo;
            if l_getPageInfoAnalyticsContextInfo_2 then
                local v101 = l_getPageInfoAnalyticsContextInfo_2();
                v99:logPageView(v101.searchId, v96, v97, l_NavigationContext_3:getBreadcrumbRoute(), v101.toolboxTab, v101.currentCategory);
            end;
        end;
        v91.navigateTo = function(v102, v103, v104, v105) --[[ Line: 72 ]]
            -- upvalues: v91 (copy), v92 (copy)
            if v105.QueryParams then
                v91.updatePageInfo({
                    queryParams = v105.QueryParams
                });
            end;
            local l_NavigationContext_4 = v92.NavigationContext;
            v91.logPageView(v103, v104);
            l_NavigationContext_4:push(v102, v104, v105);
        end;
        v91.navigateGoBack = function() --[[ Line: 84 ]]
            -- upvalues: v92 (copy), v91 (copy), v11 (ref)
            local l_NavigationContext_5 = v92.NavigationContext;
            local v108 = v92.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_3 = v92.getPageInfoAnalyticsContextInfo;
            v91.updatePageInfo({
                queryParams = v11.None
            });
            if l_getPageInfoAnalyticsContextInfo_3 then
                local v110 = l_getPageInfoAnalyticsContextInfo_3();
                local l_searchId_1 = v110.searchId;
                local v112 = l_NavigationContext_5:getBreadcrumbRoute();
                v108:logGoBack(l_searchId_1, v112[2], l_NavigationContext_5:getCurrentPath(), v112, v110.toolboxTab, v110.currentCategory);
            end;
            l_NavigationContext_5:popToTop();
        end;
    end;
    v90.render = function(v113) --[[ Line: 108 ]] --[[ Name: render ]]
        -- upvalues: v18 (ref), v89 (copy), l_v87_0 (ref)
        local v114 = v18.join(v113.props.navigation.state.params, {
            focused = v113.props.navigation.isFocused(), 
            navigateTo = v113.navigateTo, 
            navigateGoBack = v113.navigateGoBack, 
            logPageView = v113.logPageView
        }, if v89 then v89 else {}, v18.join(v113.props.navigation.state, {
            key = v18.None, 
            routeName = v18.None
        }));
        return l_v87_0(v114);
    end;
    v90.didMount = function(v115) --[[ Line: 130 ]] --[[ Name: didMount ]]
        v115.props.NavigationContext:updateNavigation(v115.props.navigation);
    end;
    local function v120(v116) --[[ Line: 136 ]] --[[ Name: mapDispatchToProps ]]
        -- upvalues: v31 (ref), v30 (ref)
        return {
            updatePageInfo = function(v117, v118, v119) --[[ Line: 138 ]] --[[ Name: updatePageInfo ]]
                -- upvalues: v116 (copy), v31 (ref)
                v116(v31(v117, v118, v119));
            end, 
            getPageInfoAnalyticsContextInfo = function() --[[ Line: 141 ]] --[[ Name: getPageInfoAnalyticsContextInfo ]]
                -- upvalues: v116 (copy), v30 (ref)
                return v116(v30());
            end
        };
    end;
    v90 = l_ContextServices_0.withContext({
        AssetAnalytics = v29, 
        NavigationContext = v26, 
        Network = v28, 
        Settings = v27
    })(v90);
    v90 = v14.withNavigation(v90);
    v90 = v13.connect(nil, v120)(v90);
    return v12.createElement(v90, v89);
end;
l_HOME_0 = {};
local l_ALL_SUBCATEGORIES_0 = v15.NAVIGATION.ALL_SUBCATEGORIES;
local function v138(v122) --[[ Line: 266 ]]
    -- upvalues: v12 (copy), v24 (copy), v18 (copy), v68 (copy), v15 (copy)
    local l_params_0 = v122.params;
    local v124 = l_params_0 and l_params_0.CategoryName;
    local v125 = l_params_0 and l_params_0.SortName;
    local v126 = l_params_0 and l_params_0.SubcategoryDict;
    return v12.createElement(v24, v18.join(v68(v122), {
        CategoryName = v124, 
        OnClickBack = function() --[[ Line: 276 ]] --[[ Name: OnClickBack ]]
            -- upvalues: v122 (copy)
            v122:navigateGoBack();
        end, 
        OnClickSubcategory = function(v127, v128, v129, v130, v131) --[[ Line: 279 ]] --[[ Name: OnClickSubcategory ]]
            -- upvalues: v122 (copy), v15 (ref), v18 (ref), v68 (ref)
            v122.navigateTo(v15.NAVIGATION.SUBCATEGORY, v15.HOMEVIEW_SEARCH_CATEGORY, v127[#v127], v18.join(v122, v68(v122), {
                CategoryName = v129, 
                SortName = v130, 
                SubcategoryPath = v127, 
                SubcategoryDict = v128, 
                QueryParams = v131
            }));
        end, 
        OnClickSeeAllAssets = function(v132, v133, v134, _, v136, v137) --[[ Line: 299 ]] --[[ Name: OnClickSeeAllAssets ]]
            -- upvalues: v122 (copy), v15 (ref), v18 (ref), v68 (ref)
            v122.navigateTo(v15.NAVIGATION.RESULTS, v15.HOMEVIEW_SEARCH_CATEGORY, v132, v18.join(v122, v68(v122), {
                CategoryName = v133, 
                SectionName = v132, 
                SortName = v134, 
                SearchSource = v15.SEARCH_SOURCE.CATEGORY, 
                QueryParams = v136, 
                SwimlaneName = v137
            }));
        end, 
        SortName = v125, 
        Size = UDim2.new(1, 0, 1, 0), 
        SubcategoryDict = v126
    }));
end;
local l_v138_0 = v138 --[[ copy: 32 -> 36 ]];
l_HOME_0[l_ALL_SUBCATEGORIES_0] = function(v140) --[[ Line: 47 ]]
    -- upvalues: v12 (copy), v11 (copy), v18 (copy), l_v138_0 (copy), v31 (copy), v30 (copy), l_ContextServices_0 (copy), v29 (copy), v26 (copy), v28 (copy), v27 (copy), v14 (copy), v13 (copy)
    local v141 = v12.PureComponent:extend("NavWrapper");
    v141.init = function(v142, v143) --[[ Line: 49 ]] --[[ Name: init ]]
        -- upvalues: v11 (ref)
        v142.updatePageInfo = function(v144) --[[ Line: 50 ]]
            -- upvalues: v143 (copy)
            local l_networkInterface_2 = v143.Network.networkInterface;
            local v146 = v143.Settings:get("Plugin");
            v143.updatePageInfo(l_networkInterface_2, v146, v144);
        end;
        v142.logPageView = function(v147, v148) --[[ Line: 57 ]]
            -- upvalues: v143 (copy)
            local l_NavigationContext_6 = v143.NavigationContext;
            local v150 = v143.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_4 = v143.getPageInfoAnalyticsContextInfo;
            if l_getPageInfoAnalyticsContextInfo_4 then
                local v152 = l_getPageInfoAnalyticsContextInfo_4();
                v150:logPageView(v152.searchId, v147, v148, l_NavigationContext_6:getBreadcrumbRoute(), v152.toolboxTab, v152.currentCategory);
            end;
        end;
        v142.navigateTo = function(v153, v154, v155, v156) --[[ Line: 72 ]]
            -- upvalues: v142 (copy), v143 (copy)
            if v156.QueryParams then
                v142.updatePageInfo({
                    queryParams = v156.QueryParams
                });
            end;
            local l_NavigationContext_7 = v143.NavigationContext;
            v142.logPageView(v154, v155);
            l_NavigationContext_7:push(v153, v155, v156);
        end;
        v142.navigateGoBack = function() --[[ Line: 84 ]]
            -- upvalues: v143 (copy), v142 (copy), v11 (ref)
            local l_NavigationContext_8 = v143.NavigationContext;
            local v159 = v143.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_5 = v143.getPageInfoAnalyticsContextInfo;
            v142.updatePageInfo({
                queryParams = v11.None
            });
            if l_getPageInfoAnalyticsContextInfo_5 then
                local v161 = l_getPageInfoAnalyticsContextInfo_5();
                local l_searchId_2 = v161.searchId;
                local v163 = l_NavigationContext_8:getBreadcrumbRoute();
                v159:logGoBack(l_searchId_2, v163[2], l_NavigationContext_8:getCurrentPath(), v163, v161.toolboxTab, v161.currentCategory);
            end;
            l_NavigationContext_8:popToTop();
        end;
    end;
    v141.render = function(v164) --[[ Line: 108 ]] --[[ Name: render ]]
        -- upvalues: v18 (ref), v140 (copy), l_v138_0 (ref)
        local v165 = v18.join(v164.props.navigation.state.params, {
            focused = v164.props.navigation.isFocused(), 
            navigateTo = v164.navigateTo, 
            navigateGoBack = v164.navigateGoBack, 
            logPageView = v164.logPageView
        }, if v140 then v140 else {}, v18.join(v164.props.navigation.state, {
            key = v18.None, 
            routeName = v18.None
        }));
        return l_v138_0(v165);
    end;
    v141.didMount = function(v166) --[[ Line: 130 ]] --[[ Name: didMount ]]
        v166.props.NavigationContext:updateNavigation(v166.props.navigation);
    end;
    local function v171(v167) --[[ Line: 136 ]] --[[ Name: mapDispatchToProps ]]
        -- upvalues: v31 (ref), v30 (ref)
        return {
            updatePageInfo = function(v168, v169, v170) --[[ Line: 138 ]] --[[ Name: updatePageInfo ]]
                -- upvalues: v167 (copy), v31 (ref)
                v167(v31(v168, v169, v170));
            end, 
            getPageInfoAnalyticsContextInfo = function() --[[ Line: 141 ]] --[[ Name: getPageInfoAnalyticsContextInfo ]]
                -- upvalues: v167 (copy), v30 (ref)
                return v167(v30());
            end
        };
    end;
    v141 = l_ContextServices_0.withContext({
        AssetAnalytics = v29, 
        NavigationContext = v26, 
        Network = v28, 
        Settings = v27
    })(v141);
    v141 = v14.withNavigation(v141);
    v141 = v13.connect(nil, v171)(v141);
    return v12.createElement(v141, v140);
end;
l_ALL_SUBCATEGORIES_0 = {};
v87 = v15.NAVIGATION.SUBCATEGORY;
local function v183(v172) --[[ Line: 329 ]]
    -- upvalues: v12 (copy), v25 (copy), v18 (copy), v68 (copy), v15 (copy)
    local l_params_1 = v172.params;
    local v174 = l_params_1 and l_params_1.CategoryName;
    local v175 = l_params_1 and l_params_1.SortName;
    local v176 = l_params_1 and l_params_1.SubcategoryDict;
    local v177 = l_params_1 and l_params_1.SubcategoryPath;
    return v12.createElement(v25, v18.join(v68(v172), {
        CategoryName = v174, 
        MaxWidth = v172.MaxWidth, 
        OnClickBack = function() --[[ Line: 341 ]] --[[ Name: OnClickBack ]]
            -- upvalues: v172 (copy)
            v172:navigateGoBack();
        end, 
        OnClickSeeAllAssets = function(v178, v179, v180, v181, v182) --[[ Line: 344 ]] --[[ Name: OnClickSeeAllAssets ]]
            -- upvalues: v172 (copy), v15 (ref), v18 (ref), v68 (ref)
            v172.navigateTo(v15.NAVIGATION.RESULTS, v15.HOMEVIEW_SEARCH_CATEGORY, v178, v18.join(v172, v68(v172), {
                CategoryName = v179, 
                SearchTerm = v181, 
                SortName = v180, 
                SearchSource = v15.SEARCH_SOURCE.CATEGORY, 
                QueryParams = v182
            }));
        end, 
        Size = UDim2.new(1, 0, 1, 0), 
        SortName = v175, 
        SubcategoryDict = v176, 
        SubcategoryPath = v177
    }));
end;
l_ALL_SUBCATEGORIES_0[v87] = function(v184) --[[ Line: 47 ]]
    -- upvalues: v12 (copy), v11 (copy), v18 (copy), v183 (copy), v31 (copy), v30 (copy), l_ContextServices_0 (copy), v29 (copy), v26 (copy), v28 (copy), v27 (copy), v14 (copy), v13 (copy)
    local v185 = v12.PureComponent:extend("NavWrapper");
    v185.init = function(v186, v187) --[[ Line: 49 ]] --[[ Name: init ]]
        -- upvalues: v11 (ref)
        v186.updatePageInfo = function(v188) --[[ Line: 50 ]]
            -- upvalues: v187 (copy)
            local l_networkInterface_3 = v187.Network.networkInterface;
            local v190 = v187.Settings:get("Plugin");
            v187.updatePageInfo(l_networkInterface_3, v190, v188);
        end;
        v186.logPageView = function(v191, v192) --[[ Line: 57 ]]
            -- upvalues: v187 (copy)
            local l_NavigationContext_9 = v187.NavigationContext;
            local v194 = v187.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_6 = v187.getPageInfoAnalyticsContextInfo;
            if l_getPageInfoAnalyticsContextInfo_6 then
                local v196 = l_getPageInfoAnalyticsContextInfo_6();
                v194:logPageView(v196.searchId, v191, v192, l_NavigationContext_9:getBreadcrumbRoute(), v196.toolboxTab, v196.currentCategory);
            end;
        end;
        v186.navigateTo = function(v197, v198, v199, v200) --[[ Line: 72 ]]
            -- upvalues: v186 (copy), v187 (copy)
            if v200.QueryParams then
                v186.updatePageInfo({
                    queryParams = v200.QueryParams
                });
            end;
            local l_NavigationContext_10 = v187.NavigationContext;
            v186.logPageView(v198, v199);
            l_NavigationContext_10:push(v197, v199, v200);
        end;
        v186.navigateGoBack = function() --[[ Line: 84 ]]
            -- upvalues: v187 (copy), v186 (copy), v11 (ref)
            local l_NavigationContext_11 = v187.NavigationContext;
            local v203 = v187.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_7 = v187.getPageInfoAnalyticsContextInfo;
            v186.updatePageInfo({
                queryParams = v11.None
            });
            if l_getPageInfoAnalyticsContextInfo_7 then
                local v205 = l_getPageInfoAnalyticsContextInfo_7();
                local l_searchId_3 = v205.searchId;
                local v207 = l_NavigationContext_11:getBreadcrumbRoute();
                v203:logGoBack(l_searchId_3, v207[2], l_NavigationContext_11:getCurrentPath(), v207, v205.toolboxTab, v205.currentCategory);
            end;
            l_NavigationContext_11:popToTop();
        end;
    end;
    v185.render = function(v208) --[[ Line: 108 ]] --[[ Name: render ]]
        -- upvalues: v18 (ref), v184 (copy), v183 (ref)
        local v209 = v18.join(v208.props.navigation.state.params, {
            focused = v208.props.navigation.isFocused(), 
            navigateTo = v208.navigateTo, 
            navigateGoBack = v208.navigateGoBack, 
            logPageView = v208.logPageView
        }, if v184 then v184 else {}, v18.join(v208.props.navigation.state, {
            key = v18.None, 
            routeName = v18.None
        }));
        return v183(v209);
    end;
    v185.didMount = function(v210) --[[ Line: 130 ]] --[[ Name: didMount ]]
        v210.props.NavigationContext:updateNavigation(v210.props.navigation);
    end;
    local function v215(v211) --[[ Line: 136 ]] --[[ Name: mapDispatchToProps ]]
        -- upvalues: v31 (ref), v30 (ref)
        return {
            updatePageInfo = function(v212, v213, v214) --[[ Line: 138 ]] --[[ Name: updatePageInfo ]]
                -- upvalues: v211 (copy), v31 (ref)
                v211(v31(v212, v213, v214));
            end, 
            getPageInfoAnalyticsContextInfo = function() --[[ Line: 141 ]] --[[ Name: getPageInfoAnalyticsContextInfo ]]
                -- upvalues: v211 (copy), v30 (ref)
                return v211(v30());
            end
        };
    end;
    v185 = l_ContextServices_0.withContext({
        AssetAnalytics = v29, 
        NavigationContext = v26, 
        Network = v28, 
        Settings = v27
    })(v185);
    v185 = v14.withNavigation(v185);
    v185 = v13.connect(nil, v215)(v185);
    return v12.createElement(v185, v184);
end;
v87 = {};
v138 = v15.NAVIGATION.RESULTS;
local function v225(v216) --[[ Line: 367 ]]
    -- upvalues: v12 (copy), v23 (copy), v18 (copy), v68 (copy)
    local l_params_2 = v216.params;
    local v218 = l_params_2 and l_params_2.CategoryName;
    local v219 = l_params_2 and l_params_2.SectionName;
    local v220 = l_params_2 and l_params_2.SearchTerm;
    local v221 = l_params_2 and l_params_2.SortName;
    local v222 = l_params_2 and l_params_2.SearchSource;
    local v223 = if l_params_2 then l_params_2.QueryParams else nil;
    local v224 = if l_params_2 then l_params_2.SwimlaneName else nil;
    return v12.createElement(v23, v18.join(v68(v216), {
        CategoryName = v218, 
        OnClickBack = function() --[[ Line: 381 ]] --[[ Name: OnClickBack ]]
            -- upvalues: v216 (copy)
            v216:navigateGoBack();
        end, 
        SearchTerm = v220, 
        SectionName = v219, 
        Size = UDim2.new(1, 0, 1, 0), 
        SortName = v221, 
        SearchSource = v222, 
        QueryParams = v223, 
        SwimlaneName = v224
    }));
end;
v87[v138] = function(v226) --[[ Line: 47 ]]
    -- upvalues: v12 (copy), v11 (copy), v18 (copy), v225 (copy), v31 (copy), v30 (copy), l_ContextServices_0 (copy), v29 (copy), v26 (copy), v28 (copy), v27 (copy), v14 (copy), v13 (copy)
    local v227 = v12.PureComponent:extend("NavWrapper");
    v227.init = function(v228, v229) --[[ Line: 49 ]] --[[ Name: init ]]
        -- upvalues: v11 (ref)
        v228.updatePageInfo = function(v230) --[[ Line: 50 ]]
            -- upvalues: v229 (copy)
            local l_networkInterface_4 = v229.Network.networkInterface;
            local v232 = v229.Settings:get("Plugin");
            v229.updatePageInfo(l_networkInterface_4, v232, v230);
        end;
        v228.logPageView = function(v233, v234) --[[ Line: 57 ]]
            -- upvalues: v229 (copy)
            local l_NavigationContext_12 = v229.NavigationContext;
            local v236 = v229.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_8 = v229.getPageInfoAnalyticsContextInfo;
            if l_getPageInfoAnalyticsContextInfo_8 then
                local v238 = l_getPageInfoAnalyticsContextInfo_8();
                v236:logPageView(v238.searchId, v233, v234, l_NavigationContext_12:getBreadcrumbRoute(), v238.toolboxTab, v238.currentCategory);
            end;
        end;
        v228.navigateTo = function(v239, v240, v241, v242) --[[ Line: 72 ]]
            -- upvalues: v228 (copy), v229 (copy)
            if v242.QueryParams then
                v228.updatePageInfo({
                    queryParams = v242.QueryParams
                });
            end;
            local l_NavigationContext_13 = v229.NavigationContext;
            v228.logPageView(v240, v241);
            l_NavigationContext_13:push(v239, v241, v242);
        end;
        v228.navigateGoBack = function() --[[ Line: 84 ]]
            -- upvalues: v229 (copy), v228 (copy), v11 (ref)
            local l_NavigationContext_14 = v229.NavigationContext;
            local v245 = v229.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_9 = v229.getPageInfoAnalyticsContextInfo;
            v228.updatePageInfo({
                queryParams = v11.None
            });
            if l_getPageInfoAnalyticsContextInfo_9 then
                local v247 = l_getPageInfoAnalyticsContextInfo_9();
                local l_searchId_4 = v247.searchId;
                local v249 = l_NavigationContext_14:getBreadcrumbRoute();
                v245:logGoBack(l_searchId_4, v249[2], l_NavigationContext_14:getCurrentPath(), v249, v247.toolboxTab, v247.currentCategory);
            end;
            l_NavigationContext_14:popToTop();
        end;
    end;
    v227.render = function(v250) --[[ Line: 108 ]] --[[ Name: render ]]
        -- upvalues: v18 (ref), v226 (copy), v225 (ref)
        local v251 = v18.join(v250.props.navigation.state.params, {
            focused = v250.props.navigation.isFocused(), 
            navigateTo = v250.navigateTo, 
            navigateGoBack = v250.navigateGoBack, 
            logPageView = v250.logPageView
        }, if v226 then v226 else {}, v18.join(v250.props.navigation.state, {
            key = v18.None, 
            routeName = v18.None
        }));
        return v225(v251);
    end;
    v227.didMount = function(v252) --[[ Line: 130 ]] --[[ Name: didMount ]]
        v252.props.NavigationContext:updateNavigation(v252.props.navigation);
    end;
    local function v257(v253) --[[ Line: 136 ]] --[[ Name: mapDispatchToProps ]]
        -- upvalues: v31 (ref), v30 (ref)
        return {
            updatePageInfo = function(v254, v255, v256) --[[ Line: 138 ]] --[[ Name: updatePageInfo ]]
                -- upvalues: v253 (copy), v31 (ref)
                v253(v31(v254, v255, v256));
            end, 
            getPageInfoAnalyticsContextInfo = function() --[[ Line: 141 ]] --[[ Name: getPageInfoAnalyticsContextInfo ]]
                -- upvalues: v253 (copy), v30 (ref)
                return v253(v30());
            end
        };
    end;
    v227 = l_ContextServices_0.withContext({
        AssetAnalytics = v29, 
        NavigationContext = v26, 
        Network = v28, 
        Settings = v27
    })(v227);
    v227 = v14.withNavigation(v227);
    v227 = v13.connect(nil, v257)(v227);
    return v12.createElement(v227, v226);
end;
v6(v69, 1, v70, l_HOME_0, l_ALL_SUBCATEGORIES_0, v87);
v70 = v12.PureComponent:extend("NavigationContainer");
v70.render = function(v258) --[[ Line: 399 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v14 (copy), v69 (copy), l_ContextServices_0 (copy), v26 (copy), v12 (copy)
    local l_props_0 = v258.props;
    local l_HOME_1 = v15.NAVIGATION.HOME;
    local v261 = v14.createRobloxStackNavigator(v69, {
        initialRouteName = l_HOME_1, 
        initialRouteParams = l_props_0
    });
    return l_ContextServices_0.provide({
        v26.new(l_HOME_1)
    }, v12.createElement(v14.createAppContainer(v261)));
end;
return v19(v70);