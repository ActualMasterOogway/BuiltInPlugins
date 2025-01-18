local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util.StyleModifier);
local l_Components_0 = l_Parent_0.UI.Components;
local v4 = require(l_Components_0.Slider);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v6 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v7 = require(l_Parent_0.Styling.supportsStyleSheets);
local _ = require(script.Parent.Parent.Types);
return function(v9) --[[ Line: 17 ]] --[[ Name: SliderRenderer ]]
    -- upvalues: v1 (copy), v4 (copy), l_join_0 (copy), v7 (copy), v2 (copy), v6 (copy)
    local l_Schema_0 = v9.Schema;
    return v1.createElement(v4, l_join_0({
        Disabled = v9.Disabled, 
        Max = l_Schema_0.Max, 
        Min = l_Schema_0.Min, 
        OnValueChanged = v9.OnChanged, 
        Size = if v9.AutomaticSize then UDim2.new(1, 0, 0, v9.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
        CustomValidation = v9.CustomValidation, 
        ShowInput = l_Schema_0.ShowInput, 
        SnapIncrement = l_Schema_0.SnapIncrement, 
        StyleModifier = if not v7 and v9.HasError then v2.Error else nil, 
        VerticalDragTolerance = 0, 
        Value = v9.Value
    }, if v7 then {
        [v6.Tag] = if v9.HasError then l_Schema_0.ErrorStyle else nil
    } else nil));
end;