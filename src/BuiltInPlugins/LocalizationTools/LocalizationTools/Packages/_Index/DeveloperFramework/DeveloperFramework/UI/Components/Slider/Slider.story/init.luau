local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Slider);
local v3 = v1.PureComponent:extend("SliderStory");
v3.init = function(v4) --[[ Line: 7 ]] --[[ Name: init ]]
    v4.state = {
        value = v4.props.InitialValue
    };
    v4.onValueChanged = function(v5) --[[ Line: 11 ]]
        -- upvalues: v4 (copy)
        v4:setState({
            value = v5
        });
    end;
end;
v3.render = function(v6) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_props_0 = v6.props;
    return v1.createElement(v2, {
        Value = v6.state.value, 
        Min = l_props_0.Min, 
        Max = l_props_0.Max, 
        Disabled = l_props_0.Disabled, 
        OnValueChanged = function(v8) --[[ Line: 25 ]] --[[ Name: OnValueChanged ]]
            -- upvalues: v6 (copy)
            v6.onValueChanged(v8);
        end, 
        ShowInput = l_props_0.ShowInput, 
        Size = UDim2.fromOffset(300, 32), 
        SnapIncrement = l_props_0.SnapIncrement, 
        VerticalDragTolerance = 0
    });
end;
return {
    stories = {
        {
            name = "Slider", 
            story = v1.createElement(v3, {
                InitialValue = 4, 
                Min = 0, 
                Max = 4, 
                SnapIncrement = 1
            })
        }, 
        {
            name = "Slider with input", 
            story = v1.createElement(v3, {
                InitialValue = 0.5, 
                Min = 0, 
                Max = 1, 
                ShowInput = true, 
                SnapIncrement = 0.05
            })
        }, 
        {
            name = "Disabled slider", 
            story = v1.createElement(v3, {
                InitialValue = 8, 
                Min = 0, 
                Max = 10, 
                SnapIncrement = 1, 
                Disabled = true
            })
        }
    }
};