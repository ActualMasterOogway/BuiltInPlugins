local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.RoundBox);
local v2 = require(l_Parent_0.UI.Components.Image);
local v3 = require(l_Parent_0.Util);
local v4 = require(l_Parent_0.Parent.Cryo);
local v5 = require(l_Parent_0.Util.StyleModifier);
local l_deepCopy_0 = v3.deepCopy;
local v7 = require(l_Parent_0.Style.StyleKey);
local v8 = require(l_Parent_0.UI.Components.UIFolderData);
local v9 = require(v8.RoundBox.style);
local v10 = require(v8.Slider.style);
local v11 = l_deepCopy_0(v9);
local v12 = l_deepCopy_0(v10);
local function v14(v13) --[[ Line: 19 ]] --[[ Name: buttonStyle ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy), v11 (copy), v7 (copy), v5 (copy)
    return {
        Size = UDim2.fromOffset(28, 28), 
        Foreground = v2, 
        ForegroundStyle = {
            Image = v13
        }, 
        Background = v1, 
        BackgroundStyle = v4.Dictionary.join(v11, {
            Color = v7.ImageButtonBackground
        }), 
        [v5.Hover] = {
            BackgroundStyle = v4.Dictionary.join(v11, {
                Transparency = 0.5, 
                Color = v7.ImageButtonHover
            })
        }, 
        [v5.Disabled] = {
            BackgroundStyle = v4.Dictionary.join(v11, {
                Color = v7.ButtonDisabled, 
                Transparency = 0.5
            })
        }
    };
end;
return {
    Scrubber = v4.Dictionary.join(v12, {
        UpperKnobBackground = nil, 
        UpperKnobBackgroundStyle = {}, 
        Size = UDim2.new(1, v12.KnobSize.X, 0, 15)
    }), 
    Controls = {
        Size = UDim2.new(1, 0, 0, 46), 
        Padding = {
            Top = 5, 
            Left = 11, 
            Bottom = 11, 
            Right = 11
        }, 
        PauseButton = v14("rbxasset://textures/DeveloperFramework/MediaPlayerControls/pause_button.png"), 
        PlayButton = v14("rbxasset://textures/DeveloperFramework/MediaPlayerControls/play_button.png")
    }
};