local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
return v1(".Component-SearchBar", {}, {
    v1("> .Input > .Buttons", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, 0, 0, 0)
    }, {
        v1("> .ClearButton >> ImageLabel", {
            Image = "rbxasset://textures/DeveloperFramework/StudioTheme/clear.png", 
            Size = UDim2.fromOffset(12, 12)
        }), 
        v1("> .SearchButton >> ImageLabel", {
            Image = "$SearchIcon", 
            Size = UDim2.fromOffset(13, 13)
        }), 
        v1("> .FilterButton >> ImageLabel", {})
    }), 
    v1("> .Input > .SearchIcon", {
        Image = "$SearchIcon"
    })
}, {});