local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v3 = require(l_Parent_0.ContextServices);
local l_withContext_0 = v3.withContext;
local l_Localization_0 = v3.Localization;
local l_UI_0 = l_Parent_0.UI;
local v7 = require(l_UI_0.Components.Pane);
local v8 = require(l_UI_0.Components.TextInput);
local v9 = require(l_UI_0.Components.TextLabel);
local l_Util_0 = l_Parent_0.Util;
local v11 = require(l_Util_0.LayoutOrderIterator);
local v12 = require(l_Util_0.ColorStringValidators);
local v13 = game:DefineFastFlag("DevFrameworkColorPickerTextValueConsistency", true);
local v14 = v1.PureComponent:extend("ColorPropertiesPanel");
v14.init = function(v15) --[[ Line: 62 ]] --[[ Name: init ]]
    v15.onFocusLostHex = function() --[[ Line: 63 ]]
        -- upvalues: v15 (copy)
        if v15.lastHexValid then
            v15.props.OnTextChangedHex(v15.lastHex);
        end;
    end;
    v15.onFocusLostRGB = function() --[[ Line: 68 ]]
        -- upvalues: v15 (copy)
        if v15.lastRGBValid then
            v15.props.OnTextChangedRGB(v15.lastRGB);
        end;
    end;
    v15.onFocusLostHSV = function() --[[ Line: 73 ]]
        -- upvalues: v15 (copy)
        if v15.lastHSVValid then
            v15.props.OnTextChangedHSV(v15.lastHSV);
        end;
    end;
    v15.onTextChangedHex = function(v16, v17) --[[ Line: 79 ]]
        -- upvalues: v15 (copy)
        v15.lastHexValid = v17;
        v15.lastHex = v16;
    end;
    v15.onTextChangedRGB = function(v18, v19) --[[ Line: 83 ]]
        -- upvalues: v15 (copy)
        v15.lastRGBValid = v19;
        v15.lastRGB = v18;
    end;
    v15.onTextChangedHSV = function(v20, v21) --[[ Line: 87 ]]
        -- upvalues: v15 (copy)
        v15.lastHSVValid = v21;
        v15.lastHSV = v20;
    end;
    v15.onFocusedHex = function() --[[ Line: 91 ]]
        -- upvalues: v15 (copy)
        v15.lastHexValid = false;
    end;
    v15.onFocusedRGB = function() --[[ Line: 94 ]]
        -- upvalues: v15 (copy)
        v15.lastRGBValid = false;
    end;
    v15.onFocusedHSV = function() --[[ Line: 97 ]]
        -- upvalues: v15 (copy)
        v15.lastHSVValid = false;
    end;
end;
v14.render = function(v22) --[[ Line: 102 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v1 (copy), v7 (copy), v9 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy), v8 (copy), v12 (copy), v13 (copy)
    local l_props_0 = v22.props;
    local l_ColorPropertiesPanel_0 = l_props_0.Style.ColorPropertiesPanel;
    local l_Localization_1 = l_props_0.Localization;
    local v26 = v11.new();
    local v27 = v11.new();
    local l_Hue_0 = l_props_0.Hue;
    local l_Saturation_0 = l_props_0.Saturation;
    local l_Value_0 = l_props_0.Value;
    local l_Color_0 = l_props_0.Color;
    local l_r_0 = l_Color_0.r;
    local l_g_0 = l_Color_0.g;
    local l_b_0 = l_Color_0.b;
    return v1.createElement(v7, {
        Size = l_ColorPropertiesPanel_0.Size, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Spacing = l_ColorPropertiesPanel_0.Spacing, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        ColorPane = v1.createElement(v7, {
            LayoutOrder = v26:getNextOrder(), 
            Size = l_ColorPropertiesPanel_0.ColorPreviewSize, 
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Preview = v1.createElement(v7, {
                LayoutOrder = v27:getNextOrder(), 
                Size = l_ColorPropertiesPanel_0.TextInputSize, 
                BackgroundColor = l_props_0.Color, 
                Style = l_ColorPropertiesPanel_0.ColorPreviewPaneStyle
            }), 
            TitleText = v1.createElement(v9, {
                LayoutOrder = v27:getNextOrder(), 
                Size = l_ColorPropertiesPanel_0.TextInputSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = l_Localization_1:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "ColorPicker", "Color"), 
                TextColor = l_ColorPropertiesPanel_0.TextColor, 
                TextSize = l_ColorPropertiesPanel_0.TextSize
            })
        }), 
        Hex = v1.createElement(v8, {
            LayoutOrder = v26:getNextOrder(), 
            Size = l_ColorPropertiesPanel_0.TextInputSize, 
            Text = string.format("#%02x%02x%02x", l_r_0 * 255, l_g_0 * 255, l_b_0 * 255), 
            BottomText = l_Localization_1:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "ColorPicker", "Hex"), 
            OnFocusLost = v22.onFocusLostHex, 
            OnValidateText = v12.validateHex, 
            OnTextChanged = v22.onTextChangedHex, 
            OnFocused = if v13 then v22.onFocusedHex else nil
        }), 
        RGB = v1.createElement(v8, {
            LayoutOrder = v26:getNextOrder(), 
            Size = l_ColorPropertiesPanel_0.TextInputSize, 
            Text = ("%d, %d, %d"):format(l_r_0 * 255, l_g_0 * 255, l_b_0 * 255), 
            BottomText = l_Localization_1:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "ColorPicker", "RGB"), 
            OnFocusLost = v22.onFocusLostRGB, 
            OnValidateText = v12.validateRGB, 
            OnTextChanged = v22.onTextChangedRGB, 
            OnFocused = if v13 then v22.onFocusedRGB else nil
        }), 
        HSV = v1.createElement(v8, {
            LayoutOrder = v26:getNextOrder(), 
            Size = l_ColorPropertiesPanel_0.TextInputSize, 
            Text = ("%d, %d, %d"):format(l_Hue_0 * 360, l_Saturation_0 * 100, l_Value_0 * 100), 
            BottomText = l_Localization_1:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "ColorPicker", "HSV"), 
            OnFocusLost = v22.onFocusLostHSV, 
            OnValidateText = v12.validateHSV, 
            OnTextChanged = v22.onTextChangedHSV, 
            OnFocused = if v13 then v22.onFocusedHSV else nil
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0
})(v14));