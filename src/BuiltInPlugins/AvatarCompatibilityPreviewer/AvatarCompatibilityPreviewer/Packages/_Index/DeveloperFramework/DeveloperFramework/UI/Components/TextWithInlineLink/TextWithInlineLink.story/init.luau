local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.TextWithInlineLink);
return {
    stories = {
        {
            name = "Small", 
            story = function() --[[ Line: 10 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy)
                return v1.createElement(v2, {
                    TextProps = {
                        Font = Enum.Font.SourceSans, 
                        TextSize = 18, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    MaxWidth = 300, 
                    Text = "Click [link] to learn more.", 
                    LinkText = "here", 
                    LinkPlaceholder = "[link]", 
                    OnLinkClicked = function() --[[ Line: 24 ]] --[[ Name: OnLinkClicked ]]
                        print("Clicked!");
                    end
                });
            end
        }, 
        {
            name = "Long", 
            story = function() --[[ Line: 32 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy)
                return v1.createElement(v2, {
                    TextProps = {
                        TextSize = 18, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Font = Enum.Font.SourceSans
                    }, 
                    MaxWidth = 100, 
                    Text = "Hello here is a {link} that is going to cause this to wrap onto another line and this line after the link will wrap on its own it's that long!", 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LinkText = "Link", 
                    LinkPlaceholder = "{link}", 
                    OnLinkClicked = function() --[[ Line: 45 ]] --[[ Name: OnLinkClicked ]]
                        print("Clicked!");
                    end
                });
            end
        }
    }
};