local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local v4 = require(l_script_FirstAncestor_0.Enums.ButtonSize);
local v5 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v6 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v7 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v9 = require(script.Parent.useButtonVariants);
local v10 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v12 = require(l_script_FirstAncestor_0.Components.Icon);
local v13 = require(l_script_FirstAncestor_0.Components.View);
local v14 = require(l_script_FirstAncestor_0.Components.Text);
local v15 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v16 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v17 = {
    [v5.Link] = {
        format = "<u>%s</u>", 
        controlState = {
            v7.Hover, 
            v7.Pressed
        }
    }
};
local function v19(v18) --[[ Line: 41 ]] --[[ Name: onProgressChange ]]
    if v18 == 1 then
        return NumberSequence.new(0);
    elseif v18 == 0 then
        return NumberSequence.new(0.5);
    else
        return NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(math.max(0, v18 - 1.0E-4), 0), 
            NumberSequenceKeypoint.new(v18, 0.5), 
            NumberSequenceKeypoint.new(1, 0.5)
        });
    end;
end;
local function _(v20, v21) --[[ Line: 57 ]] --[[ Name: getTransparency ]]
    if v21 then
        return v20 + (1 - v20) * 0.5;
    else
        return v20;
    end;
end;
local v23 = {
    isDisabled = false, 
    variant = v5.Standard, 
    size = v4.Small, 
    width = UDim.new(0, 0), 
    inputDelay = 0
};
return v2.memo(v2.forwardRef(function(v24, v25) --[[ Line: 85 ]] --[[ Name: Button ]]
    -- upvalues: v15 (copy), v23 (copy), v2 (copy), v7 (copy), v3 (copy), v8 (copy), v9 (copy), v10 (copy), v17 (copy), v13 (copy), v16 (copy), v6 (copy), v12 (copy), v14 (copy), v19 (copy)
    local v26 = v15(v24, v23);
    local l_inputDelay_0 = v26.inputDelay;
    local v28, v29 = v2.useBinding(v7.Initialize);
    local v30, v31 = v2.useState(l_inputDelay_0 > 0);
    local v33, v34 = v3.useAnimatedBinding(0, function(_) --[[ Line: 91 ]]
        -- upvalues: v31 (copy)
        v31(false);
    end);
    v2.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: l_inputDelay_0 (copy), v34 (copy), v3 (ref)
        if l_inputDelay_0 > 0 then
            v34((v3.ease(1, {
                duration = l_inputDelay_0, 
                easingStyle = Enum.EasingStyle.Quad
            })));
        end;
    end, {});
    local v35 = v8();
    local v36 = v9(v35, v26.size, v26.variant);
    local v37 = v10({
        radius = UDim.new(0, v35.Radius.Medium), 
        offset = v35.Size.Size_200, 
        borderWidth = v35.Stroke.Thicker
    });
    local v38 = v26.text and v26.text ~= "";
    local v41 = v2.useCallback(function(v39) --[[ Line: 116 ]]
        -- upvalues: v17 (ref), v26 (copy), v38 (copy)
        local v40 = v17[v26.variant];
        if v38 and v40 and table.find(v40.controlState, v39) then
            return (v40.format:format(v26.text));
        else
            return v26.text;
        end;
    end, {
        v26.text, 
        v26.variant, 
        v38
    });
    local l_createElement_0 = v2.createElement;
    local l_v13_0 = v13;
    local l_v16_0 = v16;
    local l_v26_0 = v26;
    local v46 = {
        AutomaticSize = if v26.width.Scale == 0 then Enum.AutomaticSize.X else nil, 
        GroupTransparency = if not v26.isDisabled or v30 then nil else 0.5, 
        backgroundStyle = v36.container.background, 
        flexItem = if v26.fillBehavior then {
            FlexMode = if v26.fillBehavior == v6.Fill then Enum.UIFlexMode.Fill else Enum.UIFlexMode.Shrink
        } else nil
    };
    local v47;
    if v36.container.stroke then
        v47 = {
            Color = v36.container.stroke.Color
        };
        local l_Transparency_0 = v36.container.stroke.Transparency;
        v47.Transparency = if v26.isDisabled then l_Transparency_0 + (1 - l_Transparency_0) * 0.5 else l_Transparency_0;
    else
        v47 = nil;
    end;
    v46.stroke = v47;
    v46.Size = UDim2.new(v26.fillBehavior == v6.Fill and 1 or v26.width.Scale, v26.fillBehavior == v6.Fill and 0 or v26.width.Offset, 0, v36.container.height);
    v46.selection = {
        Selectable = not v26.isDisabled, 
        SelectionImageObject = v37
    };
    v46.onActivated = v26.onActivated;
    v46.onStateChanged = v29;
    v46.isDisabled = v26.isDisabled or v30;
    v46.tag = v36.container.tag;
    v46.ref = v25;
    return l_createElement_0(l_v13_0, l_v16_0(l_v26_0, v46), {
        Icon = if v26.icon then v2.createElement(v12, {
            name = v26.icon, 
            size = v36.icon.size, 
            style = v36.icon.style, 
            LayoutOrder = 1
        }) else nil, 
        Text = if v38 then v2.createElement(v14, {
            Text = v28:map(v41), 
            RichText = v17[v26.variant] ~= nil, 
            tag = v36.text.tag, 
            LayoutOrder = 2
        }) else nil, 
        Gradient = if v30 then v2.createElement("UIGradient", {
            Transparency = v33:map(v19)
        }) else nil
    });
end));