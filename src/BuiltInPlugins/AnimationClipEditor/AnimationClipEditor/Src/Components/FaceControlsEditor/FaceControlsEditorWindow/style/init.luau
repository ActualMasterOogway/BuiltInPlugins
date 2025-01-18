local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Util_0 = v2.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_deepCopy_0 = l_Util_0.deepCopy;
local _ = l_UI_0.RoundBox;
local l_Image_0 = l_UI_0.Image;
local l_StyleKey_0 = v2.Style.StyleKey;
local l_style_0 = l_UI_0.UIFolderData.RoundBox.style;
local v11 = l_deepCopy_0(l_style_0);
local function v13(v12) --[[ Line: 20 ]] --[[ Name: buttonStyle ]]
    -- upvalues: l_Image_0 (copy), l_style_0 (copy), v1 (copy), v11 (copy), l_StyleKey_0 (copy), l_StyleModifier_0 (copy)
    return {
        Size = UDim2.fromOffset(28, 28), 
        Foreground = l_Image_0, 
        ForegroundStyle = {
            Image = v12
        }, 
        Background = l_style_0, 
        BackgroundStyle = v1.Dictionary.join(v11, {
            Color = l_StyleKey_0.ImageButtonBackground
        }), 
        [l_StyleModifier_0.Hover] = {
            BackgroundStyle = v1.Dictionary.join(v11, {
                Transparency = 0.5, 
                Color = l_StyleKey_0.ImageButtonHover
            })
        }, 
        [l_StyleModifier_0.Disabled] = {
            BackgroundStyle = v1.Dictionary.join(v11, {
                Color = l_StyleKey_0.ButtonDisabled, 
                Transparency = 0.5
            })
        }
    };
end;
return {
    Controls = {
        Size = UDim2.new(1, 0, 0, 46), 
        Padding = {
            Top = 5, 
            Left = 11, 
            Bottom = 11, 
            Right = 11
        }, 
        PauseButton = v13("rbxasset://textures/DeveloperFramework/MediaPlayerControls/pause_button.png"), 
        PlayButton = v13("rbxasset://textures/DeveloperFramework/MediaPlayerControls/play_button.png")
    }
};