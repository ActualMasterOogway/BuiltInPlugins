local Foundation = script:FindFirstAncestor("Foundation")
local Packages = Foundation.Parent
local React = require(Packages.React)
local Dash = require(Packages.Dash)

local IconButton = require(Foundation.Components.IconButton)
local IconSize = require(Foundation.Enums.IconSize)
type IconSize = IconSize.IconSize

local function Story(props)
	local controls = props.controls

	return React.createElement(IconButton, {
		isDisabled = false,
		onActivated = function() end,
		size = controls.size,
		icon = controls.name,
	})
end

local iconSizes = { IconSize.Medium, IconSize.Small, IconSize.Large, IconSize.XLarge, IconSize.XXLarge } :: { IconSize }

return {
	summary = "Icon component for displaying icons",
	stories = Dash.map(iconSizes, function(size: IconSize)
		return {
			name = size,
			story = function(props)
				return Story({
					controls = {
						size = size,
						name = props.controls.name,
					},
				})
			end,
		}
	end),
	controls = {
		name = {
			"icons/common/notificationOff",
			"icons/common/robux",
			"icons/common/search_small",
			"icons/controls/voice/microphone_off_light",
			"icons/controls/voice/video_on_light",
		},
	},
}
