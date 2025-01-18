local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_deepCopy_0 = require(l_Parent_0.Util).deepCopy;
local v2 = require(l_Parent_0.Style.StyleKey);
local v3 = require(l_Parent_0.UI.Components.UIFolderData);
local v4 = require(v3.TreeView.style);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v6 = l_deepCopy_0(v4);
local v7 = v6["&BorderBox"];
return l_join_0(v6, {
    Text = {
        Font = Enum.Font.SourceSans, 
        TextColor = v2.MainText, 
        TextSize = 18
    }, 
    Indent = 20, 
    RowHeight = 24, 
    Arrow = {
        Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
        Size = 12, 
        ExpandedOffset = Vector2.new(24, 0), 
        CollapsedOffset = Vector2.new(12, 0), 
        Color = v2.MainText
    }, 
    IconPadding = 5, 
    HoverColor = v2.ButtonHover, 
    SelectedColor = v2.DialogMainButton, 
    SelectedTextColor = v2.DialogMainButtonText, 
    ["&Compact"] = l_join_0(v7, {
        Text = {
            Font = Enum.Font.SourceSans, 
            TextColor = v2.MainText, 
            TextSize = 16
        }, 
        IconPadding = 3, 
        RowHeight = 20, 
        Indent = 16
    })
});