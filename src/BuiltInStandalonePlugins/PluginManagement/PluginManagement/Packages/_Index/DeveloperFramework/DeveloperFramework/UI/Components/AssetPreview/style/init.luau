local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.UI.Components.Image);
local v3 = require(l_Parent_0.UI.Components.Box);
local v4 = require(l_Parent_0.Util.deepCopy);
local v5 = require(l_Parent_0.Parent.Cryo);
local v6 = require(l_Parent_0.UI.Components.UIFolderData);
local v7 = require(v6.RoundBox.style);
local v8 = require(v6.DEPRECATED_Button.style);
local v9 = v4(v7);
local v10 = v4(v8);
return {
    BackgroundColor = v1.MainBackground, 
    BackgroundStyle = v9, 
    CloseButton = {
        Position = UDim2.new(1, 0, 0, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        Image = "rbxasset://textures/DeveloperFramework/AssetPreview/close_button.png", 
        Size = UDim2.fromOffset(28, 28)
    }, 
    ScrollingFrame = {
        ElementPadding = 10, 
        Padding = {
            PaddingTop = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 25), 
            PaddingLeft = UDim.new(0, 15)
        }, 
        AssetHeader = {
            Spacing = 5, 
            VoteSpacing = 4
        }, 
        AssetName = {
            Font = Enum.Font.SourceSansBold, 
            TextColor = v1.MainText, 
            TextSize = 24, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, 
        AssetDescription = {
            Font = Enum.Font.SourceSans, 
            TextColor = v1.MainText, 
            TextSize = 18, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, 
        CreatorName = {
            Font = Enum.Font.SourceSans, 
            TextColor = v1.MainText, 
            TextSize = 18, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, 
        FlagAsset = {
            Image = "rbxasset://textures/DeveloperFramework/AssetPreview/flag_rounded.png", 
            ImageColor3 = v1.Icon, 
            Size = UDim2.fromOffset(24, 24)
        }, 
        InfoRow = {
            CodeSummary = {
                BackgroundColor = v1.BackgroundPaper, 
                Padding = 12, 
                DisclaimerText = {
                    Font = Enum.Font.SourceSans, 
                    TextColor = v1.DimmedText, 
                    TextSize = 16, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }
            }, 
            Text = {
                Font = Enum.Font.SourceSans, 
                TextColor = v1.MainText, 
                TextSize = 18
            }, 
            LeftText = {
                Font = Enum.Font.SourceSans, 
                TextColor = v1.MainText, 
                TextSize = 18, 
                TextTransparency = 0.5, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, 
            RightText = {
                Font = Enum.Font.SourceSans, 
                TextColor = v1.MainText, 
                TextSize = 18, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Right
            }
        }, 
        SuggestionsSection = {
            Padding = {
                Top = 5, 
                Bottom = 20
            }
        }
    }, 
    AssetRenderMargin = {
        Top = 0, 
        Right = -10, 
        Bottom = 0, 
        Left = -15
    }, 
    ButtonArea = {
        ActionButtonHeight = 30, 
        ElementPadding = UDim.new(0, 10), 
        Padding = {
            PaddingTop = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 15), 
            PaddingLeft = UDim.new(0, 12)
        }, 
        Size = UDim2.new(1, 0, 0, 52), 
        Context = {
            Size = UDim2.fromOffset(28, 28), 
            Background = v3, 
            BackgroundStyle = {
                Color = v1.ImageButtonBackground, 
                Transparency = 0
            }, 
            Foreground = v2, 
            ForegroundStyle = {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/DeveloperFramework/AssetPreview/more.png", 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0.6, 0, 0.6, 0), 
                ScaleType = Enum.ScaleType.Stretch
            }
        }, 
        Action = "RoundPrimary", 
        ActionBuy = v5.Dictionary.join(v10["&RoundPrimary"], {
            Foreground = v2, 
            ForegroundStyle = {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/ui/common/robux_small.png", 
                Position = UDim2.new(0.05, 0, 0.5, 0), 
                Size = UDim2.new(0, 16, 0.6, 0), 
                ScaleType = Enum.ScaleType.Fit
            }, 
            TextSize = 18
        }), 
        ActionSubText = {
            SpacingTop = 4, 
            TextSize = 14, 
            TextColor = v1.ErrorText
        }
    }
};