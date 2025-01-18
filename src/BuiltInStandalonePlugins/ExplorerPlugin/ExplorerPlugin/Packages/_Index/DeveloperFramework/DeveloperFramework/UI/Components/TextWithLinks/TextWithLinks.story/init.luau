local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.TextWithLinks);
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
                    LinkMap = {
                        ["[link]"] = {
                            LinkText = "here", 
                            LinkCallback = function() --[[ Line: 25 ]] --[[ Name: LinkCallback ]]
                                print("Clicked!");
                            end
                        }
                    }
                });
            end
        }, 
        {
            name = "Long", 
            story = function() --[[ Line: 35 ]] --[[ Name: story ]]
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
                    LinkMap = {
                        ["{link}"] = {
                            LinkText = "link", 
                            LinkCallback = function() --[[ Line: 49 ]] --[[ Name: LinkCallback ]]
                                print("Clicked!");
                            end
                        }
                    }
                });
            end
        }, 
        {
            name = "Varied", 
            story = function() --[[ Line: 59 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy)
                return v1.createElement(v2, {
                    TextProps = {
                        TextSize = 18, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Font = Enum.Font.SourceSans
                    }, 
                    MaxWidth = 100, 
                    Text = "Hello here is some long text with multiple links. This first {link1} uses one placeholder, while this second {link2} uses another. This third {link1} uses the same placeholder as the first. This line after the link will wrap on its own it's that long!", 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LinkMap = {
                        ["{link1}"] = {
                            LinkText = "link", 
                            LinkCallback = function() --[[ Line: 73 ]] --[[ Name: LinkCallback ]]
                                print("Clicked link 1!");
                            end
                        }, 
                        ["{link2}"] = {
                            LinkText = "link", 
                            LinkCallback = function() --[[ Line: 79 ]] --[[ Name: LinkCallback ]]
                                print("Clicked link 2!");
                            end
                        }
                    }
                });
            end
        }
    }
};