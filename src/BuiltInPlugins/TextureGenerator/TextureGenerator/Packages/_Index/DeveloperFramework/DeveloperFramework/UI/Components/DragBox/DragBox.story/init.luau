local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.DragBox);
local v3 = require(l_Parent_0.UI.Components.Pane);
local v4 = v1.PureComponent:extend("ExampleDragBox");
local v5 = Vector2.new(0, 0);
formatNumber = function(v6) --[[ Line: 11 ]] --[[ Name: formatNumber ]]
    return (tostring(math.floor(0.5 + v6 * 100) / 100));
end;
getTootipText = function(v7) --[[ Line: 16 ]] --[[ Name: getTootipText ]]
    return "test dragbox: X: " .. formatNumber(v7.X) .. ",Y: " .. formatNumber(v7.Y);
end;
v4.init = function(v8) --[[ Line: 20 ]] --[[ Name: init ]]
    -- upvalues: v5 (ref)
    v8.state = {
        MinX = -1, 
        MaxX = 1, 
        MinY = -1, 
        MaxY = 1, 
        Value = Vector2.new(0, 0)
    };
    v8.setValue = function(v9) --[[ Line: 28 ]]
        -- upvalues: v5 (ref), v8 (copy)
        v5 = Vector2.new(v9.X, v9.Y);
        v8:setState({
            Tooltip = getTootipText(v5), 
            Value = v9
        });
    end;
end;
v4.render = function(v10) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy), v5 (ref)
    return v1.createElement(v3, {
        Layout = Enum.FillDirection.Vertical, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Padding = 10, 
        Spacing = 15
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 10), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        DragBox = v1.createElement(v2, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Disabled = false, 
            MinX = -1, 
            MaxX = 1, 
            MinY = -1, 
            MaxY = 1, 
            Tooltip = getTootipText(v5), 
            Value = Vector2.new(v5.X, v5.Y), 
            OnValueChanged = v10.setValue, 
            Size = UDim2.new(0, 200, 0, 60), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            VerticalDragTolerance = 300
        }), 
        DisabledDragBox = v1.createElement(v2, {
            Disabled = true, 
            MinX = -1, 
            MaxX = 1, 
            MinY = -1, 
            MaxY = 1, 
            Value = Vector2.new(0, 0), 
            OnValueChanged = function() --[[ Line: 71 ]] --[[ Name: OnValueChanged ]]

            end, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 200, 0, 20)
        })
    });
end;
return v4;