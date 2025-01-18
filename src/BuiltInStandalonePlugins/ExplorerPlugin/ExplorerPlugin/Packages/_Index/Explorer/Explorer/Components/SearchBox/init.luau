local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Components.SearchBox.FocusTracker);
local v3 = require(l_script_FirstAncestor_0.Components.SearchBox.HistoryDropdown);
local v4 = require(l_script_FirstAncestor_0.Util.ImageUrl);
local v5 = require(l_script_FirstAncestor_0.Util.Observable);
local v6 = require(l_script_FirstAncestor_0.Parent.React);
local v7 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v9 = require(l_script_FirstAncestor_0.Components.SearchBox.SearchBar);
local v10 = require(l_script_FirstAncestor_0.Components.SearchBox.SearchBrowser);
local v11 = require(l_script_FirstAncestor_0.Components.SearchBox.SettingsDropdown);
local v12 = require(l_script_FirstAncestor_0.Components.SearchBox.SuggestionsDropdown);
local v13 = require(l_script_FirstAncestor_0.Components.SearchBox.SyntaxDropdown);
local v14 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local v15 = require(l_script_FirstAncestor_0.Util.isRefClicked);
local l_useToggleState_0 = v7.useToggleState;
local l_createElement_0 = v6.createElement;
return function(v18) --[[ Line: 25 ]] --[[ Name: SearchBox ]]
    -- upvalues: l_useToggleState_0 (copy), v6 (copy), v15 (copy), v5 (copy), v14 (copy), l_createElement_0 (copy), v1 (copy), v9 (copy), v4 (copy), v2 (copy), v10 (copy), v3 (copy), v12 (copy), v13 (copy), v11 (copy)
    local v19 = l_useToggleState_0();
    local v20, v21 = v6.useState(nil);
    local v22, v23 = v6.useBinding(false);
    local v24, v25 = v6.useState({});
    local v26, v27 = v6.useState(Vector2.new(0, 0));
    local v28, v29 = v6.useState({});
    local v30 = v6.useRef(nil);
    local v31 = v6.useRef(nil);
    local v32 = v6.useRef(nil);
    local v33 = v6.useRef(nil);
    local v35 = v6.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v30 (copy), v21 (copy)
        local l_current_0 = v30.current;
        if l_current_0 and l_current_0.Text == "" then
            v21("Syntax");
        end;
    end, {
        v30
    });
    local v40 = v6.useCallback(function(_, _, v38, v39) --[[ Line: 56 ]]
        -- upvalues: v15 (ref), v32 (copy), v33 (copy), v31 (copy), v21 (copy)
        if v15(v32, v38) or v15(v33, v38) then
            return;
        elseif v15(v31, v38) then
            v39();
            return;
        else
            v21(nil);
            return;
        end;
    end, {
        v15, 
        v31, 
        v32, 
        v33
    });
    local v43 = v6.useCallback(function(v41) --[[ Line: 72 ]]
        -- upvalues: v30 (copy), v26 (copy), v23 (copy), v20 (copy), v21 (copy)
        if v30.current then
            local v42 = v30.current.Text:sub(1, v26.X) .. v41;
            v30.current.Text = v42;
            v30.current.CursorPosition = #v42 + 1;
        end;
        v23(v20 == "Suggestions");
        if v20 ~= "Syntax" then
            v21(nil);
        end;
    end, {
        v30, 
        v26, 
        v20
    });
    local v47 = v6.useCallback(function(v44, v45, v46) --[[ Line: 87 ]]
        -- upvalues: v25 (copy), v21 (copy), v27 (copy), v19 (copy)
        if not v44:IsFocused() then
            return;
        else
            if #v46 > 0 then
                v25(v46);
                v21("Suggestions");
            else
                v21(nil);
            end;
            v27(v45);
            if v44.Text == "" then
                v19.disable();
                return;
            else
                v19.enable();
                return;
            end;
        end;
    end, {});
    local v49 = v6.useCallback(function(v48) --[[ Line: 110 ]]
        -- upvalues: v20 (copy), v21 (copy), v29 (copy)
        if v20 == "History" then
            v21(nil);
            return;
        else
            v29(v48);
            v21("History");
            return;
        end;
    end, {
        v20
    });
    local v50 = v6.useCallback(function() --[[ Line: 119 ]]
        -- upvalues: v20 (copy), v21 (copy)
        if v20 == "Settings" then
            v21(nil);
            return;
        else
            v21("Settings");
            return;
        end;
    end, {
        v20
    });
    v5.useEffect(v18.session.searchSuggestionsObservable, function(v51) --[[ Line: 127 ]]
        -- upvalues: v22 (copy), v25 (copy), v21 (copy), v23 (copy)
        if #v51 > 0 and not v22:getValue() then
            v25(v51);
            v21("Suggestions");
        end;
        v23(false);
    end, {});
    local v52 = v14();
    local l_l_createElement_0_0 = l_createElement_0;
    local v54 = "Frame";
    local v55 = {
        ZIndex = v18.zIndex, 
        [v6.Tag] = "Explorer-SearchBox"
    };
    local v56 = {
        SearchHeader = l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            ref = v18.headerRef, 
            [v6.Change.AbsoluteSize] = v18.onSearchHeaderSizeChange, 
            [v6.Tag] = "X-Column X-Center X-FitY"
        }, {
            Spacing = l_createElement_0("UIListLayout", {
                Padding = UDim.new(0, v1.searchBarPadding)
            }), 
            Padding = l_createElement_0("UIPadding", {
                PaddingLeft = UDim.new(0, v1.searchBarPadding), 
                PaddingRight = UDim.new(0, v1.searchBarPadding), 
                PaddingTop = UDim.new(0, v1.searchBarPadding)
            }), 
            SearchBarRow = l_createElement_0("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v52(), 
                Size = UDim2.new(1, 0, 0, v1.searchBarHeight), 
                [v6.Tag] = "X-RowS X-Middle"
            }, {
                SearchBar = l_createElement_0(v9, {
                    layoutOrder = v52(), 
                    onFocused = v35, 
                    onFocusLost = v40, 
                    onTextBoxChanged = v47, 
                    onSearchHistoryButtonClicked = v49, 
                    searchBarRef = v32, 
                    session = v18.session, 
                    textBoxRef = v30
                }), 
                SettingsButton = l_createElement_0("ImageButton", {
                    LayoutOrder = v52(), 
                    Size = UDim2.fromOffset(v1.searchBarHeight, v1.searchBarHeight), 
                    ref = v33, 
                    [v6.Event.MouseButton1Down] = v50, 
                    [v6.Tag] = "Explorer-BG-Input Explorer-SearchBox-Corner data-testid=SearchBox-SettingsButton"
                }, {
                    Icon = l_createElement_0("ImageLabel", {
                        Image = v4.standard("threeDots"), 
                        [v6.Tag] = "X-AnchorCenter Explorer-Icon Explorer-Content-Standard"
                    }), 
                    FocusTracker = l_createElement_0(v2, {
                        onFocusLost = v40
                    })
                })
            }), 
            SearchBrowser = v19.enabled and l_createElement_0(v10, {
                layoutOrder = v52(), 
                session = v18.session
            }), 
            BottomBorder = l_createElement_0("Frame", {
                LayoutOrder = v52(), 
                [v6.Tag] = "Explorer-BG-Input Explorer-SearchBox-BottomBorder"
            })
        })
    };
    local v57 = false;
    if v20 ~= nil then
        v57 = l_createElement_0;
        local v58 = "ImageButton";
        local v59 = {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, v1.minSearchHeaderHeight), 
            Size = UDim2.new(1, 0, 0, v18.windowHeight)
        };
        local v60 = {};
        local v61 = false;
        if v20 == "History" then
            v61 = l_createElement_0(v3, {
                dropdownRef = v31, 
                onItemClicked = v43, 
                searchHistory = v28
            });
        end;
        v60.HistoryDropdown = v61;
        v61 = false;
        if v20 == "Suggestions" then
            v61 = l_createElement_0(v12, {
                dropdownRef = v31, 
                onItemClicked = v43, 
                suggestions = v24
            });
        end;
        v60.SuggestionsDropdown = v61;
        v61 = false;
        if v20 == "Syntax" then
            v61 = l_createElement_0(v13, {
                dropdownRef = v31, 
                onItemClicked = v43
            });
        end;
        v60.SyntaxDropdown = v61;
        v61 = false;
        if v20 == "Settings" then
            v61 = l_createElement_0(v11, {
                dropdownRef = v31
            });
        end;
        v60.SettingsDropdown = v61;
        v57 = v57(v58, v59, v60);
    end;
    v56.ClickYoinker = v57;
    return l_l_createElement_0_0(v54, v55, v56);
end;