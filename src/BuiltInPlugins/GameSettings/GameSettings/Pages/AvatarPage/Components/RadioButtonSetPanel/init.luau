local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_RoactStudioWidgets_0 = l_Parent_0.Packages.RoactStudioWidgets;
local v3 = require(l_RoactStudioWidgets_0.RadioButtonSet);
local v4 = v1.Component:extend("ComponentRadioButtonSetPanel");
v4.render = function(v5) --[[ Line: 9 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy)
    if not (v5.props.IsVisible == nil or v5.props.IsVisible) then
        return v1.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            BorderSizePixel = 0
        });
    else
        return v1.createElement(v3, {
            Title = v5.props.Title, 
            Buttons = v5.props.Buttons, 
            Enabled = v5.props.Enabled, 
            LayoutOrder = v5.props.LayoutOrder, 
            Selected = v5.props.Selected, 
            SubDescription = v5.props.SubDescription, 
            SelectionChanged = v5.props.SelectionChanged, 
            Mouse = v5.props.Mouse
        });
    end;
end;
return v4;