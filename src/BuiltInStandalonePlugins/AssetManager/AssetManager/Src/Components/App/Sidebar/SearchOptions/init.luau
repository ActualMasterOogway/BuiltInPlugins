local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Separator_0 = l_UI_0.Separator;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v13 = require(l_script_FirstAncestor_0.Src.Components.Shared.SearchFilterItem);
local v14 = require(l_script_FirstAncestor_0.Src.Components.Shared.Toolbar);
local v15 = require(l_script_FirstAncestor_0.Src.Controllers.SearchController);
local v16 = require(l_script_FirstAncestor_0.Src.Hooks.useSearchInfo);
local v17 = require(l_script_FirstAncestor_0.Src.Hooks.useSearchSourceList);
local v18 = require(l_script_FirstAncestor_0.Src.Types);
local v19 = require(l_script_FirstAncestor_0.Src.Resources.PluginStyles);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local function _(v21) --[[ Line: 39 ]] --[[ Name: getAssetTypeIndex ]]
    -- upvalues: v3 (copy), v18 (copy)
    return v3.findIndex(v18.getEnumAsList(v18.AssetType), function(v22) --[[ Line: 40 ]]
        -- upvalues: v21 (copy)
        return v22 == v21;
    end);
end;
return function(v24) --[[ Line: 45 ]] --[[ Name: SearchOptions ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_Localization_0 (copy), v15 (copy), v16 (copy), v17 (copy), v1 (copy), v13 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_SelectInput_0 (copy), v3 (copy), v18 (copy), v19 (copy), l_Separator_0 (copy), l_SearchBar_0 (copy), l_ScrollingFrame_0 (copy), l_RadioButtonList_0 (copy), v14 (copy)
    local v25 = l_LayoutOrderIterator_0.new();
    local v26 = l_Localization_0.use();
    local v27 = v15.use();
    local v28 = v16(v27);
    local v29 = v17(v27);
    local v30 = {};
    for _, v32 in v29 do
        table.insert(v30, {
            Key = v32.Id, 
            Text = v32.Name
        });
    end;
    local function v37(v33, v34, v35, v36) --[[ Line: 60 ]]
        -- upvalues: v1 (ref), v13 (ref)
        return v1.createElement(v13, {
            FilterType = v33, 
            Item = v34, 
            LayoutOrder = v35, 
            Activated = v36
        });
    end;
    local v38 = {
        {
            Text = v26:getText("SearchOptions", "Cancel"), 
            OnClick = function() --[[ Line: 77 ]] --[[ Name: OnClick ]]
                -- upvalues: v27 (copy)
                v27:hideSearchOptions();
            end
        }, 
        {
            Text = v26:getText("SearchOptions", "Search"), 
            Tags = "PrimaryBrand", 
            OnClick = function() --[[ Line: 84 ]] --[[ Name: OnClick ]]
                -- upvalues: v27 (copy)
                v27:requestSearch();
            end
        }
    };
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v41 = {
        LayoutOrder = v24.LayoutOrder, 
        [v1.Tag] = "SearchOptions Explorer X-Column"
    };
    local v42 = {};
    local l_createElement_1 = v1.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v45 = {
        LayoutOrder = v25:getNextOrder(), 
        [v1.Tag] = "SearchOptionsContents X-Top X-Column"
    };
    local v46 = {
        FilterHeader = v1.createElement(l_TextLabel_0, {
            LayoutOrder = v25:getNextOrder(), 
            Text = v26:getText("SearchOptions", "Filters"), 
            [v1.Tag] = "SearchOptionHeading Left Bold X-Pad"
        })
    };
    local l_createElement_2 = v1.createElement;
    local l_l_Pane_0_2 = l_Pane_0;
    local v49 = {
        LayoutOrder = v25:getNextOrder(), 
        [v1.Tag] = "FilterSection X-FitY X-Middle"
    };
    local v50 = {};
    local l_createElement_3 = v1.createElement;
    local l_l_SelectInput_0_0 = l_SelectInput_0;
    local v53 = {
        PlaceholderText = v26:getText("Filters", "AssetTypes")
    };
    local l_AssetType_0 = v28.SearchOptions.AssetType;
    v53.SelectedIndex = v3.findIndex(v18.getEnumAsList(v18.AssetType), function(v55) --[[ Line: 40 ]]
        -- upvalues: l_AssetType_0 (copy)
        return v55 == l_AssetType_0;
    end);
    v53.Items = v18.getEnumAsList(v18.AssetType);
    v53.OnItemActivated = function(v56, _) --[[ Line: 111 ]] --[[ Name: OnItemActivated ]]
        -- upvalues: v27 (copy)
        v27:setAssetTypeFilter(v56);
    end;
    v53.OnRenderItem = function(v58, v59, v60) --[[ Line: 114 ]] --[[ Name: OnRenderItem ]]
        -- upvalues: v37 (copy), v18 (ref)
        return v37(v18.AssetInfoField.AssetType, v58, v59, v60);
    end;
    v53.Size = v19:GetAttribute("SearchFilterSize");
    v53[v1.Tag] = "";
    v50.AssetTypeDropdown = l_createElement_3(l_l_SelectInput_0_0, v53);
    v46.Filters = l_createElement_2(l_l_Pane_0_2, v49, v50);
    v46.Separator = v1.createElement(l_Separator_0, {
        LayoutOrder = v25:getNextOrder()
    });
    v46.SourceHeader = v1.createElement(l_TextLabel_0, {
        LayoutOrder = v25:getNextOrder(), 
        Text = v26:getText("SearchOptions", "Source"), 
        [v1.Tag] = "SearchOptionHeading Left Bold X-Pad"
    });
    v46.Sources = v1.createElement(l_Pane_0, {
        LayoutOrder = v25:getNextOrder(), 
        [v1.Tag] = "SourceSection X-ColumnM X-Center"
    }, {
        TextFilterInputContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = v24.LayoutOrder, 
            [v1.Tag] = "SearchPanel"
        }, {
            TextFilterInput = v1.createElement(l_SearchBar_0, {
                LayoutOrder = v25:getNextOrder(), 
                PlaceholderText = v26:getText("SearchOptions", "FilterPlaceholder"), 
                IncrementalTextSearch = true, 
                OnSearchRequested = function(v61) --[[ Line: 142 ]] --[[ Name: OnSearchRequested ]]
                    -- upvalues: v27 (copy)
                    v27:setSourceFilter(v61);
                end, 
                ShowSearchIcon = true, 
                ShowSearchButton = false, 
                [v1.Tag] = "X-AnchorCenter X-Pad"
            })
        }), 
        RadioButtonListContainer = v1.createElement(l_ScrollingFrame_0, {
            LayoutOrder = v25:getNextOrder(), 
            [v1.Tag] = "RadioList"
        }, {
            RadioButtonList = v1.createElement(l_RadioButtonList_0, {
                LayoutOrder = v25:getNextOrder(), 
                Buttons = v30, 
                SelectedKey = v28.SearchOptions.Source.Id, 
                OnClick = function(v62) --[[ Line: 159 ]] --[[ Name: OnClick ]]
                    -- upvalues: v27 (copy)
                    v27:setSource(v62);
                end, 
                FillDirection = Enum.FillDirection.Vertical, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    });
    v42.Contents = l_createElement_1(l_l_Pane_0_1, v45, v46);
    v42.Toolbar = v1.createElement(v14, {
        LayoutOrder = v25:getNextOrder(), 
        Buttons = v38
    });
    return l_createElement_0(l_l_Pane_0_0, v41, v42);
end;