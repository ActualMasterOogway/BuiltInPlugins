local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    Size = UDim2.new(1, 0, 0, 15), 
    Text = {
        Font = Enum.Font.SourceSans, 
        TextColor = v1.MainText, 
        TextSize = 18
    }, 
    VoteCount = {
        Font = Enum.Font.SourceSans, 
        TextColor = v1.SubText, 
        TextSize = 14
    }, 
    GoodRatingColor = v1.TextSuccess, 
    OkayRatingColor = v1.TextWarning, 
    PoorRatingColor = v1.TextError, 
    ThumbUp = {
        Colors = {
            Gray = v1.SecondaryContrast, 
            Green = v1.SuccessMain, 
            Red = v1.ErrorMain, 
            Yellow = v1.WarningMain
        }, 
        Icon = "rbxasset://textures/DeveloperFramework/Votes/rating_up_white.png"
    }, 
    Icon = {
        Image = "rbxasset://textures/DeveloperFramework/Votes/rating_small.png", 
        Size = UDim2.fromOffset(12, 15), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundTransparency = 1
    }
};