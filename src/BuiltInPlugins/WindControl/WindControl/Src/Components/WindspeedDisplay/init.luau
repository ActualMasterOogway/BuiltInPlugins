local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Slider_0 = l_UI_0.Slider;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v11 = require(script.Parent.ValueEditTextBox);
local v12 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local _ = function() --[[ Line: 65 ]] --[[ Name: sliderValueFromWindspeed ]]
    local _ = 0;
    if workspace.GlobalWind.Magnitude <= 1 then
        return -0.1;
    else
        return (math.min(math.log10(workspace.GlobalWind.Magnitude), 3));
    end;
end;
local function _(v15) --[[ Line: 75 ]] --[[ Name: WindspeedFromSliderValue ]]
    if v15 < 0 then
        return 0;
    else
        return (math.pow(1000, v15 / 3));
    end;
end;
local v17 = v1.Component:extend("WindspeedDisplay");
v17.init = function(v18) --[[ Line: 85 ]] --[[ Name: init ]]
    v18:setState({
        isEditingText = false, 
        isChangingPitch = false, 
        isChangingYaw = false
    });
    v18.isHoldingSlider = false;
    v18.setisChangingPitch = function() --[[ Line: 94 ]]
        -- upvalues: v18 (copy)
        v18.props.yawStateRequested();
    end;
    v18.setisChangingYaw = function() --[[ Line: 98 ]]
        -- upvalues: v18 (copy)
        v18.props.pitchStateRequested();
    end;
    v18.setIsScaling = function() --[[ Line: 102 ]]
        -- upvalues: v18 (copy)
        v18.props.speedStateRequested();
    end;
    v18.setWindSpeed = function(v19) --[[ Line: 106 ]]
        -- upvalues: v18 (copy)
        v19 = math.max(0, v19);
        workspace.GlobalWind = v18.props.WindDirection.Unit * v19;
    end;
    v18.setWindYaw = function(v20) --[[ Line: 111 ]]
        local v21 = 1;
        local v22 = 0;
        local v23 = (0.5 - v20 / 180) * 3.141592653589793;
        if workspace.GlobalWind:Dot(workspace.GlobalWind) > 0 then
            v21 = workspace.GlobalWind.Magnitude;
            v22 = math.asin((math.clamp(workspace.GlobalWind.Unit.Y, -1, 1)));
        end;
        local v24 = CFrame.fromEulerAnglesYXZ(0, v23, 0) * CFrame.fromEulerAnglesYXZ(v22, 0, 0);
        workspace.GlobalWind = v24.LookVector * v21;
    end;
    v18.setWindPitch = function(v25) --[[ Line: 125 ]]
        local v26 = 1;
        local v27 = (180 + v25) / 180 * 3.141592653589793;
        local v28 = -1.5707963267948966;
        if workspace.GlobalWind:Dot(workspace.GlobalWind) > 0 then
            v26 = workspace.GlobalWind.Magnitude;
            local l_Unit_0 = workspace.GlobalWind.Unit;
            local v30 = l_Unit_0.z < 0 and 3.141592653589793 or 0;
            v28 = if l_Unit_0.z ~= 0 then v30 + math.atan(l_Unit_0.x / l_Unit_0.z) else if l_Unit_0.x > 0 then v30 + 1.5707963267948966 else v30 - 1.5707963267948966;
        end;
        local v31 = CFrame.fromEulerAnglesYXZ(0, v28, 0) * CFrame.fromEulerAnglesYXZ(v27, 0, 0);
        workspace.GlobalWind = v31.LookVector * v26;
    end;
    v18.getWindPitch = function() --[[ Line: 149 ]]
        -- upvalues: v18 (copy)
        if v18.props.WindDirection:Dot(v18.props.WindDirection) > 0 then
            local v32 = math.round(-90 + 180 * v18.props.WindDirection:Angle(Vector3.yAxis, Vector3.yAxis) / 3.141592653589793);
            if v32 == nil then
                return 0;
            else
                return v32;
            end;
        else
            return 0;
        end;
    end;
    v18.getWindYaw = function() --[[ Line: 161 ]]
        -- upvalues: v18 (copy)
        if v18.props.WindDirection:Dot(v18.props.WindDirection) > 0 then
            local v33 = math.round(180 + 180 * (v18.props.WindDirection * Vector3.new(1, 0, 1, 0)):Angle(Vector3.xAxis, Vector3.yAxis) / 3.141592653589793) % 360;
            if v33 == nil then
                return 0;
            else
                return v33;
            end;
        else
            return 0;
        end;
    end;
    v18.setCurrentValue = function(v34) --[[ Line: 174 ]]
        -- upvalues: v18 (copy)
        if v18.isChangingYaw then
            v18.setWindYaw(v34);
            return;
        elseif v18.isChangingPitch then
            v18.setWindPitch(v34);
            return;
        else
            v18.setWindSpeed(v34);
            return;
        end;
    end;
    v18.getCurrentValueText = function() --[[ Line: 184 ]]
        -- upvalues: v18 (copy)
        if v18.isChangingYaw then
            return string.format("%d\194\176", v18.getWindYaw());
        elseif v18.isChangingPitch then
            return string.format("%d\194\176", v18.getWindPitch());
        else
            return v18.props.Localization:getText("WindspeedDisplay", "sps", {
                string.format("%.1f", workspace.GlobalWind.Magnitude)
            });
        end;
    end;
    v18.getSliderMinValue = function() --[[ Line: 198 ]]
        -- upvalues: v18 (copy)
        if v18.isChangingYaw then
            return 0;
        elseif v18.isChangingPitch then
            return -90;
        else
            return -0.1;
        end;
    end;
    v18.getSliderMaxValue = function() --[[ Line: 208 ]]
        -- upvalues: v18 (copy)
        if v18.isChangingYaw then
            return 359;
        elseif v18.isChangingPitch then
            return 90;
        else
            return 3;
        end;
    end;
    v18.getSliderCurrentValue = function() --[[ Line: 218 ]]
        -- upvalues: v18 (copy)
        if v18.isChangingYaw then
            return v18.getWindYaw();
        elseif v18.isChangingPitch then
            return v18.getWindPitch();
        else
            local _ = 0;
            return workspace.GlobalWind.Magnitude <= 1 and -0.1 or math.min(math.log10(workspace.GlobalWind.Magnitude), 3);
        end;
    end;
end;
v17.render = function(v36) --[[ Line: 229 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_Slider_0 (copy), v12 (copy), v11 (copy)
    local l_props_0 = v36.props;
    local l_WindspeedDisplay_0 = l_props_0.Stylizer.WindspeedDisplay;
    local l_Localization_1 = l_props_0.Localization;
    v36.isChangingPitch = l_props_0.isChangingPitch;
    v36.isChangingYaw = l_props_0.isChangingYaw;
    local l_isEditingText_0 = v36.state.isEditingText;
    return v1.createElement(l_Pane_0, {
        Size = l_WindspeedDisplay_0.Size, 
        Position = l_WindspeedDisplay_0.Position
    }, {
        ButtonPanel = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Size = UDim2.fromScale(0.5, 0.9), 
            Position = UDim2.fromScale(0, -0.45)
        }, {
            Button1 = v1.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                Size = l_WindspeedDisplay_0.ButtonSize, 
                OnClick = v36.setIsScaling
            }, {
                TextLabel1 = v1.createElement(l_TextLabel_0, {
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = l_Localization_1:getText("WindspeedDisplay", "Speed"), 
                    TextSize = l_WindspeedDisplay_0.ButtonTextSize, 
                    TextColor = if not not l_props_0.isChangingYaw or l_props_0.isChangingPitch then l_WindspeedDisplay_0.inactiveLabelColor else l_WindspeedDisplay_0.activeLabelColor
                })
            }), 
            Button2 = v1.createElement(l_Pane_0, {
                LayoutOrder = 2, 
                Size = l_WindspeedDisplay_0.ButtonSize, 
                OnClick = v36.setisChangingYaw
            }, {
                TextLabel2 = v1.createElement(l_TextLabel_0, {
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = l_Localization_1:getText("WindspeedDisplay", "Yaw"), 
                    TextSize = l_WindspeedDisplay_0.ButtonTextSize, 
                    TextColor = if l_props_0.isChangingYaw then l_WindspeedDisplay_0.activeLabelColor else l_WindspeedDisplay_0.inactiveLabelColor
                })
            }), 
            Button3 = v1.createElement(l_Pane_0, {
                LayoutOrder = 3, 
                Size = l_WindspeedDisplay_0.ButtonSize, 
                OnClick = v36.setisChangingPitch
            }, {
                TextLabel3 = v1.createElement(l_TextLabel_0, {
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = l_Localization_1:getText("WindspeedDisplay", "Pitch"), 
                    TextSize = l_WindspeedDisplay_0.ButtonTextSize, 
                    TextColor = if l_props_0.isChangingPitch then l_WindspeedDisplay_0.activeLabelColor else l_WindspeedDisplay_0.inactiveLabelColor
                })
            })
        }), 
        Slider = v1.createElement(l_Slider_0, {
            Min = v36.getSliderMinValue(), 
            Max = v36.getSliderMaxValue(), 
            Value = v36.getSliderCurrentValue(), 
            Size = l_WindspeedDisplay_0.Slider.Size, 
            Position = l_WindspeedDisplay_0.Slider.Position, 
            OnValueChanged = function(v41) --[[ Line: 293 ]] --[[ Name: OnValueChanged ]]
                -- upvalues: v36 (copy)
                if v36.isChangingYaw or v36.isChangingPitch then
                    v36.setCurrentValue(v41);
                    return;
                else
                    v36.setWindSpeed(v41 < 0 and 0 or math.pow(1000, v41 / 3));
                    return;
                end;
            end, 
            OnChangeBegan = function() --[[ Line: 300 ]] --[[ Name: OnChangeBegan ]]
                -- upvalues: v12 (ref)
                local l_v12_0 = v12;
                l_v12_0.sliderCount = l_v12_0.sliderCount + 1;
            end
        }), 
        Pane = v1.createElement(l_Pane_0, {
            Size = l_WindspeedDisplay_0.TextLabel.Size, 
            Position = l_WindspeedDisplay_0.TextLabel.Position, 
            OnClick = function() --[[ Line: 308 ]] --[[ Name: OnClick ]]
                -- upvalues: l_isEditingText_0 (copy), v36 (copy)
                if not l_isEditingText_0 then
                    v36:setState({
                        isEditingText = true
                    });
                end;
            end
        }, {
            TextLabel = not l_isEditingText_0 and v1.createElement(l_TextLabel_0, {
                Text = v36.getCurrentValueText(), 
                Style = l_WindspeedDisplay_0.TextLabel.Style, 
                ref = v36.textLabelRef
            }), 
            ValueEditTextBox = l_isEditingText_0 and v1.createElement(v11, {
                Text = v36.getCurrentValueText(), 
                Size = UDim2.fromScale(1, 1), 
                OnTextConfirmed = function(v43) --[[ Line: 326 ]] --[[ Name: OnTextConfirmed ]]
                    -- upvalues: v36 (copy), v12 (ref)
                    v36:setState({
                        isEditingText = false
                    });
                    local v44 = tonumber(v43);
                    if v44 ~= nil then
                        v36.setCurrentValue(v44);
                    end;
                    local l_v12_1 = v12;
                    l_v12_1.textFieldCount = l_v12_1.textFieldCount + 1;
                end, 
                OnEditCanceled = function() --[[ Line: 336 ]] --[[ Name: OnEditCanceled ]]
                    -- upvalues: v36 (copy)
                    v36:setState({
                        isEditingText = false
                    });
                end
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v17));