local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.React);
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v5.ContextServices;
local v7 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.UserAndGroupFilter);
local v8 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.SearchOptionsEntry);
local v9 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.SearchOptionsLayout);
local v10 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.VerfifiedCreatorCheckbox);
local l_Checkbox_0 = v5.UI.Checkbox;
local l_HoverArea_0 = v5.UI.HoverArea;
local l_RadioButtonList_0 = v5.UI.RadioButtonList;
local l_Pane_0 = v5.UI.Pane;
local _ = require(l_script_FirstAncestor_0.Core.Reducers.PageInfo);
local _ = require(l_script_FirstAncestor_0.Core.Reducers.LiveSearch);
local v17 = require(l_script_FirstAncestor_0.Core.Util.getUserId);
local v18 = require(l_script_FirstAncestor_0.Core.Util.getUsername);
local l_LayoutOrderIterator_0 = v5.Util.LayoutOrderIterator;
local l_showRobloxCreatedAssets_0 = require(l_script_FirstAncestor_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v21 = require(l_script_FirstAncestor_0.Core.Types.BackendTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.CreatorTypes);
local v23 = require(l_script_FirstAncestor_0.Core.Hooks.useSelector);
local l_useCallback_0 = v3.useCallback;
local l_useMemo_0 = v3.useMemo;
local l_useState_0 = v3.useState;
local v27 = {
    IncludeUnverifiedCreators = "includeUnverifiedCreators", 
    MyAssets = "myAssets", 
    MyCreations = "myCreations"
};
return function(v28) --[[ Line: 71 ]] --[[ Name: InventorySearchOptions ]]
    -- upvalues: l_ContextServices_0 (copy), v23 (copy), v2 (copy), l_useMemo_0 (copy), v17 (copy), v18 (copy), l_useState_0 (copy), v21 (copy), l_showRobloxCreatedAssets_0 (copy), l_useCallback_0 (copy), v27 (copy), l_LayoutOrderIterator_0 (copy), v4 (copy), v9 (copy), v8 (copy), v10 (copy), l_Pane_0 (copy), l_Checkbox_0 (copy), l_HoverArea_0 (copy), v7 (copy), l_RadioButtonList_0 (copy)
    local v29 = l_ContextServices_0.Localization:use();
    local v31 = v23(function(v30) --[[ Line: 74 ]]
        -- upvalues: v2 (ref)
        return v2.Dictionary.join(v30.pageInfo);
    end);
    local v33 = v23(function(v32) --[[ Line: 78 ]]
        return v32.liveSearch;
    end);
    local v34 = l_useMemo_0(function() --[[ Line: 82 ]]
        -- upvalues: v17 (ref), v18 (ref)
        return {
            Id = v17(), 
            Name = v18(), 
            Type = Enum.CreatorType.User
        };
    end, {});
    local v35, v36 = l_useState_0(nil);
    local v37, v38 = l_useState_0(function() --[[ Line: 93 ]]
        -- upvalues: v31 (copy)
        if v31.creatorTargetIds then
            return v31.creatorTargetIds;
        else
            return {};
        end;
    end);
    local v39, v40 = l_useState_0(function() --[[ Line: 96 ]]
        -- upvalues: v31 (copy)
        if v31.groupTargetIds then
            return v31.groupTargetIds;
        else
            return {};
        end;
    end);
    local v41, v42 = l_useState_0(function() --[[ Line: 99 ]]
        -- upvalues: v31 (copy), v21 (ref)
        if v31.uiSortIntent then
            return v31.uiSortIntent;
        else
            return v21.UiSortIntent.Default;
        end;
    end);
    local v44, v45 = l_useState_0(function() --[[ Line: 102 ]]
        -- upvalues: v37 (copy), v34 (copy), v31 (copy)
        local v43 = v37[tostring(v34.Id)] ~= nil;
        return {
            includeUnverifiedCreators = v31.includeUnverifiedCreators, 
            myCreations = v43, 
            myAssets = v31.excludeGroupCreations
        };
    end);
    local v46 = l_useMemo_0(function() --[[ Line: 112 ]]
        -- upvalues: v2 (ref), v37 (copy), v34 (copy)
        return v2.Dictionary.join(v37, {
            [tostring(v34.Id)] = v2.None
        });
    end, {
        v37
    });
    local v47 = l_useMemo_0(function() --[[ Line: 118 ]]
        -- upvalues: l_showRobloxCreatedAssets_0 (ref)
        return not l_showRobloxCreatedAssets_0();
    end, {});
    local v48 = l_useMemo_0(function() --[[ Line: 122 ]]
        -- upvalues: v21 (ref), v29 (copy)
        return {
            {
                Key = v21.UiSortIntent.Relevance, 
                Text = v29:getText("SearchOptionsSort", "Relevance")
            }, 
            {
                Key = v21.UiSortIntent.Name, 
                Text = v29:getText("SearchOptionsSort", "Name")
            }, 
            {
                Key = v21.UiSortIntent.DateModified, 
                Text = v29:getText("SearchOptionsSort", "DateModified")
            }, 
            {
                Key = v21.UiSortIntent.DateCreated, 
                Text = v29:getText("SearchOptionsSort", "DateCreated")
            }, 
            {
                Key = v21.UiSortIntent.Creator, 
                Text = v29:getText("SearchOptionsSort", "Creator")
            }
        };
    end, {
        v29
    });
    local v49 = l_useCallback_0(function() --[[ Line: 147 ]]
        -- upvalues: v36 (copy), v38 (copy), v40 (copy), v42 (copy), v21 (ref), v45 (copy)
        v36(nil);
        v38({});
        v40({});
        v42(v21.UiSortIntent.Default);
        v45({
            includeUnverifiedCreators = false, 
            myCreations = false, 
            myAssets = false
        });
    end, {
        v31
    });
    local v53 = l_useCallback_0(function(v50) --[[ Line: 159 ]]
        -- upvalues: v2 (ref), v38 (copy), v40 (copy)
        local function v52(v51) --[[ Line: 160 ]] --[[ Name: callback ]]
            -- upvalues: v2 (ref), v50 (copy)
            return v2.Dictionary.join(v51, {
                [tostring(v50.Id)] = v50
            });
        end;
        if v50.Type == Enum.CreatorType.User then
            v38(v52);
            return;
        else
            v40(v52);
            return;
        end;
    end, {});
    local v57 = l_useCallback_0(function(v54) --[[ Line: 173 ]]
        -- upvalues: v2 (ref), v38 (copy), v40 (copy)
        local function v56(v55) --[[ Line: 174 ]] --[[ Name: callback ]]
            -- upvalues: v2 (ref), v54 (copy)
            return v2.Dictionary.join(v55, {
                [tostring(v54.Id)] = v2.None
            });
        end;
        if v54.Type == Enum.CreatorType.User then
            v38(v56);
            return;
        else
            v40(v56);
            return;
        end;
    end, {});
    local v61 = l_useCallback_0(function(v58) --[[ Line: 187 ]]
        -- upvalues: v45 (copy), v2 (ref)
        local v59 = nil;
        v45(function(v60) --[[ Line: 190 ]]
            -- upvalues: v59 (ref), v58 (copy), v2 (ref)
            v59 = not v60[v58];
            return v2.Dictionary.join(v60, {
                [v58] = v59
            });
        end);
        return v59;
    end, {});
    local v62 = l_useCallback_0(function() --[[ Line: 201 ]]
        -- upvalues: v61 (copy), v27 (ref)
        v61(v27.IncludeUnverifiedCreators);
    end, {});
    local v63 = l_useCallback_0(function() --[[ Line: 205 ]]
        -- upvalues: v61 (copy), v27 (ref), v53 (copy), v34 (copy), v57 (copy)
        if v61(v27.MyCreations) then
            v53(v34);
            return;
        else
            v57(v34);
            return;
        end;
    end, {
        v44.myCreations, 
        v34
    });
    local v65 = l_useCallback_0(function(v64) --[[ Line: 215 ]]
        -- upvalues: v53 (copy), v36 (copy)
        v53(v64);
        v36(nil);
    end, {});
    local v67 = l_useCallback_0(function(v66) --[[ Line: 220 ]]
        -- upvalues: v36 (copy)
        v36(v66);
    end, {});
    local v70 = l_useCallback_0(function(_, v69) --[[ Line: 224 ]]
        -- upvalues: v57 (copy)
        v57(v69);
    end, {});
    local v71 = l_useCallback_0(function() --[[ Line: 229 ]]
        -- upvalues: v44 (copy), v35 (copy), v37 (copy), v39 (copy), v41 (copy)
        return {
            Creator = if not v44.myCreations then v35 else nil, 
            creatorTargetIds = v37, 
            excludeGroupCreations = v44.myAssets, 
            groupTargetIds = v39, 
            includeUnverifiedCreators = v44.includeUnverifiedCreators, 
            uiSortIntent = v41
        };
    end, {
        v35, 
        v37, 
        v44, 
        v39, 
        v41
    });
    local v72 = l_LayoutOrderIterator_0.new();
    return v4.createElement(v9, {
        GetSearchOptions = v71, 
        OnClose = v28.OnClose, 
        OnReset = v49
    }, {
        CreatorAndGroup = if v47 then v4.createElement(v8, {
            Header = v29:getText("General", "SearchOptionCreatorAndGroups"), 
            LayoutOrder = v72:getNextOrder()
        }, {
            VerfifiedCreatorCheckbox = v4.createElement(v10, {
                LayoutOrder = v72:getNextOrder(), 
                IsChecked = v44.includeUnverifiedCreators, 
                OnClick = v62
            }), 
            CreatorGroupFilterContainer = v4.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v72:getNextOrder(), 
                Spacing = 6
            }, {
                MyCreationsCheckbox = v4.createElement(l_Checkbox_0, {
                    Checked = v44.myCreations, 
                    Key = v27.MyCreations, 
                    LayoutOrder = v72:getNextOrder(), 
                    OnClick = v63, 
                    Text = v29:getText("General", "MyCreations")
                }, {
                    HoverArea = v4.createElement(l_HoverArea_0, {
                        Cursor = "PointingHand"
                    })
                }), 
                MyAssetsCheckbox = v4.createElement(l_Checkbox_0, {
                    Checked = v44.myAssets, 
                    Key = v27.MyAssets, 
                    LayoutOrder = v72:getNextOrder(), 
                    OnClick = v61, 
                    Text = v29:getText("General", "MyAssets")
                }, {
                    HoverArea = v4.createElement(l_HoverArea_0, {
                        Cursor = "PointingHand"
                    })
                }), 
                SearchBar = v4.createElement(v7, {
                    LayoutOrder = v72:getNextOrder(), 
                    OnDeleteCreatorPill = v70, 
                    OnSearchUpdate = v67, 
                    OnSelectCreator = v65, 
                    CreatorResults = v33.results, 
                    SearchTerm = v35, 
                    SelectedUsers = v46, 
                    SelectedGroups = v39
                })
            })
        }) else nil, 
        SortBy = v4.createElement(v8, {
            Header = v29:getText("General", "SearchOptionSort"), 
            HideLowerSeparator = true, 
            LayoutOrder = v72:getNextOrder()
        }, {
            RadioButtons = v4.createElement(l_RadioButtonList_0, {
                Buttons = v48, 
                CurrentSelectedKey = v41, 
                OnClick = v42, 
                SelectedKey = v31.uiSortIntent
            })
        })
    });
end;