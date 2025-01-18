local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.RoundBox);
local v2 = require(l_Parent_0.UI.Components.Image);
local v3 = require(l_Parent_0.Util);
local v4 = require(l_Parent_0.Parent.Cryo);
local l_deepCopy_0 = v3.deepCopy;
local v6 = require(l_Parent_0.Util.StyleModifier);
local v7 = require(l_Parent_0.Style.StyleKey);
local v8 = require(l_Parent_0.UI.Components.UIFolderData);
local v9 = l_deepCopy_0((require(v8.RoundBox.style)));
local function v13(v10, v11) --[[ Line: 16 ]] --[[ Name: buttonStyle ]]
    -- upvalues: v1 (copy), v4 (copy), v9 (copy), v7 (copy), v2 (copy), v6 (copy)
    local v12 = {
        Background = v1, 
        BackgroundStyle = v4.Dictionary.join(v9, {
            Color = v7.ImageButtonBackground
        }), 
        Foreground = v2, 
        Size = UDim2.fromOffset(28, 28), 
        ThumbStyle = {
            Size = UDim2.new(0, 12, 0, 15), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Rotation = v11, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/DeveloperFramework/Votes/rating_up_white.png"
        }, 
        [v6.Disabled] = {
            BackgroundStyle = v4.Dictionary.join(v9, {
                Color = v7.ButtonDisabled
            })
        }, 
        [v6.Selected] = {
            BackgroundStyle = v4.Dictionary.join(v9, {
                Color = v10
            })
        }
    };
    return v4.Dictionary.join(v12, {
        CanVote = v4.Dictionary.join(v12, {
            [v6.Hover] = {
                BackgroundStyle = v4.Dictionary.join(v9, {
                    Color = v7.ImageButtonHover
                })
            }
        })
    });
end;
return {
    ["&UpVote"] = v13(v7.SuccessMain, 0), 
    ["&DownVote"] = v13(v7.ErrorMain, 180)
};