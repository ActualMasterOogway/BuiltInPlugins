local Framework = script:FindFirstAncestor("UI").Parent
local SharedFlags = Framework.SharedFlags
local rule = require(Framework.Styling.createStyleRule)
local FFlagDevFrameworkCheckboxGoodAlignment = SharedFlags.getFFlagDevFrameworkCheckboxGoodAlignment

return rule(".Component-Checkbox", {}, {
	rule(">> ImageLabel", {
		Image = "$CheckboxUncheckedImage",
	}),
	rule(".Checked >> ImageLabel", {
		Image = "$CheckboxCheckedImage",
	}),
	rule(".Indeterminate >> ImageLabel", {
		Image = "$CheckboxIndeterminateImage",
	}),
	rule(".Disabled >> ImageLabel", {
		Image = "$CheckboxDisabledImage",
	}),
	if FFlagDevFrameworkCheckboxGoodAlignment
		then rule(">> TextLabel :: UIPadding", {
			PaddingTop = UDim.new(0, -2),
		})
		else nil,
})
