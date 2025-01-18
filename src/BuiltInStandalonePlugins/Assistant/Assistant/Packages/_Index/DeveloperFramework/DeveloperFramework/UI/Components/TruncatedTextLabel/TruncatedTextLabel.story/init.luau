local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.TruncatedTextLabel);
local v3 = require(l_Parent_0.UI.Components.Pane);
local v4 = v1.PureComponent:extend("ExampleTruncatedTextLabel");
v4.init = function(v5) --[[ Line: 9 ]] --[[ Name: init ]]
    v5:setState({
        count = 1
    });
    v5.updateCount = function() --[[ Line: 13 ]]
        -- upvalues: v5 (copy)
        v5:setState(function(v6) --[[ Line: 14 ]]
            return {
                count = v6.count + 1
            };
        end);
    end;
end;
v4.render = function(v7) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v8 = tostring(v7.state.count);
    return v1.createElement(v3, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Padding = 50, 
        Spacing = 10, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left
    }, {
        Instruction = v1.createElement(v2, {
            Text = "Resize the storybook window!", 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 2
        }), 
        SuffixLength = v1.createElement(v2, {
            Text = "This line has a suffix length of 8. This line has a suffix length of 8.", 
            SuffixLength = 8, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 3
        }), 
        NoSuffixLength = v1.createElement(v2, {
            Text = "This line has no suffix length. This line has no suffix length. ", 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 4
        }), 
        On = v1.createElement(v2, {
            Text = "Number of times the absolute size of this text label has changed is: " .. v8, 
            SuffixLength = string.len(v8), 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 4, 
            [v1.Change.AbsoluteSize] = v7.updateCount
        })
    });
end;
return v4;