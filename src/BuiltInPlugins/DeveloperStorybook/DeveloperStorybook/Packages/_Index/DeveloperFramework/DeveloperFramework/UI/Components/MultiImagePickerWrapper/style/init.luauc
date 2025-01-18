local Framework = script:FindFirstAncestor("UI").Parent
local StyleKey = require(Framework.Style.StyleKey)

local getFFlagDevFrameworkAvoidSpawnInCreatePluginWidget =
	require(Framework.SharedFlags.getFFlagDevFrameworkAvoidSpawnInCreatePluginWidget)

-- TODO https://jira.rbx.com/browse/STM-2651: Add these styles to MultiImagePicker when the wrapper and this component are combined
return {
	FontStyle = {
		SemiBold = {
			Font = Enum.Font.SourceSansSemibold,
			TextSize = 22,

			TextColor = if getFFlagDevFrameworkAvoidSpawnInCreatePluginWidget() then StyleKey.MainText else nil,
			TextColor3 = if getFFlagDevFrameworkAvoidSpawnInCreatePluginWidget() then nil else StyleKey.MainText,
		},
	},

	ImageTypes = { "jpg", "jpeg", "png" },
}
