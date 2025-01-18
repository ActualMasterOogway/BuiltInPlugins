local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_SharedFlags_0 = v1.SharedFlags;
local v4 = l_SharedFlags_0.getFFlagDevFrameworkTreeTableCellPadding();
local l_getFFlagDevFrameworkFixTreeTableHoverScroll_0 = l_SharedFlags_0.getFFlagDevFrameworkFixTreeTableHoverScroll;
return l_createStyleRule_0(".Component-TreeTable", {}, {
    l_createStyleRule_0(">> .Component-CellComponent", {}, {
        l_createStyleRule_0("> .Left ::UIPadding", if v4 then {
            PaddingTop = UDim.new(0, 1), 
            PaddingBottom = UDim.new(0, 1), 
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5)
        } else {
            Padding = {
                Top = 1, 
                Bottom = 1, 
                Left = 5, 
                Right = 5
            }
        }), 
        l_createStyleRule_0(">> .Arrow", if l_getFFlagDevFrameworkFixTreeTableHoverScroll_0() then {
            BackgroundTransparency = 1, 
            Image = "$ArrowRightImage", 
            Size = UDim2.fromOffset(16, 16)
        } else {
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
            ImageColor3 = "$TextPrimary", 
            ImageRectSize = Vector2.new(12, 12), 
            ImageRectOffset = Vector2.new(12, 0), 
            Size = UDim2.fromOffset(12, 12)
        }, {
            if v4 then l_createStyleRule_0(".Invisible", {
                ImageTransparency = 1
            }) else nil
        })
    })
}, {
    ArrowSize = l_getFFlagDevFrameworkFixTreeTableHoverScroll_0() and 16 or 12, 
    CellPadding = 5, 
    Indent = 20
});