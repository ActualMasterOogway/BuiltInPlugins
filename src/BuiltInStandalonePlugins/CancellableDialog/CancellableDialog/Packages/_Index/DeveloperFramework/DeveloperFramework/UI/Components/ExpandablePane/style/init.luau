local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_Style_0 = l_Parent_0.Style;
local v2 = require(l_Style_0.StyleKey);
local v3 = require(l_Parent_0.Util);
local v4 = require(l_Parent_0.Util.StyleModifier);
local l_deepCopy_0 = v3.deepCopy;
local v6 = require(l_Parent_0.UI.Components.UIFolderData);
local v7 = require(v6.Pane.style);
local v8 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkExpandablePaneAddTitle);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v10 = l_deepCopy_0(v7);
local v11 = v10["&Box"];
local v12 = v10["&RoundBox"];
local v13 = v10["&BorderBox"];
local v14 = {
    Content = {
        Padding = {
            Left = 18, 
            Top = 10, 
            Right = 18, 
            Bottom = 10
        }, 
        Spacing = 10
    }, 
    Header = {
        Arrow = {
            Color = v2.MainText, 
            Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
            ImageRectOffset = Vector2.new(12, 0), 
            ImageRectSize = Vector2.new(12, 12), 
            Size = UDim2.fromOffset(12, 12), 
            [v4.Selected] = {
                ImageRectOffset = Vector2.new(24, 0)
            }
        }, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Padding = {
            Left = 10, 
            Right = 10
        }, 
        Size = UDim2.new(1, 0, 0, 32), 
        Spacing = 6, 
        Text = {
            Font = Enum.Font.SourceSansBold, 
            TextColor = v2.TitlebarText, 
            TextSize = 18
        }, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }
};
return l_join_0(v14, {
    ["&Box"] = v11, 
    ["&BorderBox"] = v13, 
    ["&RoundBox"] = v12, 
    ["&Section"] = l_join_0(v11, {
        Header = l_join_0(v14.Header, {
            Background = v2.Titlebar
        })
    }), 
    ["&Title"] = if v8() then l_join_0(v11, {
        Header = l_join_0(v14.Header, {
            Background = v2.Titlebar, 
            Text = {
                Font = Enum.Font.SourceSansBold, 
                TextColor = v2.TitlebarText, 
                TextSize = 32
            }
        })
    }) else nil
});