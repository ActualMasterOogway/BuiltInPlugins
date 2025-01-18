local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_SearchBar_0 = require(l_Parent_0.Packages.Framework).UI.SearchBar;
local v4 = require(l_Parent_0.Src.Thunks.Watch.FilterWatchDataThunk);
local v5 = v1.PureComponent:extend("SearchBarField");
v5.render = function(v6) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_SearchBar_0 (copy)
    local l_props_0 = v6.props;
    return v1.createElement(l_SearchBar_0, {
        ShowSearchIcon = true, 
        ShowSearchButton = false, 
        OnTextChanged = l_props_0.onFilterTextChanged, 
        OnSearchRequested = l_props_0.onSearchRequested, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_props_0.Size, 
        SearchTerm = l_props_0.SearchTerm
    });
end;
return (v2.connect(function(v8, _) --[[ Line: 29 ]]
    return {
        SearchTerm = v8.Watch.filterText
    };
end, function(v10) --[[ Line: 34 ]]
    -- upvalues: v4 (copy)
    return {
        onFilterTextChanged = function(v11) --[[ Line: 36 ]] --[[ Name: onFilterTextChanged ]]
            -- upvalues: v10 (copy), v4 (ref)
            return v10(v4(v11));
        end, 
        onSearchRequested = function(v12) --[[ Line: 39 ]] --[[ Name: onSearchRequested ]]
            -- upvalues: v10 (copy), v4 (ref)
            return v10(v4(v12));
        end
    };
end)(v5));