local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TextLabel_0 = v2.UI.TextLabel;
local l_PropertyCell_0 = v2.UI.PropertyCell;
local l_Pane_0 = v2.UI.Pane;
return function(v6) --[[ Line: 22 ]] --[[ Name: LabelCell ]]
    -- upvalues: v1 (copy), l_PropertyCell_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local v7 = nil;
    v7 = if v6.Value ~= nil then v1.createElement(l_PropertyCell_0, {
        LayoutOrder = 2, 
        Size = UDim2.fromOffset(150, 30), 
        Disabled = v6.Disabled, 
        Schema = v6.Schema, 
        Value = v6.Value, 
        OnChanged = v6.OnChanged
    }) else v1.createElement(l_Pane_0, {
        LayoutOrder = 2, 
        Size = UDim2.fromOffset(150, 30)
    });
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v6.LayoutOrder, 
        [v1.Tag] = "X-RowM X-FitX X-Middle X-Stroke LabelCell"
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Text = v6.Text, 
            Size = UDim2.fromScale(0, 0), 
            [v1.Tag] = "X-Fit"
        }), 
        Cell = v7
    });
end;