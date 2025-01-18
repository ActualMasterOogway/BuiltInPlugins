local l_DevFrameworkToggleAllowEyeIcon_0 = game:GetFastFlag("DevFrameworkToggleAllowEyeIcon");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.Components.Pane);
local v4 = require(l_Parent_0.UI.Components.ToggleButton);
local v5 = v2.PureComponent:extend("ExampleToggleButton");
v5.init = function(v6, v7) --[[ Line: 11 ]] --[[ Name: init ]]
    v6.state = {
        toggleOn = v7.Selected
    };
    v6.onToggle = function() --[[ Line: 15 ]]
        -- upvalues: v6 (copy)
        v6:setState({
            toggleOn = not v6.state.toggleOn
        });
    end;
end;
v5.render = function(v8) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local v9 = if v8.props.Style then v8.props.Style else nil;
    return v2.createElement(v3, {
        Layout = Enum.FillDirection.Vertical, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Padding = 10, 
        Spacing = 15
    }, {
        ToggleButton = v2.createElement(v4, {
            Style = v9, 
            Disabled = v8.props.Disabled, 
            Selected = v8.state.toggleOn, 
            LayoutOrder = 1, 
            OnClick = v8.onToggle
        })
    });
end;
return {
    stories = {
        DisabledAndNotSelected = v2.createElement(v5, {
            Disabled = true, 
            Selected = false, 
            LayoutOrder = 0
        }), 
        DisabledAndSelected = v2.createElement(v5, {
            Disabled = true, 
            Selected = true, 
            LayoutOrder = 0
        }), 
        NotSelected = v2.createElement(v5, {
            Disabled = false, 
            Selected = false, 
            LayoutOrder = 0
        }), 
        Selected = v2.createElement(v5, {
            Disabled = false, 
            Selected = true, 
            LayoutOrder = 0
        }), 
        UseCheckboxStyle = v2.createElement(v5, {
            Style = "Checkbox"
        }), 
        UseEyeIconStyle = if l_DevFrameworkToggleAllowEyeIcon_0 then v2.createElement(v5, {
            Style = "EyeIcon"
        }) else nil
    }
};