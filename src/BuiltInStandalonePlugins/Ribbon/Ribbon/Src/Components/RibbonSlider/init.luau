local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_joinTags_0 = v2.Styling.joinTags;
local l_Attribute_0 = require(l_script_FirstAncestor_0.Src.Resources.PluginStyles):GetAttribute("SliderSize");
local l_Slider_0 = v2.UI.Slider;
return function(v7) --[[ Line: 31 ]] --[[ Name: RibbonSlider ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy), l_Slider_0 (copy), l_Attribute_0 (copy)
    local v8 = v7[v1.Tag];
    if not v7.Minimum or not v7.Maximum or type(v7.Minimum) ~= "number" or type(v7.Maximum) ~= "number" or v7.Minimum >= v7.Maximum then
        warn((("Invalid range %* - %* for ribbon slider"):format(v7.Minimum, v7.Maximum)));
        v7.Minimum = 0;
        v7.Maximum = 1;
    end;
    return v1.createElement("Frame", {
        LayoutOrder = v7.LayoutOrder, 
        [v1.Tag] = l_joinTags_0("Component-RibbonButton X-Fit X-Column X-Center", v8)
    }, {
        RibbonTool = v1.createElement("Frame", {
            [v1.Tag] = "Role-Surface X-Fit X-PadRibbonTool X-CornerM"
        }, {
            SliderBody = v1.createElement(l_Slider_0, {
                Min = v7.Minimum, 
                Max = v7.Maximum, 
                Value = v7.Value, 
                ShowInput = not v7.HideInput, 
                Disabled = v7.Disabled, 
                LayoutOrder = v7.LayoutOrder, 
                InputPrecision = v7.Precision, 
                SnapIncrement = v7.Increment, 
                VerticalDragTolerance = 0, 
                OnValueChanged = function(v9) --[[ Line: 63 ]] --[[ Name: OnValueChanged ]]
                    -- upvalues: v7 (copy)
                    v7.OnValueChanged(v9, v7.Uri);
                end, 
                Size = l_Attribute_0, 
                [v1.Tag] = "Icon-Large"
            })
        }), 
        Text = if v7.Text ~= "" then v1.createElement("TextLabel", {
            Text = v7.Text, 
            [v1.Tag] = "X-Fit X-PadButtonLabel"
        }) else nil
    });
end;