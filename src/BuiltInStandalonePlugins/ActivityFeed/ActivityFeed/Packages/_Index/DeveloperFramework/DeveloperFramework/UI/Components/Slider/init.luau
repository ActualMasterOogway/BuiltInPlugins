local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Immutable_0 = require(l_Parent_0.Util).Immutable;
local v3 = require(l_Parent_0.Util.Typecheck);
local v4 = require(l_Parent_0.Util.numberToString);
local v5 = require(l_Parent_0.Parent.Dash);
local l_UI_0 = l_Parent_0.UI;
local v7 = require(l_UI_0.Components.Pane);
local v8 = require(l_UI_0.Components.RangeSlider);
local v9 = require(l_UI_0.Components.TextInput);
local v10 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkSliderInputValidation);
local v11 = v1.PureComponent:extend("Slider");
v3.wrap(v11, script);
if v10() then
    v11.defaultProps = {
        InputPrecision = 3
    };
    v11.init = function(v12) --[[ Line: 51 ]] --[[ Name: init ]]
        -- upvalues: v1 (copy)
        v12.textInputRef = v1.createRef();
    end;
end;
v11.render = function(v13) --[[ Line: 56 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v5 (copy), l_Immutable_0 (copy), v1 (copy), v8 (copy), v4 (copy), v7 (copy), v9 (copy)
    local l_props_0 = v13.props;
    local v15 = nil;
    v15 = if v10() then v5.join(v5.omit(l_props_0, {
        "OnValueChanged", 
        "InputPrecision", 
        "ShowInput", 
        "Value"
    }), {
        HideLowerKnob = true, 
        LowerRangeValue = l_props_0.Min, 
        UpperRangeValue = l_props_0.Value, 
        OnValuesChanged = function(_, v17) --[[ Line: 72 ]] --[[ Name: OnValuesChanged ]]
            -- upvalues: v13 (copy)
            if v13.props.OnValueChanged then
                v13.props.OnValueChanged(v17);
            end;
        end
    }) else l_Immutable_0.JoinDictionaries(l_Immutable_0.RemoveFromDictionary(l_props_0, "ShowInput", "Value", "OnValueChanged"), {
        HideLowerKnob = true, 
        LowerRangeValue = l_props_0.Min, 
        UpperRangeValue = l_props_0.Value, 
        OnValuesChanged = function(_, v19) --[[ Line: 85 ]] --[[ Name: OnValuesChanged ]]
            -- upvalues: v13 (copy)
            if v13.props.OnValueChanged then
                v13.props.OnValueChanged(v19);
            end;
        end
    });
    if l_props_0.ShowInput then
        v15.Size = UDim2.new(1, -60, 1, 0);
    end;
    local v20 = v1.createElement(v8, v15);
    if l_props_0.ShowInput then
        local v21 = v4(l_props_0.Value, if v10() then l_props_0.InputPrecision else l_props_0.InputPrecision or 2);
        if v10() then
            v13.lastValidInput = l_props_0.Value;
        end;
        return v1.createElement(v7, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = 10, 
            Size = l_props_0.Size
        }, {
            Input = v1.createElement(v9, {
                Disabled = l_props_0.Disabled, 
                ForwardRef = v13.textInputRef, 
                Size = UDim2.new(0, 50, 1, 0), 
                Text = v21, 
                OnFocusLost = function(v22) --[[ Line: 118 ]] --[[ Name: OnFocusLost ]]
                    -- upvalues: l_props_0 (copy), v10 (ref), v13 (copy), v4 (ref)
                    if not v22 then
                        return;
                    else
                        local v23 = tonumber(v22);
                        if l_props_0.CustomValidation then
                            l_props_0.OnValueChanged(v23);
                            if l_props_0.OnInputEnded then
                                l_props_0.OnInputEnded();
                            end;
                        elseif v23 ~= nil then
                            l_props_0.OnValueChanged((math.min(l_props_0.Max, (math.max(l_props_0.Min, v23)))));
                            if l_props_0.OnInputEnded then
                                l_props_0.OnInputEnded();
                            end;
                        end;
                        if v10() then
                            local l_current_0 = v13.textInputRef.current;
                            if l_current_0 then
                                l_current_0.Text = v4(v23 or v13.lastValidValue, l_props_0.InputPrecision);
                            end;
                        end;
                        return;
                    end;
                end, 
                OnFormatText = v10() and function(v25) --[[ Line: 144 ]]
                    -- upvalues: v13 (copy), v4 (ref), l_props_0 (copy)
                    local v26 = string.match(v25, "^%s*[-]?[0-9]*[.]?[0-9]*%s*$");
                    if v26 then
                        if v26 ~= "" then
                            v13.lastValidValue = tonumber(v26);
                        end;
                        return v26;
                    else
                        return v4(v13.lastValidValue, l_props_0.InputPrecision);
                    end;
                end or nil, 
                StyleModifier = l_props_0.StyleModifier
            }), 
            Slider = v20
        });
    else
        return v20;
    end;
end;
return v11;