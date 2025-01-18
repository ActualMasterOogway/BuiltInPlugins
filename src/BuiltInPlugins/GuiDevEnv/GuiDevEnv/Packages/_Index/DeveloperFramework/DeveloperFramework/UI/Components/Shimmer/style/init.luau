local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkShimmerImprovements);
local v2 = require(l_Parent_0.Style.StyleKey);
if v1() then
    return {
        BackgroundColor = Color3.new(1, 1, 1), 
        ColorStart = v2.ShimmerStart, 
        ColorMiddle = v2.ShimmerMiddle, 
        ColorEnd = v2.ShimmerEnd, 
        OffsetStart = Vector2.new(-2, 0), 
        OffsetEnd = Vector2.new(2, 0), 
        Rotation = 46, 
        TweenInfo = {
            Time = 1, 
            EasingStyle = Enum.EasingStyle.Circular, 
            EasingDirection = Enum.EasingDirection.Out
        }, 
        DelayTime = 2.2
    };
else
    return {
        CornerRadius = UDim.new(0.03, 0), 
        ColorStart = v2.ShimmerStart, 
        ColorEnd = v2.ShimmerEnd, 
        TransitionPeriod = 2
    };
end;