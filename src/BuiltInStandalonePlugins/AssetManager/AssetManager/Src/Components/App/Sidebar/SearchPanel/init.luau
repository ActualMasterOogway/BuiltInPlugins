local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local v4 = require(l_script_FirstAncestor_0.Src.Controllers.SearchController);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useSearchInfo);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SearchBar_0 = l_UI_0.SearchBar;
return function(v9) --[[ Line: 24 ]] --[[ Name: SearchPanel ]]
    -- upvalues: l_Localization_0 (copy), v4 (copy), v5 (copy), v1 (copy), l_Pane_0 (copy), l_SearchBar_0 (copy)
    local v10 = l_Localization_0.use();
    local v11 = v4.use();
    local v12 = v5(v11);
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v9.LayoutOrder, 
        [v1.Tag] = "SearchPanel X-Stroke"
    }, {
        SearchBar = v1.createElement(l_SearchBar_0, {
            PlaceholderText = v10:getText("Search", "Placeholder"), 
            SearchTerm = v12.SearchTerm, 
            OnSearchRequested = function(_) --[[ Line: 37 ]] --[[ Name: OnSearchRequested ]]
                -- upvalues: v11 (copy)
                v11:requestSearch();
            end, 
            OnTextChanged = function(v14) --[[ Line: 41 ]] --[[ Name: OnTextChanged ]]
                -- upvalues: v11 (copy)
                v11:setSearchTerm(v14);
            end, 
            OnTextBoxFocusGained = function() --[[ Line: 44 ]] --[[ Name: OnTextBoxFocusGained ]]
                -- upvalues: v11 (copy)
                v11:showSearchOptions();
            end, 
            ShowSearchIcon = true, 
            ShowSearchButton = false, 
            [v1.Tag] = "X-AnchorCenter X-Pad"
        })
    });
end;