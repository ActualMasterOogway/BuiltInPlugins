local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)();
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v3 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAtomicTestsFixes)();
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v4.useState;
local l_useRef_0 = v4.useRef;
local l_useEffect_0 = v4.useEffect;
local l_useContext_0 = v4.useContext;
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local v10 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_counter_0 = v10.Util.counter;
local l_Localization_0 = v10.ContextServices.Localization;
local l_UI_0 = v10.UI;
local l_Grid_0 = l_UI_0.Grid;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local v18 = require(l_script_FirstAncestor_0.Src.Components.CursorScope);
local v19 = require(l_script_FirstAncestor_0.Src.Components.SearchResultRow);
local v20 = require(l_script_FirstAncestor_0.Src.Components.Pill);
local v21 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local v22 = require(l_script_FirstAncestor_0.Src.Util.Dialogs);
local v23 = require(l_script_FirstAncestor_0.Src.Util.Services);
local l_StartPageManager_0 = v23.StartPageManager;
local l_StudioService_0 = v23.StudioService;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v27 = if v1 then require(l_script_FirstAncestor_0.Src.Network.DiscoverCreatorEligibilityAndOpenPlace) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverCreatorEligibilityAndOpenPlace);
local function v31(v28) --[[ Line: 82 ]] --[[ Name: CellComponent ]]
    -- upvalues: l_useContext_0 (copy), v22 (copy), v4 (copy), v19 (copy), l_join_0 (copy), v27 (copy), l_StudioService_0 (copy), l_StartPageManager_0 (copy)
    local v29 = l_useContext_0(v22);
    return v4.createElement(v19, (l_join_0(v28, {
        OnClick = function(v30) --[[ Line: 88 ]] --[[ Name: OnClick ]]
            -- upvalues: v27 (ref), l_StudioService_0 (ref), v29 (copy), l_StartPageManager_0 (ref)
            assert(not v30.IsPlaceholder, "Cell cannot be a placeholder here");
            if v30.Id and v30.RootPlaceId then
                v27(l_StudioService_0:GetUserId(), v30.Id, v30.RootPlaceId, v29.showVerifyAge, v29.showAgeRestricted);
                return;
            else
                if v30.FilePath then
                    l_StartPageManager_0:openLocalFile(v30.FilePath, false);
                end;
                return;
            end;
        end
    })));
end;
local function v35(v32) --[[ Line: 111 ]] --[[ Name: SearchBarCancelButton ]]
    -- upvalues: v21 (copy), v4 (copy)
    local v33, v34 = v21("PointingHand");
    return v4.createElement("ImageButton", {
        Size = UDim2.new(0, 25, 0, 30), 
        LayoutOrder = v32.LayoutOrder, 
        [v4.Event.Activated] = v32.OnActivated, 
        [v4.Event.MouseEnter] = v33, 
        [v4.Event.MouseLeave] = v34, 
        [v4.Tag] = "X-Transparent X-Middle X-Center"
    }, {
        v4.createElement("ImageLabel", {
            [v4.Tag] = "X-Transparent StartPage-CancelIcon"
        })
    });
end;
local function v41(v36) --[[ Line: 152 ]] --[[ Name: SearchBar ]]
    -- upvalues: l_Localization_0 (copy), l_counter_0 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), v4 (copy), l_Image_0 (copy), v20 (copy), v35 (copy)
    local v37 = l_Localization_0:use();
    local v38 = l_counter_0();
    local v39 = l_useRef_0(nil);
    l_useEffect_0(function() --[[ Line: 162 ]]
        -- upvalues: v39 (copy), v36 (copy)
        if not v39.current then
            return;
        else
            if v39.current.CaptureFocus then
                if v36.IsFocused then
                    v39.current:CaptureFocus();
                    return;
                else
                    v39.current:ReleaseFocus();
                end;
            end;
            return;
        end;
    end, {});
    return v4.createElement("Frame", {
        Position = v36.Position, 
        Size = v36.Size, 
        [v4.Tag] = "X-Transparent"
    }, {
        v4.createElement("Frame", {
            Position = UDim2.new(0, 30, 0, 0), 
            [v4.Tag] = "X-Transparent X-Fill X-Middle X-Row"
        }, {
            MagnifyingGlass = v4.createElement(l_Image_0, {
                LayoutOrder = v38(), 
                [v4.Tag] = "StartPage-SearchIcon"
            }), 
            EmptySpace = v4.createElement("Frame", {
                Size = UDim2.new(0, 12, 0, 1), 
                LayoutOrder = v38(), 
                [v4.Tag] = "X-Transparent"
            }), 
            TextInputArea = v4.createElement("TextBox", {
                Text = v36.Text, 
                PlaceholderText = v37:getText("Plugin", "SearchType", {
                    type = v36.Type
                }), 
                ClearTextOnFocus = true, 
                Size = UDim2.new(1, -200, 0, 30), 
                ref = v39, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                [v4.Event.Focused] = function() --[[ Line: 208 ]]
                    -- upvalues: v36 (copy)
                    if v36.OnFocused then
                        v36.OnFocused();
                    end;
                end, 
                [v4.Event.FocusLost] = function() --[[ Line: 213 ]]
                    -- upvalues: v36 (copy)
                    if v36.OnFocusLost then
                        v36.OnFocusLost();
                    end;
                end, 
                [v4.Change.Text] = function(v40) --[[ Line: 218 ]]
                    -- upvalues: v36 (copy)
                    if v36.OnTextChanged then
                        v36.OnTextChanged(v40.Text);
                    end;
                end, 
                LayoutOrder = v38(), 
                [v4.Tag] = "StartPage-SearchBar StartPage-TextSize StartPage-DisabledTextColor"
            })
        }), 
        v4.createElement("Frame", {
            [v4.Tag] = "X-Fill X-Right X-Middle X-Transparent"
        }, {
            v4.createElement("Frame", {
                [v4.Tag] = "X-Fit X-RowM X-Pad X-Middle X-Transparent"
            }, {
                Pill = v4.createElement(v20, {
                    LayoutOrder = v38(), 
                    Text = v37:getText("Plugin", "TypePill", {
                        type = v36.Type
                    })
                }), 
                CancelButton = if v36.Text ~= "" and v36.ShouldShowCancel then v4.createElement(v35, {
                    LayoutOrder = v38(), 
                    OnActivated = v36.OnCancelled
                }) else nil
            })
        })
    });
end;
local function v55(v42) --[[ Line: 275 ]] --[[ Name: DropdownMenu ]]
    -- upvalues: l_Localization_0 (copy), l_counter_0 (copy), l_useState_0 (copy), v1 (copy), v21 (copy), v4 (copy), v2 (copy), l_Grid_0 (copy), v31 (copy), l_join_0 (copy)
    local v43 = l_Localization_0:use();
    local v44 = l_counter_0();
    local v45, v46 = l_useState_0(v1 and 0 or 6);
    local v47 = nil;
    local v48 = nil;
    if not v1 then
        local v49, v50 = l_useState_0(nil);
        v47 = v49;
        v48 = v50;
    end;
    local v51, v52 = v21("PointingHand");
    return v4.createElement("Frame", {
        Size = v42.Size, 
        Position = v42.Position, 
        [v4.Tag] = "X-Transparent"
    }, {
        v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, not v1 and v47 ~= v42.Query and 700 or 160 + 90 * v45), 
            [v4.Tag] = "StartPage-RoundedCorner16 StartPage-PageBackground"
        }, {
            v4.createElement("Frame", {
                Position = UDim2.new(0, 20, 0, 80), 
                Size = UDim2.new(1, -45, 1, 0), 
                [v4.Tag] = "X-ColumnS X-Transparent"
            }, {
                SearchResultTitle = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 28), 
                    LayoutOrder = v44(), 
                    [v4.Tag] = "X-Middle X-Corner StartPage-Highlight"
                }, {
                    v4.createElement("TextLabel", {
                        Text = v43:getText("Plugin", "QuerySearch", {
                            query = v42.Query
                        }), 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        [v4.Tag] = "X-Fit X-Pad StartPage-Font StartPage-TextSize X-Transparent StartPage-TextColor"
                    })
                }), 
                ResultPreview = if not (v45 == 0) or v47 ~= v42.Query then v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, not v1 and v47 ~= v42.Query and 540 or 90 * v45), 
                    Visible = if v1 then v45 > 0 else nil, 
                    LayoutOrder = v44(), 
                    [v4.Tag] = "X-Transparent"
                }, {
                    v4.createElement(v42.ResultComponent, {
                        Size = if v2 then nil else UDim2.new(1, 0, 1, 0), 
                        DisplayComponent = l_Grid_0, 
                        HasParentLoaded = if v2 then nil else not v42.AreSearchResultsLoading, 
                        MaxCount = 6, 
                        Dropdowns = v42.Dropdowns, 
                        OnItemCountUpdated = v1 and function(v53) --[[ Line: 347 ]]
                            -- upvalues: v46 (copy)
                            v46((math.min(v53, 6)));
                        end or nil, 
                        InitialContentHasLoaded = if v1 then nil else function(v54) --[[ Line: 354 ]]
                            -- upvalues: v46 (copy), v48 (ref), v42 (copy)
                            v46(v54 or 6);
                            v48(v42.Query);
                            v42.InitialContentHasLoaded(true);
                        end, 
                        CellComponent = v31, 
                        CellSize = UDim2.new(1, 0, 0, 90), 
                        CellPadding = UDim2.new(0, 0, 0, 0), 
                        BaseQuery = l_join_0(v42.BaseQuery, {
                            search = v42.Query
                        })
                    })
                }) else nil, 
                SeeMoreLink = v4.createElement("TextButton", {
                    LayoutOrder = v44(), 
                    Text = v43:getText("Plugin", "SeeAllMatchingExperiences"), 
                    [v4.Event.Activated] = v42.MoreExperiencesRequested, 
                    [v4.Event.MouseEnter] = v51, 
                    [v4.Event.MouseLeave] = v52, 
                    [v4.Tag] = "X-Fit X-Pad X-Transparent StartPage-Font StartPage-LinkTextColor StartPage-TextSize"
                })
            })
        })
    });
end;
return function(v56) --[[ Line: 396 ]] --[[ Name: SearchBarWithPills ]]
    -- upvalues: l_useState_0 (copy), v4 (copy), v41 (copy), v18 (copy), l_CaptureFocus_0 (copy), v3 (copy), l_Pane_0 (copy), v55 (copy)
    local v57, v58 = l_useState_0(false);
    local v59, v60 = l_useState_0(false);
    local v61, v62 = l_useState_0("");
    local v63, v64 = l_useState_0(nil);
    local v65, v66 = l_useState_0(nil);
    return v4.createElement("Frame", {
        Size = v56.Size, 
        Position = v56.Position, 
        [v4.Change.AbsoluteSize] = function(v67) --[[ Line: 417 ]]
            -- upvalues: v64 (copy)
            v64(v67.AbsoluteSize);
        end, 
        [v4.Change.AbsolutePosition] = function(v68) --[[ Line: 420 ]]
            -- upvalues: v66 (copy)
            v66(v68.AbsolutePosition);
        end, 
        [v4.Tag] = "X-Transparent"
    }, {
        UnfocusedSearchBar = if not v57 then v4.createElement("Frame", {
            [v4.Tag] = "X-Fill StartPage-Border StartPage-PageBackground StartPage-RoundedCorner16"
        }, {
            v4.createElement(v41, {
                Size = UDim2.new(1, 0, 1, 0), 
                OnFocused = function() --[[ Line: 432 ]] --[[ Name: OnFocused ]]
                    -- upvalues: v62 (copy), v58 (copy)
                    v62("");
                    v58(true);
                end, 
                OnCancelled = function() --[[ Line: 436 ]] --[[ Name: OnCancelled ]]
                    -- upvalues: v58 (copy), v61 (copy), v62 (copy), v56 (copy)
                    v58(false);
                    if v61 ~= "" then
                        v62("");
                        v56.OnSearchRequested("");
                    end;
                end, 
                IsFocused = false, 
                Text = v61, 
                Type = v56.Type, 
                ShouldShowCancel = true
            })
        }) else nil, 
        FocusedContent = if v57 and v63 then v4.createElement(v18, nil, {
            v4.createElement(l_CaptureFocus_0, {
                OnFocusLost = v3 and function() --[[ Line: 460 ]]

                end or nil, 
                Priority = 999999, 
                [v4.Tag] = "X-Fill X-Transparent"
            }, {
                DarkShadow = if v61 and #v61 >= 0 then v4.createElement(l_Pane_0, {
                    BackgroundTransparency = 0.4, 
                    OnClick = function() --[[ Line: 468 ]] --[[ Name: OnClick ]]
                        -- upvalues: v58 (copy), v62 (copy), v56 (copy)
                        v58(false);
                        v62("");
                        v56.OnSearchRequested("");
                    end, 
                    [v4.Tag] = "X-Fill StartPage-StandardDarkBackground"
                }) else nil, 
                Dropdown = if v61 and #v61 >= 3 then v4.createElement(v55, {
                    Size = UDim2.new(0, v63.X + 40, 0, 700), 
                    Position = if v65 then UDim2.new(0, v65.X - 20, 0, v65.Y - 20) else UDim2.fromScale(0, 0), 
                    Query = v61, 
                    BaseQuery = v56.BaseQuery, 
                    ResultComponent = v56.ResultComponent, 
                    AreSearchResultsLoading = v59, 
                    Dropdowns = {}, 
                    InitialContentHasLoaded = function(v69) --[[ Line: 494 ]] --[[ Name: InitialContentHasLoaded ]]
                        -- upvalues: v60 (copy)
                        v60(not v69);
                    end, 
                    MoreExperiencesRequested = function() --[[ Line: 497 ]] --[[ Name: MoreExperiencesRequested ]]
                        -- upvalues: v56 (copy), v61 (copy), v62 (copy), v58 (copy)
                        v56.OnSearchRequested(v61);
                        v62(v61);
                        v58(false);
                    end
                }) else nil, 
                FocusedSearchBar = v4.createElement("Frame", {
                    Size = UDim2.new(0, v63.X, 0, v63.Y), 
                    Position = if v65 then UDim2.new(0, v65.X, 0, v65.Y) else UDim2.fromScale(0, 0), 
                    ZIndex = 999999, 
                    [v4.Tag] = "StartPage-Border StartPage-PageBackground StartPage-RoundedCorner16"
                }, {
                    v4.createElement(v41, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        OnFocused = function() --[[ Line: 516 ]] --[[ Name: OnFocused ]]
                            -- upvalues: v62 (copy), v60 (copy)
                            v62("");
                            v60(true);
                        end, 
                        OnFocusLost = function() --[[ Line: 520 ]] --[[ Name: OnFocusLost ]]
                            -- upvalues: v60 (copy)
                            v60(false);
                        end, 
                        OnTextChanged = function(v70) --[[ Line: 523 ]] --[[ Name: OnTextChanged ]]
                            -- upvalues: v57 (copy), v62 (copy), v60 (copy)
                            if v57 then
                                v62(v70);
                                v60(true);
                            end;
                        end, 
                        OnCancelled = function() --[[ Line: 531 ]] --[[ Name: OnCancelled ]]
                            -- upvalues: v57 (copy), v58 (copy), v62 (copy)
                            if v57 then
                                v58(false);
                                v62("");
                            end;
                        end, 
                        IsFocused = true, 
                        Text = v61, 
                        Type = v56.Type
                    })
                })
            })
        }) else nil
    });
end;