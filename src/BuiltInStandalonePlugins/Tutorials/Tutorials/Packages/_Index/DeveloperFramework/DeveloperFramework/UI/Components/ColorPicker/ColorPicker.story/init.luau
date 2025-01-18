local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.ColorPicker);
local v3 = require(l_Parent_0.UI.Components.Pane);
local v4 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v5 = v1.PureComponent:extend("ColorPickerStory");
v5.init = function(v6) --[[ Line: 9 ]] --[[ Name: init ]]
    v6.state = {
        Color = Color3.new(1, 0, 0)
    };
    v6.onChanged = function(v7) --[[ Line: 13 ]]
        -- upvalues: v6 (copy)
        print("color changed to ", v7);
        v6:setState({
            Color = v7
        });
    end;
end;
v5.render = function(v8) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v2 (copy)
    local l_state_0 = v8.state;
    return v1.createElement(v3, {
        Size = UDim2.new(1, 0, 0, 350), 
        Layout = Enum.FillDirection.Vertical
    }, {
        Button1 = v1.createElement(v4, {
            Text = "Reset to red", 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 25), 
            OnClick = function() --[[ Line: 32 ]] --[[ Name: OnClick ]]
                -- upvalues: v8 (copy)
                v8.onChanged(Color3.new(1, 0, 0));
            end
        }), 
        Button2 = v1.createElement(v4, {
            Text = "Reset to blue", 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 25), 
            OnClick = function() --[[ Line: 40 ]] --[[ Name: OnClick ]]
                -- upvalues: v8 (copy)
                v8.onChanged(Color3.new(0, 0, 1));
            end
        }), 
        ColorPicker = v1.createElement(v2, {
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, 300), 
            Color = l_state_0.Color, 
            OnColorChanged = v8.onChanged
        })
    });
end;
return {
    stories = {
        {
            name = "Default", 
            summary = "A color picker for users to view and edit a color3 value in a variety of ways.", 
            story = v5
        }
    }
};