local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v4 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Components.Image);
return v2.memo(v2.forwardRef(function(v8, _) --[[ Line: 17 ]] --[[ Name: CircularProgressBar ]]
    -- upvalues: v3 (copy), v2 (copy), v6 (copy), v4 (copy), v7 (copy)
    local v10 = v3();
    local v11 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, v10.Color.Content.Emphasis.Transparency), 
        NumberSequenceKeypoint.new(0.4999, v10.Color.Content.Emphasis.Transparency), 
        NumberSequenceKeypoint.new(0.5, v10.Color.Content.Muted.Transparency), 
        NumberSequenceKeypoint.new(1, v10.Color.Content.Muted.Transparency)
    });
    local v12 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, v10.Color.Content.Emphasis.Color3), 
        ColorSequenceKeypoint.new(0.4999, v10.Color.Content.Emphasis.Color3), 
        ColorSequenceKeypoint.new(0.5, v10.Color.Content.Muted.Color3), 
        ColorSequenceKeypoint.new(1, v10.Color.Content.Muted.Color3)
    });
    return v2.createElement(v6, v4(v8, {
        tag = "size-full-full"
    }), {
        LeftGradient = v2.createElement(v6, {
            Size = UDim2.fromScale(0.5, 1), 
            tag = "position-top-left clip"
        }, {
            Image = v2.createElement(v7, {
                Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                Size = UDim2.fromScale(2, 1), 
                tag = "content-emphasis position-top-left"
            }, {
                Gradient = v2.createElement("UIGradient", {
                    Transparency = v11, 
                    Color = v12, 
                    Rotation = v8.progress:map(function(v13) --[[ Line: 52 ]]
                        return (math.clamp(v13 * 360, 180, 360));
                    end)
                })
            })
        }), 
        RightGradient = v2.createElement(v6, {
            Size = UDim2.fromScale(0.5, 1), 
            tag = "clip position-top-center"
        }, {
            Image = v2.createElement(v7, {
                Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                Size = UDim2.fromScale(2, 1), 
                Position = UDim2.fromScale(-1, 0), 
                tag = "content-emphasis"
            }, {
                Gradient = v2.createElement("UIGradient", {
                    Transparency = v11, 
                    Color = v12, 
                    Rotation = v8.progress:map(function(v14) --[[ Line: 71 ]]
                        return (math.clamp(v14 * 360, 0, 180));
                    end)
                })
            })
        })
    });
end));