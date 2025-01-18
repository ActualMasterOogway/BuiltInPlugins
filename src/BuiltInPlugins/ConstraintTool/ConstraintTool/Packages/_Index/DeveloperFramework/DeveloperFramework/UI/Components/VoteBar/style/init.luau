local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.RoundBox);
local v2 = require(l_Parent_0.UI.Components.Image);
local v3 = require(l_Parent_0.Util);
local v4 = require(l_Parent_0.Parent.Cryo);
local l_deepCopy_0 = v3.deepCopy;
local v6 = require(l_Parent_0.Util.StyleModifier);
local v7 = require(l_Parent_0.Style.StyleKey);
local v8 = require(l_Parent_0.UI.Components.UIFolderData);
local v9 = require(v8.RoundBox.style);
local v10 = require(v8.Votes.style);
local v11 = l_deepCopy_0(v9);
local v12 = l_deepCopy_0(v10);
local function v17(_, v14, v15) --[[ Line: 20 ]] --[[ Name: buttonStyle ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy), v11 (copy), v7 (copy), v6 (copy)
    local v16 = {
        Size = UDim2.fromOffset(28, 28), 
        Foreground = v2, 
        ThumbStyle = {
            Size = UDim2.new(0, 12, 0, 15), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Rotation = v15, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/DeveloperFramework/Votes/rating_up_white.png"
        }, 
        Background = v1, 
        BackgroundStyle = v4.Dictionary.join(v11, {
            Color = v7.ButtonDisabled
        }), 
        [v6.Selected] = {
            BackgroundStyle = v4.Dictionary.join(v11, {
                Color = v14
            })
        }
    };
    return v4.Dictionary.join(v16, {
        CanVote = v4.Dictionary.join(v16, {
            BackgroundStyle = v4.Dictionary.join(v11, {
                Color = v7.ImageButtonBackground
            }), 
            [v6.Hover] = {
                BackgroundStyle = v4.Dictionary.join(v11, {
                    Color = v7.ImageButtonHover
                })
            }
        })
    });
end;
return {
    Background = v1, 
    BackgroundStyle = v4.Dictionary.join(v11, {
        Color = v7.SubBackground, 
        BorderTransparency = 1
    }), 
    Padding = {
        Top = 0, 
        Right = 10, 
        Left = 10, 
        Bottom = 0
    }, 
    Size = UDim2.new(1, 0, 0, 36), 
    Buttons = {
        VoteUp = v17("rbxasset://textures/DeveloperFramework/Votes/rating_up_white.png", v7.SuccessMain, 0), 
        VoteDown = v17("rbxasset://textures/DeveloperFramework/Votes/rating_up_white.png", v7.ErrorMain, 180)
    }, 
    VoteCount = {
        Font = Enum.Font.SourceSans, 
        TextColor = v7.MainText, 
        TextSize = 14
    }, 
    Votes = v4.Dictionary.join(v12, {
        Text = v4.Dictionary.join(v12.Text, {
            TextSize = 18
        })
    })
};