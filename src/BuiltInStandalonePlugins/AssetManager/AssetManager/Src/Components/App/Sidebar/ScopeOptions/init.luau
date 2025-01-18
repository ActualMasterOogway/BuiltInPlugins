local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_List_0 = l_UI_0.List;
local l_Pane_0 = l_UI_0.Pane;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v9 = require(script.CheckboxRow);
local v10 = require(l_script_FirstAncestor_0.Src.Components.Shared.Toolbar);
local v11 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local _ = require(l_script_FirstAncestor_0.Src.Hooks.useExplorerInfo);
local v13 = require(l_script_FirstAncestor_0.Src.Hooks.useGroupOptions);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v16) --[[ Line: 34 ]] --[[ Name: ScopeOptions ]]
    -- upvalues: l_Localization_0 (copy), l_LayoutOrderIterator_0 (copy), v11 (copy), v13 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), v9 (copy), l_SearchBar_0 (copy), l_List_0 (copy), v10 (copy)
    local v17 = l_Localization_0:use();
    local v18 = l_LayoutOrderIterator_0.new();
    local v19 = v11.use();
    local v20 = v13(v19);
    local v21 = {
        {
            Text = v17:getText("Scopes", "CancelOptions"), 
            OnClick = function() --[[ Line: 43 ]] --[[ Name: OnClick ]]
                -- upvalues: v19 (copy)
                v19:closeScopeOptions(false);
            end
        }, 
        {
            Text = v17:getText("Scopes", "SaveOptions"), 
            Tags = "PrimaryBrand", 
            OnClick = function() --[[ Line: 50 ]] --[[ Name: OnClick ]]
                -- upvalues: v19 (copy)
                v19:closeScopeOptions(true);
            end
        }
    };
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v16.LayoutOrder, 
        [v1.Tag] = "ScopeOptions X-Fill"
    }, {
        Contents = v1.createElement(l_Pane_0, {
            LayoutOrder = v18:getNextOrder(), 
            [v1.Tag] = "X-Fill X-Column X-Top X-Left"
        }, {
            Header = v1.createElement(l_TextLabel_0, {
                LayoutOrder = v18:getNextOrder(), 
                Text = v17:getText("Scopes", "OptionsTitle"), 
                [v1.Tag] = "Header Semibold Wrap X-Fit"
            }), 
            Description = v1.createElement(l_TextLabel_0, {
                LayoutOrder = v18:getNextOrder(), 
                Text = v17:getText("Scopes", "OptionsDescription"), 
                [v1.Tag] = "Description Wrap X-FitY"
            }), 
            SelectAllCheckbox = v1.createElement(v9, {
                LayoutOrder = v18:getNextOrder(), 
                Text = "Select All", 
                Checked = v19:hasAllOptionsChecked(), 
                OnChecked = function() --[[ Line: 78 ]] --[[ Name: OnChecked ]]
                    -- upvalues: v19 (copy)
                    v19:toggleSelectAllOptions();
                end
            }), 
            ListContainer = v1.createElement(l_Pane_0, {
                LayoutOrder = v18:getNextOrder(), 
                [v1.Tag] = "X-Column X-PadS"
            }, {
                TextFilterInput = v1.createElement(l_SearchBar_0, {
                    LayoutOrder = v18:getNextOrder(), 
                    PlaceholderText = v17:getText("SearchOptions", "FilterPlaceholder"), 
                    IncrementalTextSearch = true, 
                    OnSearchRequested = function(v22) --[[ Line: 90 ]] --[[ Name: OnSearchRequested ]]
                        -- upvalues: v19 (copy)
                        v19:setFilter(v22);
                    end, 
                    ShowSearchIcon = true, 
                    ShowSearchButton = false
                }), 
                List = v1.createElement(l_List_0, {
                    LayoutOrder = v18:getNextOrder(), 
                    GetRowProps = function(v23, v24, v25) --[[ Line: 98 ]] --[[ Name: GetRowProps ]]
                        -- upvalues: v19 (copy)
                        return {
                            ScopeInfo = v23, 
                            Checked = v19:isGroupOptionChecked(v23.Id), 
                            LayoutOrder = v24, 
                            OnChecked = function() --[[ Line: 103 ]] --[[ Name: OnChecked ]]
                                -- upvalues: v19 (ref), v23 (copy)
                                v19:toggleGroupOption(v23.Id);
                            end, 
                            Position = v25
                        };
                    end, 
                    Rows = v20, 
                    RowComponent = v9, 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                })
            })
        }), 
        Toolbar = v1.createElement(v10, {
            LayoutOrder = v18:getNextOrder(), 
            Buttons = v21
        })
    });
end;