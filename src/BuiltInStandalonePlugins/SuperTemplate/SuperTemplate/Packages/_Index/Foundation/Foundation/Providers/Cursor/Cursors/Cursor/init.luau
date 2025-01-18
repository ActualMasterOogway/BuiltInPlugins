local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Image);
local v4 = require(script.Parent.Parent.CursorComponent);
local v5 = require(script.Parent.AnimatedGradient);
local v6 = require(l_script_FirstAncestor_0.Enums.CursorType);
local v7 = {
    [v6.BulletUp] = {
        Tag = "SlicedImage", 
        Image = "component_assets/bulletUp_17_stroke_3", 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        InsetAdjustment = 2
    }, 
    [v6.BulletDown] = {
        Tag = "SlicedImage", 
        Image = "component_assets/bulletDown_17_stroke_3", 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        InsetAdjustment = 2
    }, 
    [v6.InputFields] = {
        Tag = "SlicedImage", 
        Image = "component_assets/circle_22_stroke_3", 
        SliceCenter = Rect.new(11, 11, 12, 12), 
        InsetAdjustment = 14
    }, 
    [v6.SelectionCell] = {
        Tag = "SlicedImage", 
        Image = "component_assets/square_7_stroke_3", 
        SliceCenter = Rect.new(3.5, 3.5, 3.5, 3.5), 
        InsetAdjustment = 2, 
        Padding = 50
    }, 
    [v6.SelectedKnob] = {
        Tag = "FixedSizeImage", 
        Image = "component_assets/circle_42_stroke_3", 
        Size = 42
    }, 
    [v6.UnselectedKnob] = {
        Tag = "FixedSizeImage", 
        Image = "component_assets/circle_52_stroke_3", 
        Size = 52
    }, 
    [v6.InputButton] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 11), 
        Offset = 11, 
        BorderWidth = 3
    }, 
    [v6.RoundedRect] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 8), 
        Offset = 9, 
        BorderWidth = 3
    }, 
    [v6.RoundedRectNoInset] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 8), 
        Offset = 9, 
        BorderWidth = 3
    }, 
    [v6.RoundedSlot] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 7), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v6.SkinToneCircle] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0.5, 0), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v6.SmallPill] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 15), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v6.LargePill] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 26), 
        Offset = 0, 
        BorderWidth = 3
    }, 
    [v6.Square] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 0), 
        Offset = 2, 
        BorderWidth = 3
    }, 
    [v6.Toggle] = {
        Tag = "RoundedImage", 
        CornerRadius = UDim.new(0, 13), 
        Offset = 0, 
        BorderWidth = 3
    }
};
return (v2.forwardRef(function(v8, v9) --[[ Line: 132 ]]
    -- upvalues: v6 (copy), v2 (copy), v7 (copy), v3 (copy), v5 (copy), v4 (copy)
    if v8.cursorType == v6.NavHighlight then
        return v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, -3), 
            Size = UDim2.new(1, 0, 0, 3), 
            BorderSizePixel = 1, 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BorderColor3 = Color3.new(1, 1, 1), 
            ref = v9
        });
    elseif v8.cursorType == v6.Invisible then
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ref = v9
        });
    else
        local v10 = v7[v8.cursorType];
        if v10.Tag == "FixedSizeImage" then
            local v11 = UDim2.fromOffset(v10.Size, v10.Size);
            return v2.createElement(v3, {
                Image = v10.Image, 
                imageStyle = {
                    Color3 = Color3.new(1, 1, 1)
                }, 
                Size = v11, 
                ref = v9
            }, {
                AnimatedGradient = if v8.isVisible then v2.createElement(v5) else nil
            });
        elseif v10.Tag == "SlicedImage" then
            local l_InsetAdjustment_0 = v10.InsetAdjustment;
            local v13 = UDim2.new(1, l_InsetAdjustment_0 * 2, 1, l_InsetAdjustment_0 * 2);
            local v14 = if v10.Padding then v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v10.Padding), 
                PaddingBottom = UDim.new(0, v10.Padding), 
                PaddingLeft = UDim.new(0, v10.Padding), 
                PaddingRight = UDim.new(0, v10.Padding)
            }) else nil;
            return v2.createElement(v3, {
                Image = v10.Image, 
                imageStyle = {
                    Color3 = Color3.new(1, 1, 1)
                }, 
                slice = {
                    center = v10.SliceCenter
                }, 
                Size = v13, 
                Position = UDim2.fromOffset(-l_InsetAdjustment_0, -l_InsetAdjustment_0), 
                ref = v9
            }, {
                Padding = v14, 
                AnimatedGradient = if v8.isVisible then v2.createElement(v5) else nil
            });
        elseif v10.Tag == "RoundedImage" then
            return v2.createElement(v4, {
                isVisible = v8.isVisible, 
                cornerRadius = v10.CornerRadius, 
                offset = v10.Offset - v10.BorderWidth, 
                borderWidth = v10.BorderWidth, 
                ref = v9
            });
        else
            return nil;
        end;
    end;
end));