local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.ContextServices);
local l_withContext_0 = v2.withContext;
local l_UI_0 = l_Parent_0.UI;
local v5 = require(l_UI_0.Components.Pane);
local v6 = require(l_Parent_0.Util);
local l_LayoutOrderIterator_0 = v6.LayoutOrderIterator;
local l_prioritize_0 = v6.prioritize;
local l_ColorStringValidators_0 = v6.ColorStringValidators;
local v10 = require(script.ColorPropertiesPanel);
local v11 = require(script.ColorValueSlider);
local v12 = require(script.HueSaturationPicker);
local v13 = v1.PureComponent:extend("ColorPicker");
v13.init = function(v14) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: l_ColorStringValidators_0 (copy)
    v14.state = {
        h = 1, 
        s = 1, 
        v = 1
    };
    v14.SetNewHSV = function(v15, v16, v17) --[[ Line: 56 ]]
        -- upvalues: v14 (copy)
        v14:setState(function(v18) --[[ Line: 57 ]]
            -- upvalues: v15 (copy), v16 (copy), v17 (copy)
            if v18.h ~= v15 or v18.s ~= v16 or v18.v ~= v17 then
                return {
                    h = v15, 
                    s = v16, 
                    v = v17
                };
            else
                return nil;
            end;
        end);
        local v19 = Color3.fromHSV(v15, v16, v17);
        v14.props.OnColorChanged(v19);
    end;
    v14.onTextChangedHex = function(v20) --[[ Line: 72 ]]
        -- upvalues: l_ColorStringValidators_0 (ref), v14 (copy)
        local v21, v22, v23 = l_ColorStringValidators_0.RGBFromHexString(v20);
        v21 = tonumber(v21, 16);
        v22 = tonumber(v22, 16);
        v23 = tonumber(v23, 16);
        local v24, v25, v26 = Color3.fromRGB(v21, v22, v23):ToHSV();
        v14.SetNewHSV(v24, v25, v26);
    end;
    v14.onTextChangedRGB = function(v27) --[[ Line: 83 ]]
        -- upvalues: l_ColorStringValidators_0 (ref), v14 (copy)
        local v28, v29, v30 = l_ColorStringValidators_0.RGBFromRGBString(v27);
        v28 = tonumber(v28);
        v29 = tonumber(v29);
        v30 = tonumber(v30);
        local v31, v32, v33 = Color3.fromRGB(v28, v29, v30):ToHSV();
        v14.SetNewHSV(v31, v32, v33);
    end;
    v14.onTextChangedHSV = function(v34) --[[ Line: 94 ]]
        -- upvalues: l_ColorStringValidators_0 (ref), v14 (copy)
        local v35, v36, v37 = l_ColorStringValidators_0.HSVFromHSVString(v34);
        local v38 = (tonumber(v35) or 360) / 360;
        local v39 = (tonumber(v36) or 100) / 100;
        local v40 = (tonumber(v37) or 100) / 100;
        v14.SetNewHSV(v38, v39, v40);
    end;
    v14.onHueSaturationChanged = function(v41, v42) --[[ Line: 103 ]]
        -- upvalues: v14 (copy)
        v14.SetNewHSV(v41, v42, v14.state.v);
    end;
    v14.onColorValueChanged = function(v43) --[[ Line: 107 ]]
        -- upvalues: v14 (copy)
        v14.SetNewHSV(v14.state.h, v14.state.s, v43);
    end;
end;
v13.getDerivedStateFromProps = function(v44, v45) --[[ Line: 112 ]] --[[ Name: getDerivedStateFromProps ]]
    if v44.Color == nil then
        return {
            h = 1, 
            s = 1, 
            v = 1
        };
    elseif v45.Color ~= v44.Color then
        v45.Color = v44.Color;
        local v46, v47, v48 = v44.Color:ToHSV();
        return {
            h = v46, 
            s = v47, 
            v = v48, 
            Color = v44.Color
        };
    else
        return nil;
    end;
end;
v13.render = function(v49) --[[ Line: 137 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_prioritize_0 (copy), v1 (copy), v5 (copy), v10 (copy), v12 (copy), v11 (copy)
    local l_props_0 = v49.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v52 = l_LayoutOrderIterator_0.new();
    local v53 = l_LayoutOrderIterator_0.new();
    local v54 = l_LayoutOrderIterator_0.new();
    local v55 = l_prioritize_0(l_props_0.Size, l_Stylizer_0.Size);
    local v56 = Color3.fromHSV(v49.state.h, v49.state.s, v49.state.v);
    assert(typeof(l_props_0.OnColorChanged) == "function", string.format("ColorPicker requires OnColorChanged to be of type function, not %s", (typeof(l_props_0.OnColorChanged))));
    return v1.createElement(v5, {
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Padding = l_Stylizer_0.Padding, 
        Spacing = l_Stylizer_0.Spacing, 
        Size = v55
    }, {
        Body = v1.createElement(v5, {
            Size = l_Stylizer_0.BodySize, 
            LayoutOrder = v52:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_Stylizer_0.BodySpacing, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            ColorPropertiesPanel = v1.createElement(v10, {
                LayoutOrder = v53:getNextOrder(), 
                Hue = v49.state.h, 
                Saturation = v49.state.s, 
                Value = v49.state.v, 
                Color = v56, 
                OnTextChangedHex = v49.onTextChangedHex, 
                OnTextChangedRGB = v49.onTextChangedRGB, 
                OnTextChangedHSV = v49.onTextChangedHSV, 
                Style = l_Stylizer_0
            }), 
            Picker = v1.createElement(v5, {
                Size = l_Stylizer_0.PickerSize, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v53:getNextOrder(), 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                HueSaturationPicker = v1.createElement(v12, {
                    LayoutOrder = v54:getNextOrder(), 
                    Hue = v49.state.h, 
                    Value = v49.state.v, 
                    Saturation = v49.state.s, 
                    OnHueSaturationChanged = v49.onHueSaturationChanged, 
                    Style = l_Stylizer_0
                }), 
                ColorValueSlider = v1.createElement(v11, {
                    LayoutOrder = v54:getNextOrder(), 
                    Hue = v49.state.h, 
                    Saturation = v49.state.s, 
                    Value = v49.state.v, 
                    updatePosition = v49.onColorValueChanged, 
                    Style = l_Stylizer_0
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v13));