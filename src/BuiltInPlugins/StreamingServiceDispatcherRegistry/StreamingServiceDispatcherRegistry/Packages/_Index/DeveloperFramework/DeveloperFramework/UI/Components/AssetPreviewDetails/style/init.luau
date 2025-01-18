local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util);
local v2 = require(l_Parent_0.Parent.Cryo);
local l_deepCopy_0 = v1.deepCopy;
local v4 = require(l_Parent_0.Style.StyleKey);
local v5 = require(l_Parent_0.UI.Components.UIFolderData);
local v6 = l_deepCopy_0((require(v5.Votes.style)));
return {
    BackgroundColor = v4.SubBackground, 
    LeftWidthScale = 0.6, 
    MinBreakpointWidth = 200, 
    Padding = 15, 
    Size = UDim2.new(1, 0, 0, 36), 
    VoteSpacingHorizontal = 10, 
    VoteSpacingVertical = 3, 
    InfoRow = {
        DescriptionText = {
            Font = Enum.Font.SourceSans, 
            TextColor = v4.TextSecondary, 
            TextSize = 14
        }, 
        DescriptionSpacing = 2, 
        ElementPadding = 4, 
        TitleText = {
            Font = Enum.Font.SourceSans, 
            TextColor = v4.BrightText, 
            TextSize = 18, 
            TextXAlignment = Enum.TextXAlignment.Left
        }
    }, 
    AssetHeader = {
        Spacing = 5, 
        VoteSpacing = 4
    }, 
    PackageIcon = {
        Image = "rbxasset://textures/DeveloperFramework/AssetPreview/package.png", 
        Color = v4.Icon, 
        Size = UDim2.fromOffset(12, 12)
    }, 
    ScriptArea = {
        ScriptIcon = {
            Image = "rbxasset://textures/StudioToolbox/script.png", 
            Size = UDim2.fromOffset(12, 12)
        }, 
        ScriptInfoIcon = {
            Image = "rbxasset://textures/StudioToolbox/AssetPreview/info.png", 
            Size = UDim2.fromOffset(12, 12)
        }
    }, 
    VoteCount = {
        Font = Enum.Font.SourceSans, 
        TextColor = v4.MainText, 
        TextSize = 14
    }, 
    Votes = v2.Dictionary.join(v6, {
        Text = v2.Dictionary.join(v6.Text, {
            TextSize = 18
        })
    })
};