local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Core.Components.SearchBar.SearchBar);
local v4 = require(l_Parent_0.Core.Components.SearchOptions.LiveSearchDropdown);
local v5 = v2.PureComponent:extend("LiveSearchBar");
local v6 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
v5.init = function(v7, v8) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v6 (copy)
    v7.state = {
        currentText = v8.searchTerm or "", 
        showDropdown = false, 
        extraDetails = {}
    };
    v7.frameRef = v2.createRef();
    v7.onTextChanged = function(v9, v10) --[[ Line: 45 ]]
        -- upvalues: v7 (copy), v2 (ref)
        if v9 ~= v7.state.currentText then
            v7:setState({
                currentText = v9, 
                showDropdown = true, 
                extraDetails = v10 or v2.None
            });
            v7.props.updateSearch(v9, v7.state.extraDetails);
        end;
    end;
    v7.onDropdownClicked = function(v11) --[[ Line: 57 ]]
        -- upvalues: v7 (copy)
        local l_Name_0 = v11.Name;
        v7.onTextChanged(l_Name_0, v11);
        v7:setState({
            extraDetails = v11
        });
        if v7.props.OnSelectItem then
            v7.props.OnSelectItem(v11);
        end;
    end;
    v7.onDeleteTag = function() --[[ Line: 69 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            currentText = ""
        });
    end;
    v7.closeDropdown = function() --[[ Line: 75 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            showDropdown = false
        });
    end;
    v7.resetSearchBar = v6() and function() --[[ Line: 82 ]]
        -- upvalues: v7 (copy)
        v7:setState(function(v13) --[[ Line: 83 ]]
            if v13.currentText ~= "" or v13.showDropdown or next(v13.extraDetails) ~= nil then
                return {
                    currentText = "", 
                    extraDetails = {}, 
                    showDropdown = false
                };
            else
                return nil;
            end;
        end);
    end or function() --[[ Line: 95 ]]

    end;
end;
v5.didUpdate = function(v14) --[[ Line: 104 ]] --[[ Name: didUpdate ]]
    -- upvalues: v6 (copy)
    if v6() and v14.props.searchTerm == "" then
        v14.resetSearchBar();
    end;
    local l_currentText_0 = v14.state.currentText;
    if v14.props.searchTerm ~= l_currentText_0 then
        v14.props.updateSearch(l_currentText_0, v14.state.extraDetails);
    end;
end;
v5.render = function(v16) --[[ Line: 115 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local l_width_0 = v16.props.width;
    local l_searchTerm_0 = v16.props.searchTerm;
    local l_LayoutOrder_0 = v16.props.LayoutOrder;
    local l_currentText_1 = v16.state.currentText;
    local l_showDropdown_0 = v16.state.showDropdown;
    local l_results_0 = v16.props.results;
    local l_defaultTextKey_0 = v16.props.defaultTextKey;
    local l_GetKey_0 = v16.props.GetKey;
    local v25 = v16.frameRef and v16.frameRef.current;
    local v26 = nil;
    v26 = if v25 then UDim2.new(0, v25.AbsolutePosition.X, 0, v25.AbsolutePosition.Y + 26) else UDim2.new();
    local v27 = l_showDropdown_0 and l_searchTerm_0 == l_currentText_1 and #l_currentText_1 >= 3;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 25), 
        [v2.Ref] = v16.frameRef
    }, {
        SearchBar = v2.createElement(v3, {
            width = l_width_0, 
            onTextChanged = v16.onTextChanged, 
            onSearchRequested = v16.onTextChanged, 
            defaultTextKey = l_defaultTextKey_0, 
            searchTerm = l_currentText_1, 
            onDeleteTag = v16.onDeleteTag, 
            IsLive = true
        }), 
        Dropdown = v27 and v2.createElement(v4, {
            Size = UDim2.new(0, l_width_0, 0, 0), 
            Position = v26, 
            Items = l_results_0, 
            GetKey = l_GetKey_0, 
            SearchTerm = l_currentText_1, 
            onItemClicked = v16.onDropdownClicked, 
            closeDropdown = v16.closeDropdown
        })
    });
end;
return v5;