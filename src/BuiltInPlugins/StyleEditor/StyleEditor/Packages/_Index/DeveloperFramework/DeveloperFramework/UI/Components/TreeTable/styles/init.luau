local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
return v1(".Component-TreeTable", {}, {
    v1(">> .Component-TreeTableCell", {}, {
        v1("> .Left ::UIPadding", {
            PaddingTop = UDim.new(0, 1), 
            PaddingBottom = UDim.new(0, 1), 
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5)
        }), 
        v1(">> .Arrow", {
            BackgroundTransparency = 1, 
            Image = "$ArrowRightImage", 
            Size = UDim2.fromOffset(16, 16)
        }, {
            v1(".Invisible", {
                ImageTransparency = 1
            })
        })
    }), 
    v1(".modern", {}, {
        v1(">> .Component-TableHeaderBorder", {
            BackgroundColor3 = "$TableHeaderBorder", 
            BackgroundTransparency = "$TableHeaderBorderTransparency"
        }), 
        v1(">> .Component-TreeTableCell", {
            BackgroundTransparency = 1
        }, {
            v1(">> .Component-TreeTableCellText", {
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        }), 
        v1(">> .Component-TreeTableCell.Secondary", {
            BackgroundColor3 = "$TableRowEmphasisBackground", 
            BackgroundTransparency = "$TableRowEmphasisBackgroundTransparency"
        }), 
        v1(">> .Component-TableRow:hover >> .Component-TreeTableCell", {
            BackgroundColor3 = "$TableRowHoverBackground", 
            BackgroundTransparency = "$TableRowHoverBackgroundTransparency"
        })
    })
}, {
    ArrowSize = 16, 
    CellPadding = 5, 
    Indent = 20
});