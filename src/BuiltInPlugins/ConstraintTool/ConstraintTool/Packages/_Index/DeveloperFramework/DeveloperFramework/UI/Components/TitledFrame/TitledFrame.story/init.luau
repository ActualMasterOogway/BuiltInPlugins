local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.TitledFrame);
local v3 = require(l_Parent_0.UI.Components.TextLabel);
return {
    stories = {
        {
            name = "Horizontal layout (default)", 
            story = function() --[[ Line: 11 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy), v3 (copy)
                return v1.createElement(v2, {}, {
                    Child = v1.createElement(v3, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = "Child component"
                    })
                });
            end
        }, 
        {
            name = "Horizontal layout + Label style", 
            story = function() --[[ Line: 22 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy), v3 (copy)
                return v1.createElement(v2, {
                    Style = "Label"
                }, {
                    Child = v1.createElement(v3, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = "Child component"
                    })
                });
            end
        }, 
        {
            name = "Vertical layout + Title style", 
            story = function() --[[ Line: 35 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy), v3 (copy)
                return v1.createElement(v2, {
                    Style = "Title"
                }, {
                    Child = v1.createElement(v3, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = "Child component"
                    })
                });
            end
        }, 
        {
            name = "Vertical layout + Subtitle style", 
            story = function() --[[ Line: 48 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy), v3 (copy)
                return v1.createElement(v2, {
                    Style = "Subtitle"
                }, {
                    Child = v1.createElement(v3, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = "Child component"
                    })
                });
            end
        }
    }
};