local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.Util);
local v3 = require(l_Parent_0.Util.StyleModifier);
local v4 = require(l_Parent_0.Parent.Cryo);
local l_deepCopy_0 = v2.deepCopy;
local v6 = require(l_Parent_0.UI.Components.Box);
local v7 = require(l_Parent_0.UI.Components.RoundBox);
local v8 = require(l_Parent_0.UI.Components.Image);
local v9 = require(l_Parent_0.UI.Components.UIFolderData);
local v10 = require(v9.Box.style);
local v11 = require(v9.RoundBox.style);
local v12 = require(v9.StatelessAudioPlayer.style);
local v13 = require(v9.StatelessVideoPlayer.style);
local function _(v14) --[[ Line: 24 ]] --[[ Name: shrinkMediaPlayerControlsWidth ]]
    -- upvalues: l_deepCopy_0 (copy)
    local v15 = l_deepCopy_0(v14);
    v15.MediaPlayerControls.Controls.Size = v15.MediaPlayerControls.Controls.Size - UDim2.new(0, 32, 0, 0);
    return v15;
end;
local v17 = l_deepCopy_0(v10);
local v18 = l_deepCopy_0(v11);
local v19 = l_deepCopy_0(v12);
local v20 = l_deepCopy_0(v13);
local v21 = v4.Dictionary.join(v18, {
    Color = v1.ImageButtonBackground, 
    Transparency = 0
});
local v22 = {
    Background = v6, 
    BackgroundStyle = v4.Dictionary.join(v17, {
        Color = v1.SubBackground
    }), 
    RenderView = {
        FontRenderView = {
            Padding = {
                Bottom = 32, 
                Left = 32, 
                Right = 32, 
                Top = 32
            }, 
            FontRenderViewBackgroundColor = v1.MainBackground, 
            Text = "The quick brown fox jumps over the lazy dog"
        }, 
        Size = UDim2.new(1, 0, 0, 242), 
        TreeViewButton = {
            Size = UDim2.fromOffset(28, 28), 
            Background = v7, 
            BackgroundStyle = v21, 
            [v3.Hover] = {
                BackgroundStyle = v4.Dictionary.join(v21, {
                    Transparency = 0.3
                })
            }, 
            Foreground = v8, 
            ForegroundStyle = {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/DeveloperFramework/AssetRender/hierarchy.png", 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.fromOffset(16, 16), 
                ScaleType = Enum.ScaleType.Stretch
            }
        }
    }, 
    ImageCarousel = {
        PaneStyle = "Box"
    }, 
    Thumbnail = {
        Size = 420
    }, 
    TreeView = {
        Size = UDim2.new(1, 0, 0, 120), 
        HorizontalSize = UDim2.new(0.4, 0, 0, 242)
    }, 
    AudioPlayer = v19
};
local v23 = l_deepCopy_0(v19);
v23.MediaPlayerControls.Controls.Size = v23.MediaPlayerControls.Controls.Size - UDim2.new(0, 32, 0, 0);
v22.AudioPlayerWithTreeViewButton = v23;
v22.VideoPlayer = v20;
v23 = l_deepCopy_0(v20);
v23.MediaPlayerControls.Controls.Size = v23.MediaPlayerControls.Controls.Size - UDim2.new(0, 32, 0, 0);
v22.VideoPlayerWithTreeViewButton = v23;
return v22;