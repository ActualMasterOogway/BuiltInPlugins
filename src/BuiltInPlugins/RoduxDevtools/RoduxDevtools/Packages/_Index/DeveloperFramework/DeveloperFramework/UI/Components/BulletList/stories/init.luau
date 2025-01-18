local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.BulletList);
local v3 = require(l_Parent_0.UI.Components.LinkText);
local v4 = require(l_Parent_0.UI.Components.Image);
return function() --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), v3 (copy)
    return {
        Basic = v1.createElement(v2, {
            Items = {
                "Bulbasaur", 
                "Charmander", 
                "Squirtle", 
                "This indeed is a very long item for this list example that one would expect to overflow had we not wrapped it."
            }, 
            TextWrapped = true
        }), 
        WithIndentation = v1.createElement(v2, {
            Items = {
                "Grass", 
                {
                    Text = "Bulbasaur", 
                    Style = "SubItem"
                }, 
                "Fire", 
                {
                    Text = "Charmander", 
                    Style = "SubItem"
                }, 
                {
                    Text = "Cyndaquil", 
                    Style = "SubItem"
                }, 
                "Water", 
                {
                    Text = "Squirtle", 
                    Style = "SubItem"
                }, 
                {
                    Text = "Totodile", 
                    Style = "SubItem"
                }, 
                {
                    Text = "This indeed is a very long item for this list example that one would expect to overflow had we not wrapped it.", 
                    Style = "SubItem"
                }
            }, 
            TextWrapped = true
        }), 
        WithRenderedComponents = v1.createElement(v2, {
            Items = {
                v1.createElement(v4, {
                    Size = UDim2.fromOffset(100, 100), 
                    Image = "rbxasset://textures/ui/common/robux_color@2x.png"
                }), 
                "As you can see, arbitrary elements can be used as list items", 
                v1.createElement(v3, {
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    OnClick = function() --[[ Line: 48 ]] --[[ Name: OnClick ]]
                        print("Link clicked!");
                    end, 
                    Text = "And here is a link, displayed as a list element"
                })
            }, 
            TextWrapped = true
        })
    };
end;