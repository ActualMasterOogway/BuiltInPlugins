local Framework = script:FindFirstAncestor("UI").Parent

local getFFlagDevFrameworkShimmerImprovements = require(Framework.SharedFlags.getFFlagDevFrameworkShimmerImprovements)

local StyleKey = require(Framework.Style.StyleKey)

if getFFlagDevFrameworkShimmerImprovements() then
	return {
		BackgroundColor = Color3.new(1, 1, 1),
		ColorStart = StyleKey.ShimmerStart,
		ColorMiddle = StyleKey.ShimmerMiddle,
		ColorEnd = StyleKey.ShimmerEnd,
		OffsetStart = Vector2.new(-2, 0),
		OffsetEnd = Vector2.new(2, 0),
		Rotation = 46,
		TweenInfo = {
			Time = 1,
			EasingStyle = Enum.EasingStyle.Circular,
			EasingDirection = Enum.EasingDirection.Out,
		},
		DelayTime = 2.2,
	}
else
	return {
		CornerRadius = UDim.new(0.03, 0),
		ColorStart = StyleKey.ShimmerStart,
		ColorEnd = StyleKey.ShimmerEnd,
		TransitionPeriod = 2,
	}
end
