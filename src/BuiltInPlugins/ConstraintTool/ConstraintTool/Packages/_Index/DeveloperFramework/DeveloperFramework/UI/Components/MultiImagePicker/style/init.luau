local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.Colors);
local v2 = require(l_Parent_0.Style.StyleKey);
return {
    Colors = {
        Black = v1.Black, 
        Blue = v1.Blue, 
        Error = Color3.new(1, 0.266, 0.266), 
        White = v1.White
    }, 
    DottedBorder = {
        Image = "rbxasset://textures/GameSettings/DottedBorder.png", 
        SliceCenter = Rect.new(2, 2, 265, 148)
    }, 
    FontStyle = {
        Normal = {
            Font = Enum.Font.SourceSans, 
            TextSize = 22, 
            TextColor3 = v2.MainText
        }, 
        Smaller = {
            Font = Enum.Font.SourceSans, 
            TextSize = 20, 
            TextColor3 = v2.MainText
        }
    }, 
    Hyperlink = v2.LinkText, 
    Thumbnail = {
        Background = v2.SubBackground2, 
        Count = v2.DimmedText, 
        DefaultMaxCount = 10, 
        DefaultSize = UDim2.new(0, 267, 0, 150)
    }, 
    ModeratedImage = "rbxasset://textures/GameSettings/ModeratedAsset.jpg", 
    VideoPlaceholder = "rbxasset://textures/GameSettings/placeholder.png", 
    DeleteThumbnailDialog = {
        MinContentHeight = 1000, 
        MinContentWidth = 300
    }, 
    DragDestination = {
        Background = v2.SubBackground, 
        Border = v2.CurrentMarkerSelected
    }, 
    HoverBarButton = {
        RoundedBackgroundImage = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
        RoundedFrameSlice = Rect.new(3, 3, 13, 13)
    }, 
    NewThumbnail = {
        Background = v2.SubBackground, 
        Border = v2.SubBackground2, 
        PlusColor = v2.MainText, 
        Plus = {
            Image = "rbxasset://textures/GameSettings/CenterPlus.png", 
            RectOffset = Vector2.new(121, 63), 
            RectSize = Vector2.new(24, 24)
        }
    }, 
    PreviewThumbnailDialog = {
        AltTextInputHeight = 50, 
        ButtonPadding = UDim.new(0, 20), 
        Height = 380, 
        ImagePadding = 10, 
        MaxAltTextLength = 1000, 
        Size = UDim2.new(0, 534, 0, 300), 
        TooltipIcon = {
            PaddingX = 5, 
            Size = 14, 
            Image = "rbxasset://textures/GameSettings/MoreDetails.png", 
            Color = v2.SubText, 
            HoverColor = v2.MainTextHover
        }
    }, 
    RoundArrowButton = {
        ButtonImage = "rbxasset://textures/GameSettings/RoundArrowButton.png", 
        ButtonSize = UDim2.new(0, 48, 0, 48)
    }, 
    ThumbnailHoverBar = {
        Padding = UDim.new(0, 6), 
        ZoomImage = "rbxasset://textures/GameSettings/zoom.png", 
        DeleteImage = "rbxasset://textures/GameSettings/delete.png"
    }, 
    ThumbnailSet = {
        Padding = UDim2.new(0, 30, 0, 30)
    }
};