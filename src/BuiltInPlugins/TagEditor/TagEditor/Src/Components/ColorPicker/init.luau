local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local v9 = require(l_Parent_0.Src.TagManager);
local v10 = require(l_Parent_0.Src.Actions);
local l_UI_0 = v3.UI;
local l_ColorPicker_0 = l_UI_0.ColorPicker;
local l_Pane_0 = l_UI_0.Pane;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v15 = require(script.ColorPickerTopControls);
local v16 = require(script.ColorPropertiesPanel);
local v17 = require(script.ColorValueSlider);
local v18 = require(script.HueSaturationPicker);
local v19 = game:DefineFastFlag("TagEditorUseColorPicker", false);
local v20 = v1.PureComponent:extend("ColorPicker");
v20.init = function(v21) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy), v9 (copy)
    if not v19 then
        v21.state = {
            h = 0, 
            s = 0, 
            v = 0
        };
        v21.SetNewHSV = function(v22, v23, v24) --[[ Line: 61 ]]
            -- upvalues: v21 (copy)
            v21:setState(function(v25) --[[ Line: 62 ]]
                -- upvalues: v22 (copy), v23 (copy), v24 (copy)
                if v25.h ~= v22 or v25.s ~= v23 or v25.v ~= v24 then
                    return {
                        h = v22, 
                        s = v23, 
                        v = v24
                    };
                else
                    return nil;
                end;
            end);
        end;
        v21.onSave = function() --[[ Line: 75 ]]
            -- upvalues: v9 (ref), v21 (copy)
            v9.Get():SetColor(v21.props.tagName, Color3.fromHSV(v21.state.h, v21.state.s, v21.state.v));
            v21.props.close();
        end;
        v21.onTextChangedHex = function(v26) --[[ Line: 80 ]]
            -- upvalues: v21 (copy)
            local v27, v28, v29 = v26:match("^%s*%#?(%x%x)(%x%x)(%x%x)%s*$");
            v27 = tonumber(v27, 16);
            v28 = tonumber(v28, 16);
            v29 = tonumber(v29, 16);
            local v30, v31, v32 = Color3.fromRGB(v27, v28, v29):ToHSV();
            v21.SetNewHSV(v30, v31, v32);
        end;
        v21.onTextChangedRGB = function(v33) --[[ Line: 91 ]]
            -- upvalues: v21 (copy)
            local v34, v35, v36 = v33:match("^%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*%s*$");
            v34 = tonumber(v34);
            v35 = tonumber(v35);
            v36 = tonumber(v36);
            local v37, v38, v39 = Color3.fromRGB(v34, v35, v36):ToHSV();
            v21.SetNewHSV(v37, v38, v39);
        end;
        v21.onTextChangedHSV = function(v40) --[[ Line: 102 ]]
            -- upvalues: v21 (copy)
            local v41, v42, v43 = v40:match("^%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*%s*$");
            local v44 = tonumber(v41) or 1;
            local v45 = tonumber(v42) or 1;
            local v46 = tonumber(v43) or 1;
            v21.SetNewHSV(v44, v45, v46);
        end;
        v21.onHueSaturationChanged = function(v47, v48) --[[ Line: 111 ]]
            -- upvalues: v21 (copy)
            v21:setState({
                h = v47, 
                s = v48
            });
        end;
        v21.onColorValueChanged = function(v49) --[[ Line: 118 ]]
            -- upvalues: v21 (copy)
            v21:setState({
                v = v49
            });
        end;
        return;
    else
        v21.onColorChanged = function(v50) --[[ Line: 124 ]]
            -- upvalues: v21 (copy)
            v21:setState({
                color = v50
            });
        end;
        v21.onSave = function() --[[ Line: 130 ]]
            -- upvalues: v9 (ref), v21 (copy)
            v9.Get():SetColor(v21.props.tagName, v21.state.color);
            v21.props.close();
        end;
        v21:setState({
            color = v21.props.tagColor
        });
        return;
    end;
end;
if not v19 then
    v20.getDerivedStateFromProps = function(v51, v52) --[[ Line: 142 ]] --[[ Name: getDerivedStateFromProps ]]
        if v51.tagColor == nil then
            return {
                h = 0, 
                s = 0, 
                v = 0
            };
        elseif v52.tagColor ~= v51.tagColor then
            v52.tagColor = v51.tagColor;
            local v53, v54, v55 = v51.tagColor:ToHSV();
            return {
                h = v53, 
                s = v54, 
                v = v55, 
                tagColor = v51.tagColor
            };
        else
            return nil;
        end;
    end;
end;
v20.render = function(v56) --[[ Line: 167 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v19 (copy), v1 (copy), l_Pane_0 (copy), v15 (copy), v16 (copy), v18 (copy), v17 (copy), l_ColorPicker_0 (copy)
    local l_props_0 = v56.props;
    local l_ColorPicker_1 = l_props_0.Stylizer.ColorPicker;
    local v59 = l_LayoutOrderIterator_0.new();
    local v60 = l_LayoutOrderIterator_0.new();
    local v61 = l_LayoutOrderIterator_0.new();
    local v62 = if v19 then v56.state.color else Color3.fromHSV(v56.state.h, v56.state.s, v56.state.v);
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        Padding = l_ColorPicker_1.Padding, 
        Spacing = l_ColorPicker_1.Spacing
    }, {
        TopControls = v1.createElement(v15, {
            LayoutOrder = v59:getNextOrder(), 
            TagName = l_props_0.tagName, 
            Color = v62, 
            Close = l_props_0.close, 
            Save = v56.onSave
        }), 
        Body = if not v19 then v1.createElement(l_Pane_0, {
            Size = l_ColorPicker_1.BodySize, 
            LayoutOrder = v59:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_ColorPicker_1.BodySpacing
        }, {
            ColorPropertiesPanel = v1.createElement(v16, {
                LayoutOrder = v60:getNextOrder(), 
                Hue = v56.state.h, 
                Saturation = v56.state.s, 
                Value = v56.state.v, 
                Color = v62, 
                OnTextChangedHex = v56.onTextChangedHex, 
                OnTextChangedRGB = v56.onTextChangedRGB, 
                OnTextChangedHSV = v56.onTextChangedHSV
            }), 
            Picker = v1.createElement(l_Pane_0, {
                Size = l_ColorPicker_1.PickerSize, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v60:getNextOrder(), 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                HueSaturationPicker = v1.createElement(v18, {
                    LayoutOrder = v61:getNextOrder(), 
                    Hue = v56.state.h, 
                    Value = v56.state.v, 
                    Saturation = v56.state.s, 
                    OnHueSaturationChanged = v56.onHueSaturationChanged
                }), 
                ColorValueSlider = v1.createElement(v17, {
                    LayoutOrder = v61:getNextOrder(), 
                    Hue = v56.state.h, 
                    Saturation = v56.state.s, 
                    Value = v56.state.v, 
                    updatePosition = v56.onColorValueChanged
                })
            })
        }) else nil, 
        ColorPickerComponent = if v19 then v1.createElement(l_ColorPicker_0, {
            LayoutOrder = v59:getNextOrder(), 
            Color = v62, 
            Size = l_ColorPicker_1.BodySize, 
            OnColorChanged = v56.onColorChanged
        }) else nil
    });
end;
v20 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v20);
return (v2.connect(function(v63) --[[ Line: 247 ]] --[[ Name: mapStateToProps ]]
    local l_ColorPicker_2 = v63.ColorPicker;
    local v65 = nil;
    local v66 = nil;
    for _, v68 in pairs(v63.TagData) do
        if v68.Name == l_ColorPicker_2 then
            v65 = v68.Icon;
            v66 = v68.Color;
            break;
        end;
    end;
    return {
        tagName = l_ColorPicker_2, 
        tagIcon = v65, 
        tagColor = v66
    };
end, function(v69) --[[ Line: 266 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy)
    return {
        close = function() --[[ Line: 268 ]] --[[ Name: close ]]
            -- upvalues: v69 (copy), v10 (ref)
            v69(v10.ToggleColorPicker(""));
        end
    };
end)(v20));