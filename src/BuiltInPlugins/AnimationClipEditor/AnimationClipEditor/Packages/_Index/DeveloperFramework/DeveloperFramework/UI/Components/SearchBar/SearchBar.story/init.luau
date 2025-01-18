local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.SearchBar);
return v1.createElement(v2, {
    AutomaticSize = Enum.AutomaticSize.Y, 
    Layout = Enum.FillDirection.Vertical, 
    Spacing = 10, 
    Size = UDim2.new(0, 300, 0, 0)
}, {
    Default = v1.createElement(v3, {
        OnSearchRequested = function(v4) --[[ Line: 15 ]] --[[ Name: OnSearchRequested ]]
            print("Search: " .. v4);
        end, 
        Size = UDim2.new(0, 300, 0, 32)
    }), 
    WithIcon = v1.createElement(v3, {
        PlaceholderText = "With Left Icon", 
        ShowSearchIcon = true, 
        ShowSearchButton = false, 
        OnSearchRequested = function(v5) --[[ Line: 24 ]] --[[ Name: OnSearchRequested ]]
            print("Search: " .. v5);
        end, 
        Size = UDim2.new(0, 300, 0, 32)
    }), 
    Compact = v1.createElement(v3, {
        PlaceholderText = "Compact", 
        Style = "Compact", 
        ShowSearchButton = true, 
        OnSearchRequested = function(v6) --[[ Line: 33 ]] --[[ Name: OnSearchRequested ]]
            print("Search: " .. v6);
        end, 
        Size = UDim2.new(0, 300, 0, 32)
    }), 
    Incremental = v1.createElement(v3, {
        PlaceholderText = "Incremental", 
        IncrementalTextSearch = true, 
        OnSearchRequested = function(v7) --[[ Line: 41 ]] --[[ Name: OnSearchRequested ]]
            print("Search: " .. v7);
        end, 
        Size = UDim2.new(0, 300, 0, 32)
    })
});