local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.Framework);
local v2 = require(l_script_FirstAncestor_0.Util.ImageUrl);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(l_script_FirstAncestor_0.Components.Contexts.SettingsContext);
local v6 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local v7 = require(l_script_FirstAncestor_0.Util.isRefClicked);
local l_createElement_0 = v3.createElement;
local l_ExplorerFilter_0 = Instance.new("ExplorerFilter");
l_ExplorerFilter_0.Parent = game;
return function(v10) --[[ Line: 21 ]] --[[ Name: SearchBar ]]
    -- upvalues: v1 (copy), v3 (copy), v5 (copy), v7 (copy), l_ExplorerFilter_0 (copy), v6 (copy), l_createElement_0 (copy), v2 (copy)
    local v11 = v1.ContextServices.Localization:use();
    local v12 = v3.useContext(v5.Context);
    local v13, v14 = v3.useState(false);
    local v15, v16 = v3.useBinding(false);
    local v18 = v3.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v10 (copy), v14 (copy)
        local l_current_0 = v10.textBoxRef.current;
        assert(l_current_0 ~= nil, "Expected textBox to exist");
        l_current_0:CaptureFocus();
        v14(true);
    end, {
        v10.textBoxRef
    });
    local v19 = v3.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v13 (copy), v14 (copy), v10 (copy)
        if v13 then
            return;
        else
            v14(true);
            v10.onFocused();
            return;
        end;
    end, {
        v13, 
        v10.onFocused
    });
    local v24 = v3.useCallback(function(v20, v21) --[[ Line: 54 ]]
        -- upvalues: v12 (copy)
        v21 = v21:sub(1, 32767);
        local v22 = v12.getSearchHistory(v20);
        local v23 = table.find(v22, v21);
        if v23 ~= nil then
            table.remove(v22, v23);
        end;
        table.insert(v22, 1, v21);
        if #v22 > 10 then
            table.remove(v22);
        end;
        v12.saveSearchHistory(v20, v22);
    end, {
        v12.getSearchHistory, 
        v12.saveSearchHistory
    });
    local v30 = v3.useCallback(function(v25, v26, v27) --[[ Line: 74 ]]
        -- upvalues: v7 (ref), v10 (copy), v18 (copy), v14 (copy), v24 (copy)
        if v27 == nil then
            return;
        elseif v7(v10.searchBarRef, v27) then
            v18();
            return;
        else
            v14(false);
            local v28 = v10.session.placeIdObservable.get();
            if v26 and v28 then
                local v29 = string.gsub(v25.Text, "^%s*(.-)%s*$", "%1");
                if v29 ~= "" then
                    v24(v28, v29);
                end;
            end;
            v10.onFocusLost(v25, v26, v27, v18);
            return;
        end;
    end, {
        v7, 
        v10.searchBarRef, 
        v18, 
        v10.session.placeIdObservable, 
        v24, 
        v10.onFocusLost
    });
    local v33 = v3.useCallback(function() --[[ Line: 107 ]]
        -- upvalues: v18 (copy), v10 (copy), v12 (copy)
        v18();
        local v31 = v10.session.placeIdObservable.get();
        local v32 = if v31 then v12.getSearchHistory(v31) else {};
        v10.onSearchHistoryButtonClicked(v32);
    end, {
        v18, 
        v10.textBoxRef, 
        v10.session.placeIdObservable, 
        v12.getSearchHistory, 
        v10.onSearchHistoryButtonClicked
    });
    local v35 = v3.useCallback(function() --[[ Line: 123 ]]
        -- upvalues: v18 (copy), v10 (copy)
        v18();
        local l_current_1 = v10.textBoxRef.current;
        assert(l_current_1 ~= nil, "Expected textBox to exist");
        l_current_1.Text = "";
    end, {
        v18, 
        v10.textBoxRef
    });
    local v41 = v3.useCallback(function(v36) --[[ Line: 131 ]]
        -- upvalues: v16 (copy), v10 (copy), l_ExplorerFilter_0 (ref)
        local v37 = string.gsub(v36.Text:sub(1, 32767), "\n", " ");
        v36.Text = v37;
        v16(v37 ~= "");
        v10.session.setSearch(v37);
        l_ExplorerFilter_0:SetFilter(v37);
        local l_l_ExplorerFilter_0_Autocompleter_0 = l_ExplorerFilter_0:GetAutocompleter();
        local l_ReplaceRange_0 = l_l_ExplorerFilter_0_Autocompleter_0.ReplaceRange;
        local v40 = if l_l_ExplorerFilter_0_Autocompleter_0.RequiresOutsideContext then {} else l_l_ExplorerFilter_0_Autocompleter_0:GetSuggestions();
        v10.onTextBoxChanged(v36, l_ReplaceRange_0, v40);
    end, {
        v10.session.setSearch, 
        v10.onTextBoxChanged
    });
    v3.useEffect(function() --[[ Line: 148 ]]
        -- upvalues: v10 (copy)
        local l_current_2 = v10.textBoxRef.current;
        assert(l_current_2 ~= nil, "Text box not mounted");
        l_current_2.Text = v10.session.getSearch();
    end, {
        v10.session
    });
    local v43 = v6();
    return l_createElement_0("Frame", {
        LayoutOrder = v10.layoutOrder, 
        ref = v10.searchBarRef, 
        [v3.Tag] = "X-RowS X-Middle Explorer-FillX Explorer-SidePadS Explorer-BG-Input Explorer-SearchBox-Corner Explorer-SearchBox-SearchBar"
    }, {
        FocusBorder = v13 and l_createElement_0("UIStroke"), 
        TextBox = l_createElement_0("TextBox", {
            LayoutOrder = v43(), 
            PlaceholderText = v11:getText("SearchBar", "PlaceholderText"), 
            ref = v10.textBoxRef, 
            [v3.Change.Text] = v41, 
            [v3.Event.Focused] = v19, 
            [v3.Event.FocusLost] = v30, 
            [v3.Tag] = "Explorer-FillX"
        }), 
        ClearTextButton = v15:getValue() and l_createElement_0("ImageButton", {
            Image = v2.standard("clearSearch"), 
            LayoutOrder = v43(), 
            [v3.Event.MouseButton1Up] = v35, 
            [v3.Tag] = "Explorer-Content-Standard Explorer-Icon data-testid=SearchBar-ClearTextButton"
        }), 
        SearchHistoryButton = l_createElement_0("ImageButton", {
            Image = v2.standard("searchHistory"), 
            LayoutOrder = v43(), 
            [v3.Event.MouseButton1Up] = v33, 
            [v3.Tag] = "Explorer-Content-Standard Explorer-Icon data-testid=SearchBar-SearchHistoryButton"
        })
    });
end;