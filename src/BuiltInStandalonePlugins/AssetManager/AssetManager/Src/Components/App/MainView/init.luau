local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v9 = require(script.ContentGrid);
local v10 = require(script.ContentList);
local v11 = require(script.HeaderBar);
local v12 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v13 = require(l_script_FirstAncestor_0.Src.Controllers.SearchController);
local v14 = require(l_script_FirstAncestor_0.Src.Hooks.useFetchProgressInfo);
local v15 = require(l_script_FirstAncestor_0.Src.Hooks.useLayoutInfo);
local v16 = require(l_script_FirstAncestor_0.Src.Hooks.useItems);
local v17 = require(l_script_FirstAncestor_0.Src.Hooks.useSearchInfo);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v19 = require(l_script_FirstAncestor_0.Src.Types);
local function v23(v20, v21, v22) --[[ Line: 39 ]] --[[ Name: getContentView ]]
    -- upvalues: v1 (copy), v9 (copy), v10 (copy)
    if v20 then
        return v1.createElement(v9, {
            LayoutOrder = v22:getNextOrder(), 
            [v1.Tag] = v21 and "HasLoadingBar" or ""
        });
    else
        return v1.createElement(v10, {
            LayoutOrder = v22:getNextOrder(), 
            [v1.Tag] = v21 and "HasLoadingBar" or ""
        });
    end;
end;
local function v29(v24, v25, v26, v27) --[[ Line: 53 ]] --[[ Name: getPlaceholderView ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_LoadingIndicator_0 (copy), l_TextLabel_0 (copy)
    local v28 = v25.ShowSearchOptions and (v25.IsDefaultSearchState or v25.SearchTerm == "") and "" or v27:getText("Plugin", "NoAssets");
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v24:getNextOrder(), 
        [v1.Tag] = "MainContents X-Middle X-Center"
    }, {
        PlaceholderText = if v26 then v1.createElement(l_LoadingIndicator_0) else v1.createElement(l_TextLabel_0, {
            LayoutOrder = v24:getNextOrder(), 
            Text = v28
        })
    });
end;
return function(v30) --[[ Line: 76 ]] --[[ Name: MainView ]]
    -- upvalues: l_Localization_0 (copy), l_LayoutOrderIterator_0 (copy), v12 (copy), v13 (copy), v15 (copy), v14 (copy), v16 (copy), v17 (copy), v1 (copy), l_Pane_0 (copy), v11 (copy), v29 (copy), v23 (copy), v19 (copy), l_LoadingBar_0 (copy)
    local v31 = l_Localization_0.use();
    local v32 = l_LayoutOrderIterator_0.new();
    local v33 = v12.use();
    local v34 = v13.use();
    local v35 = v15(v33);
    local v36 = v14(v33);
    local v37 = v16(v33);
    local v38 = v17(v34);
    local l_IsLoading_0 = v36.IsLoading;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v30.LayoutOrder, 
        [v1.Tag] = "Main X-Stroke X-Top X-Column"
    }, {
        HeaderBar = v1.createElement(v11, {
            LayoutOrder = v32:getNextOrder()
        }), 
        Contents = if #v37 == 0 then v29(v32, v38, l_IsLoading_0, v31) else v23(v35.ViewType == v19.ViewType.Grid, l_IsLoading_0, v32), 
        LoadingBarContainer = if l_IsLoading_0 then v1.createElement(l_Pane_0, {
            LayoutOrder = v32:getNextOrder(), 
            [v1.Tag] = "ProgressBar"
        }, {
            LoadingBar = v1.createElement(l_LoadingBar_0, {
                LayoutOrder = v32:getNextOrder(), 
                Progress = v36.FetchProgress
            })
        }) else nil
    });
end;