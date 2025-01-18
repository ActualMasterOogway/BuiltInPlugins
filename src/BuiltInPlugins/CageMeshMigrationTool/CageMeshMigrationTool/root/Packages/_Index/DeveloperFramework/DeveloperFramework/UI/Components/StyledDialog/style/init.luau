local Framework = script:FindFirstAncestor("UI").Parent

local StyleKey = require(Framework.Style.StyleKey)

local getFFlagDevFrameworkStyledDialogCancelAccept =
	require(Framework.SharedFlags.getFFlagDevFrameworkStyledDialogCancelAccept)

return {
	Background = StyleKey.MainBackground,
	Modal = false,
	Resizable = false,
	ButtonHorizontalAlignment = Enum.HorizontalAlignment.Right,
	ButtonWidth = 120,
	ButtonHeight = 32,
	ButtonPadding = {
		Top = 24,
	},
	ButtonSpacing = 24,
	ContentPadding = 24,

	["&Alert"] = {
		Buttons = {
			{ Style = "RoundPrimary" }, -- OK
		},
		Modal = true,
	},

	["&AcceptCancel"] = {
		Buttons = {
			{ Style = "RoundPrimary" }, -- OK
			{ Style = "Round" }, -- Cancel
		},
	},

	["&CancelAccept"] = if getFFlagDevFrameworkStyledDialogCancelAccept()
		then {
			Buttons = {
				{ Style = "Round" }, -- Cancel
				{ Style = "RoundPrimary" }, -- OK
			},
		}
		else nil,

	["&FullBleed"] = {
		ButtonPadding = 24,
		ContentPadding = 0,
	},

	["&LargeCenterButtons"] = {
		ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center,
		ButtonWidth = 150,
		ButtonHeight = 36,
	},
}
