local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local v2 = require(l_Parent_0.Parent.React);
local l_Components_0 = l_Parent_0.UI.Components;
local v4 = require(l_Components_0.Alert);
local v5 = require(l_Components_0.Slider);
local v6 = require(l_Components_0.Pane);
local v7 = require(l_Parent_0.Util.LayoutOrderIterator);
local function v9(v8) --[[ Line: 13 ]] --[[ Name: AlertStory ]]
    -- upvalues: v2 (copy), v4 (copy), v1 (copy)
    return v2.createElement(v4, v1.join({
        Title = "Alert Title", 
        Description = "Alert Description", 
        PrimaryAction = {
            Text = "Primary Action", 
            OnClick = function() --[[ Line: 22 ]] --[[ Name: OnClick ]]
                print("Clicked primary action");
            end
        }, 
        OnClose = function() --[[ Line: 27 ]] --[[ Name: OnClose ]]
            print("on close");
        end
    }, v8));
end;
return {
    stories = {
        {
            name = "Alert", 
            story = v2.createElement(v9)
        }, 
        {
            name = "Warning", 
            story = v2.createElement(v9, {
                Style = "Warning"
            })
        }, 
        {
            name = "Error", 
            story = v2.createElement(v9, {
                Style = "Error"
            })
        }, 
        {
            name = "Success", 
            story = v2.createElement(v9, {
                Style = "Success"
            })
        }, 
        {
            name = "Info", 
            story = v2.createElement(v9, {
                Style = "Info"
            })
        }, 
        {
            name = "Reactive sizing", 
            story = function() --[[ Line: 71 ]] --[[ Name: story ]]
                -- upvalues: v7 (copy), v2 (copy), v6 (copy), v5 (copy), v9 (copy)
                local v10 = v7.new();
                local v11, v12 = v2.useState(500);
                return v2.createElement(v6, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Layout = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }, {
                    Slider = v2.createElement(v5, {
                        Min = 150, 
                        Max = 500, 
                        Value = v11, 
                        Size = UDim2.fromOffset(250, 32), 
                        OnValueChanged = v12, 
                        LayoutOrder = v10:getNextOrder()
                    }), 
                    AlertPane = v2.createElement(v6, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = v10:getNextOrder(), 
                        Size = UDim2.fromOffset(v11, 0)
                    }, {
                        Alert = v2.createElement(v9, {
                            Title = "My very long alert title", 
                            ShortTitle = "Short title", 
                            Description = "My very very very very very long alert description"
                        })
                    })
                });
            end
        }
    }
};