local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Tooltip_0 = v2.UI.Tooltip;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v8 = v1.PureComponent:extend("Keyframe");
v8.buildTooltip = function(v9) --[[ Line: 56 ]] --[[ Name: buildTooltip ]]
    -- upvalues: v6 (copy), v7 (copy)
    local l_props_0 = v9.props;
    local l_Localization_0 = v9.props.Localization;
    local v12 = nil;
    local function _(v13) --[[ Line: 61 ]] --[[ Name: formatSlope ]]
        -- upvalues: v6 (ref)
        return string.format("%.3f", if v13 == 0 then math.abs(v13) else v13 * v6.TICK_FREQUENCY);
    end;
    local function v18(v15, v16) --[[ Line: 65 ]] --[[ Name: addTangentInformation ]]
        -- upvalues: l_Localization_0 (copy), v6 (ref)
        local v17 = "\n" .. l_Localization_0:getText("Curves", v15) .. " ";
        if v16 then
            return v17 .. l_Localization_0:getText("Curves", "TangentValuePerSecond", {
                value = string.format("%.3f", if v16 == 0 then math.abs(v16) else v16 * v6.TICK_FREQUENCY)
            });
        else
            return v17 .. l_Localization_0:getText("Curves", "TangentAuto");
        end;
    end;
    v12 = (v7.toString(l_props_0.Path or {}) .. "\n") .. l_Localization_0:getText("Curves", "InterpolationMode2", {
        interpolationMode = l_props_0.InterpolationMode.Name
    });
    if l_props_0.PrevInterpolationMode == Enum.KeyInterpolationMode.Cubic then
        v12 = v12 .. v18("LeftTangentLabel", l_props_0.LeftSlope);
    end;
    if l_props_0.InterpolationMode == Enum.KeyInterpolationMode.Cubic then
        v12 = v12 .. v18("RightTangentLabel", l_props_0.RightSlope);
    end;
    return v12;
end;
v8.render = function(v19) --[[ Line: 88 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v1 (copy), l_Tooltip_0 (copy)
    local l_props_1 = v19.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v22 = l_props_1.Width or v6.KEYFRAME_WIDTH;
    local l_Color_0 = l_props_1.Color;
    local l_Selected_0 = l_props_1.Selected;
    local l_ZIndex_0 = l_props_1.ZIndex;
    local v26 = v19:buildTooltip();
    local v27 = if l_Selected_0 then v6.KEYFRAME_BORDER_SIZE_SELECTED else v6.KEYFRAME_BORDER_SIZE;
    local v28 = if l_Selected_0 then l_Stylizer_0.keyframe.Default.selected.borderColor else l_Color_0;
    return v1.createElement("ImageButton", {
        Size = UDim2.new(0, v22, 0, v22), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0, l_props_1.Position.X, 0, l_props_1.Position.Y), 
        Rotation = 45, 
        ImageTransparency = 1, 
        BackgroundTransparency = 0, 
        AutoButtonColor = false, 
        BorderSizePixel = v27, 
        BorderColor3 = v28, 
        BackgroundColor3 = l_Color_0, 
        ZIndex = l_ZIndex_0, 
        [v1.Event.MouseButton2Click] = l_props_1.OnRightClick, 
        [v1.Event.InputBegan] = l_props_1.OnInputBegan, 
        [v1.Event.InputEnded] = l_props_1.OnInputEnded
    }, {
        Tooltip = v26 and v1.createElement(l_Tooltip_0, {
            Text = v26, 
            ShowDelay = 0, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v8));