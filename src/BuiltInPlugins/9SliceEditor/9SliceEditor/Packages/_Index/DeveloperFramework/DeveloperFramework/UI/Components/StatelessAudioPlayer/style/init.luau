local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.UIFolderData);
local v2 = require(v1.MediaPlayerControls.style);
local l_deepCopy_0 = require(l_Parent_0.Util).deepCopy;
return {
    PlaceholderImage = {
        ScaleType = Enum.ScaleType.Fit, 
        Image = "rbxasset://textures/DeveloperFramework/AudioPlayer/audioPlay_BG.png", 
        Color = Color3.fromRGB(204, 204, 204)
    }, 
    MediaPlayerControls = l_deepCopy_0(v2)
};