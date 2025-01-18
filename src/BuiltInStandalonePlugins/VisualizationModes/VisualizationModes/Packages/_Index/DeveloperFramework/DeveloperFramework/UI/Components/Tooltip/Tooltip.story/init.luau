local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Tooltip);
local v3 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v4 = require(l_Parent_0.UI.Components.LinkText);
local v5 = require(l_Parent_0.UI.Components.Pane);
local v6 = require(l_Parent_0.UI.Components.TextLabel);
local v7 = require(l_Parent_0.UI.Components.Slider);
return {
    stories = {
        {
            name = "For label", 
            story = v1.createElement(v6, {
                Text = "Hover over this text", 
                Size = UDim2.new(1, 0, 0, 20)
            }, {
                Tooltip = v1.createElement(v2, {
                    Text = "An example tooltip"
                })
            })
        }, 
        {
            name = "For button", 
            story = v1.createElement(v3, {
                Text = "Hover over this button", 
                Size = UDim2.new(1, 0, 0, 32), 
                Style = "Round", 
                OnClick = function() --[[ Line: 30 ]] --[[ Name: OnClick ]]

                end
            }, {
                Tooltip = v1.createElement(v2, {
                    Text = "Some example which is really rather long indeed!"
                })
            })
        }, 
        {
            name = "For automatic size child", 
            story = v1.createElement(v2, {
                Text = "Some example which is really rather long indeed!", 
                Child = v1.createElement(v5, {
                    Style = "BorderBox", 
                    Padding = 10
                }, {
                    Child = v1.createElement(v6, {
                        Text = "Hover over this pane!", 
                        AutomaticSize = Enum.AutomaticSize.XY
                    })
                })
            })
        }, 
        {
            name = "Slider With Tooltip", 
            story = v1.createElement(v2, {
                Text = "An example tooltip", 
                Child = v1.createElement(v7, {
                    Size = UDim2.new(0, 200, 0, 20), 
                    Min = 0, 
                    Max = 10, 
                    Value = 5, 
                    OnValueChanged = function() --[[ Line: 61 ]] --[[ Name: OnValueChanged ]]

                    end
                })
            })
        }, 
        {
            name = "Tooltip with Custom Content", 
            story = v1.createElement(v6, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = "Hover over this text"
            }, {
                Tooltip = v1.createElement(v2, {
                    Content = v1.createElement(v5, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Layout = Enum.FillDirection.Vertical, 
                        Spacing = 6
                    }, {
                        TextLabel = v1.createElement(v6, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 1, 
                            Size = UDim2.fromScale(1, 0), 
                            Text = "An example tooltip with text and a link", 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }), 
                        LinkText = v1.createElement(v4, {
                            LayoutOrder = 2, 
                            Text = "Click me", 
                            OnClick = function() --[[ Line: 91 ]] --[[ Name: OnClick ]]
                                print("Clicked");
                            end
                        })
                    }), 
                    ContentExtents = Vector2.new(180, 64)
                })
            })
        }
    }
};