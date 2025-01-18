local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.RadioButton);
local v4 = v1.PureComponent:extend("RadioButtons");
v4.init = function(v5) --[[ Line: 10 ]] --[[ Name: init ]]
    v5.state = {
        isSelected = true
    };
    v5.onClick = function() --[[ Line: 14 ]]
        -- upvalues: v5 (copy)
        v5:setState({
            isSelected = not v5.state.isSelected
        });
    end;
end;
v4.render = function(v6) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.createElement(v2, {
        Layout = Enum.FillDirection.Vertical, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Padding = 10, 
        Spacing = 15
    }, {
        DisabledRadioButton = v1.createElement(v3, {
            Disabled = true, 
            Key = "KEY1", 
            LayoutOrder = 0, 
            OnClick = v6.onClick, 
            Selected = false, 
            Text = "Disabled"
        }), 
        SelectedRadioButton = v1.createElement(v3, {
            Disabled = false, 
            Key = "KEY2", 
            LayoutOrder = 1, 
            OnClick = v6.onClick, 
            Selected = v6.state.isSelected, 
            Text = "Clickable"
        })
    });
end;
return v4;