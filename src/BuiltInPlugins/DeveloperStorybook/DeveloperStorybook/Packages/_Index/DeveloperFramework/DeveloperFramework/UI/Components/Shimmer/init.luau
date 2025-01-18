--[[
	A component that animates a gradient from left to right. Multiple shimmers
	can be combined to create a placeholder for loading content.

	Optional Props:
		Vector2 AnchorPoint: The anchor point of the component.
		Color3 BackgroundColor: The background color of the component.
		number LayoutOrder: The LayoutOrder of the component
		UDim2 Position: The position of the component.
		UDim2 Size: The size of the component.
		Stylizer Stylizer: The Stylizer context item

	Style Values:
		Color3 BackgroundColor: The background color of the component.
		Color3 ColorStart: The gradient start color.
		Color3 ColorMiddle: The gradient mid-point color.
		Color3 ColorEnd: The gradient end color.
		Vector2 OffsetStart: The gradient starting offset.
		Vector2 OffsetEnd: The gradient ending offset.
]]

local TweenService = game:GetService("TweenService")

local Framework = script:FindFirstAncestor("UI").Parent
local Roact = require(Framework.Parent.Roact)

local getFFlagDevFrameworkShimmerImprovements = require(Framework.SharedFlags.getFFlagDevFrameworkShimmerImprovements)

local ContextServices = require(Framework.UI.ContextServices)
local withContext = ContextServices.withContext

local Typecheck = require(Framework.Util.Typecheck)

local UI = Framework.UI
local Pane = require(UI.Components.Pane)
local prioritize = require(Framework.Util.prioritize)

local Shimmer = Roact.PureComponent:extend("Shimmer")
Typecheck.wrap(Shimmer, script)

function Shimmer:init()
	if getFFlagDevFrameworkShimmerImprovements() then
		self.gradientRef = Roact.createRef()
	else
		self.clockBinding, self.updateClockBinding = Roact.createBinding(os.clock())
	end
end

function Shimmer:didMount()
	if getFFlagDevFrameworkShimmerImprovements() then
		local props = self.props
		local style = props.Stylizer

		local gradient = self.gradientRef.current

		local tweenInfo =
			TweenInfo.new(style.TweenInfo.Time, style.TweenInfo.EasingStyle, style.TweenInfo.EasingDirection)

		local tween = TweenService:Create(gradient, tweenInfo, {
			Offset = style.OffsetEnd,
		})

		self.animateTask = task.defer(function()
			local delayTime = style.DelayTime
			while true do
				gradient.Offset = style.OffsetStart
				tween:Play()
				tween.Completed:Wait()
				gradient.Offset = style.OffsetStart
				tween:Play()
				tween.Completed:Wait()
				task.wait(delayTime)
			end
		end)
	else
		self.clockTask = task.spawn(function()
			while true do
				self.updateClockBinding(os.clock())
				task.wait()
			end
		end)
	end
end

function Shimmer:willUnmount()
	if getFFlagDevFrameworkShimmerImprovements() then
		task.cancel(self.animateTask)
	else
		task.cancel(self.clockTask)
	end
end

function Shimmer:render()
	local props = self.props
	local style = props.Stylizer

	if getFFlagDevFrameworkShimmerImprovements() then
		local backgroundColor = prioritize(props.BackgroundColor, style.BackgroundColor)
		local cornerRadius = prioritize(props.CornerRadius, style.CornerRadius)
		if typeof(cornerRadius) == "number" then
			cornerRadius = UDim.new(0, cornerRadius)
		end
		local size = props.Size or UDim2.fromScale(1, 1)

		return Roact.createElement(Pane, {
			AnchorPoint = props.AnchorPoint,
			BackgroundColor = backgroundColor,
			LayoutOrder = props.LayoutOrder,
			Position = props.Position,
			Size = size,
		}, {
			UIGradient = Roact.createElement("UIGradient", {
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, style.ColorStart),
					ColorSequenceKeypoint.new(0.5, style.ColorMiddle),
					ColorSequenceKeypoint.new(1, style.ColorEnd),
				}),
				Offset = style.OffsetStart,
				Rotation = style.Rotation,
				[Roact.Ref] = self.gradientRef,
			}),
			UICorner = if cornerRadius
				then Roact.createElement("UICorner", {
					CornerRadius = cornerRadius,
				})
				else nil,
		}, props[Roact.Children])
	else
		return Roact.createElement(Pane, {
			BackgroundColor = self.clockBinding:map(function(clock)
				return style.ColorStart:Lerp(
					style.ColorEnd,
					(math.sin(math.pi * 2 * (1 / style.TransitionPeriod) * clock) + 1) / 2
				)
			end),
			LayoutOrder = props.LayoutOrder,
			Size = props.Size,
			Style = {
				CornerRadius = style.CornerRadius,
			},
		})
	end
end

Shimmer = withContext({
	Stylizer = ContextServices.Stylizer,
})(Shimmer)

return Shimmer
