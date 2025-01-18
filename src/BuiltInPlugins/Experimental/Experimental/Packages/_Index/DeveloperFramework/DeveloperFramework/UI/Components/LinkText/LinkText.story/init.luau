local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.LinkText);
local v3 = require(l_Parent_0.UI.Components.Pane);
return {
    stories = {
        Default = function() --[[ Line: 8 ]] --[[ Name: Default ]]
            -- upvalues: v1 (copy), v3 (copy), v2 (copy)
            return v1.createElement(v3, {
                Style = "BorderBox", 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Horizontal, 
                Spacing = UDim.new(0, 10), 
                Padding = 5
            }, {
                Link = v1.createElement(v2, {
                    Text = "Link 1", 
                    LayoutOrder = 1, 
                    OnClick = function() --[[ Line: 19 ]] --[[ Name: OnClick ]]
                        print("Clicked!");
                    end
                }), 
                Link2 = v1.createElement(v2, {
                    Text = "Link 2 which is longer", 
                    LayoutOrder = 2, 
                    OnClick = function() --[[ Line: 26 ]] --[[ Name: OnClick ]]
                        print("Clicked!");
                    end
                }), 
                Link3 = v1.createElement(v2, {
                    Text = "Link 3", 
                    LayoutOrder = 3, 
                    OnClick = function() --[[ Line: 33 ]] --[[ Name: OnClick ]]
                        print("Clicked!");
                    end
                })
            });
        end, 
        Truncated = function() --[[ Line: 39 ]] --[[ Name: Truncated ]]
            -- upvalues: v1 (copy), v3 (copy), v2 (copy)
            return v1.createElement(v3, {
                Style = "BorderBox", 
                Size = UDim2.new(1, 0, 0, 40), 
                Padding = 5
            }, {
                Link = v1.createElement(v2, {
                    Text = "Click Me! I get truncated when I am very long and go off the end of the screen, for example like this!", 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    OnClick = function() --[[ Line: 48 ]] --[[ Name: OnClick ]]
                        print("Clicked!");
                    end
                })
            });
        end, 
        Wrapped = function() --[[ Line: 54 ]] --[[ Name: Wrapped ]]
            -- upvalues: v1 (copy), v3 (copy), v2 (copy)
            return v1.createElement(v3, {
                Style = "BorderBox", 
                Size = UDim2.new(0, 400, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Padding = 5
            }, {
                Link = v1.createElement(v2, {
                    Text = "Click Me! I get wrapped when I am very long and go on to the next line, for example like this!", 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    OnClick = function() --[[ Line: 65 ]] --[[ Name: OnClick ]]
                        print("Clicked!");
                    end
                })
            });
        end
    }
};