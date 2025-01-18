local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.UIFolderData);
local v2 = require(v1.MediaPlayerControls.style);
local v3 = require(l_Parent_0.UI.Components.Box);
local v4 = require(l_Parent_0.Util.deepCopy);
return {
    PlayVideoIcon = {
        Size = UDim2.fromOffset(30, 30), 
        ScaleType = Enum.ScaleType.Fit, 
        Image = v4(v2).Controls.PlayButton.ForegroundStyle.Image, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }, 
    PausedOverlay = {
        Background = v3, 
        BackgroundStyle = {
            Color = Color3.fromRGB(0, 0, 0), 
            Transparency = 0.5
        }
    }, 
    MediaPlayerControls = v4(v2)
};