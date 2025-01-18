local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.Util);
local v3 = require(l_Parent_0.Util.StyleModifier);
local l_deepCopy_0 = v2.deepCopy;
local v5 = require(l_Parent_0.UI.Components.UIFolderData);
local v6 = require(v5.Pane.style);
local v7 = require(l_Parent_0.UI.Components.Image);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v9 = l_deepCopy_0(v6);
local v10 = v9["&Box"];
local v11 = v9["&RoundBox"];
local v12 = v9["&BorderBox"];
local v13 = {
    BackgroundColor = v1.InputFieldBackground, 
    BorderColor = v1.InputFieldBorder, 
    BottomText = {
        Font = Enum.Font.SourceSans, 
        TextColor = v1.DimmedText, 
        TextSize = 18, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        [v3.Error] = {
            TextColor = v1.ErrorText
        }
    }, 
    BottomTextSpacing = 6, 
    HorizontalComponentSpacing = 8, 
    VerticalComponentSpacing = 4, 
    Padding = {
        Left = 8, 
        Top = 1, 
        Right = 8, 
        Bottom = 1
    }, 
    PlaceholderTextColor = v1.DimmedText, 
    Size = UDim2.new(1, 0, 0, 32), 
    TextXAlignment = Enum.TextXAlignment.Left, 
    [v3.Disabled] = {
        BackgroundColor = v1.InputFieldBackgroundDisabled, 
        BorderColor = v1.InputFieldBorderDisabled, 
        TextColor = v1.DimmedText
    }
};
local v14 = l_join_0(v12, {
    Padding = {
        Left = 8, 
        Top = 1, 
        Right = 8, 
        Bottom = 1
    }, 
    MultiLinePadding = {
        Left = 8, 
        Top = 5, 
        Right = 8, 
        Bottom = 5
    }, 
    [v3.Hover] = {
        BorderColor = v1.InputFieldBorderHover
    }, 
    [v3.Selected] = {
        BorderColor = v1.InputFieldBorderSelected
    }, 
    [v3.Error] = {
        BorderColor = v1.ErrorText
    }, 
    ErrorBorderColor = v1.ErrorText
});
local v15 = {
    TextColor = v1.ErrorText, 
    TrailingComponent = v7, 
    TrailingComponentProps = {
        Size = UDim2.fromOffset(13, 13), 
        Style = {
            Color = v1.ErrorText, 
            Image = "rbxasset://textures/DeveloperFramework/StudioTheme/clear.png"
        }
    }
};
return l_join_0(v13, {
    ["&Box"] = v10, 
    ["&BorderBox"] = v14, 
    ["&PropertyCellError"] = v15, 
    ["&RoundBox"] = v11
});