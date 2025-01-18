local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Image_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Image;
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
return function(v4) --[[ Line: 32 ]] --[[ Name: Chevron ]]
    -- upvalues: v3 (copy), v1 (copy), l_Image_0 (copy)
    local v5, v6 = v3("PointingHand");
    return v1.createElement("Frame", {
        Rotation = v4.IsArrowRight and 0 or 180, 
        Size = v4.Size, 
        Position = v4.Position, 
        ZIndex = 999999, 
        [v1.Tag] = "X-Transparent"
    }, {
        UIGradientFrame = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 0.4, 
            ZIndex = 100, 
            [v1.Tag] = "StartPage-PageBackground StartPage-NoBorder"
        }, {
            UIGradient = v1.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        }), 
        Chevron = v1.createElement("ImageButton", {
            Size = UDim2.new(0, 36, 0, 36), 
            Position = UDim2.new(0.5, -18, 0.5, -18), 
            [v1.Event.Activated] = function() --[[ Line: 59 ]]
                -- upvalues: v4 (copy)
                v4.OnClick();
            end, 
            [v1.Event.MouseEnter] = v5, 
            [v1.Event.MouseLeave] = v6, 
            ZIndex = 101, 
            [v1.Tag] = "X-Middle X-Center StartPage-Circular StartPage-Contrast"
        }, {
            v1.createElement(l_Image_0, {
                [v1.Tag] = "StartPage-IconSizeM StartPage-RightIcon"
            })
        })
    });
end;