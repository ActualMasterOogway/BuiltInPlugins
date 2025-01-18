local Framework = script:FindFirstAncestor("UI").Parent
local rule = require(Framework.Styling.createStyleRule)

return rule(".Component-TreeTable", {}, {
	rule(">> .Component-TreeTableCell", {}, {
		rule("> .Left ::UIPadding", {
			PaddingTop = UDim.new(0, 1),
			PaddingBottom = UDim.new(0, 1),
			PaddingLeft = UDim.new(0, 5),
			PaddingRight = UDim.new(0, 5),
		}),
		rule(">> .Arrow", {
			BackgroundTransparency = 1,
			Image = "$ArrowRightImage",
			Size = UDim2.fromOffset(16, 16),
		}, {
			rule(".Invisible", {
				ImageTransparency = 1,
			}),
		}),
	}),
	rule(".modern", {}, {
		rule(">> .Component-TableHeaderBorder", {
			BackgroundColor3 = "$TableHeaderBorder",
			BackgroundTransparency = "$TableHeaderBorderTransparency",
		}),
		rule(">> .Component-TreeTableCell", { BackgroundTransparency = 1 }, {
			rule(">> .Component-TreeTableCellText", { TextTruncate = Enum.TextTruncate.AtEnd }),
		}),
		rule(">> .Component-TreeTableCell.Secondary", {
			BackgroundColor3 = "$TableRowEmphasisBackground",
			BackgroundTransparency = "$TableRowEmphasisBackgroundTransparency",
		}),
		rule(">> .Component-TableRow:hover >> .Component-TreeTableCell", {
			BackgroundColor3 = "$TableRowHoverBackground",
			BackgroundTransparency = "$TableRowHoverBackgroundTransparency",
		}),
	}),
}, {
	ArrowSize = 16,
	CellPadding = 5,
	Indent = 20,
})
