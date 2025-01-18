local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent.HoverBarButton);
local _ = require(script.Parent.types);
return function(v4) --[[ Line: 25 ]] --[[ Name: ThumbnailHoverBar ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Enabled_0 = v4.Enabled;
    local l_Theme_0 = v4.Theme;
    local l_ThumbnailHoverBar_0 = l_Theme_0.ThumbnailHoverBar;
    local l_Padding_0 = l_ThumbnailHoverBar_0.Padding;
    return v1.createElement("Frame", {
        Visible = l_Enabled_0, 
        BackgroundTransparency = 0.3, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.Colors.Black, 
        Size = UDim2.new(1, 0, 0, 40), 
        Position = UDim2.new(0, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 1)
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = l_Padding_0, 
            PaddingBottom = l_Padding_0, 
            PaddingLeft = l_Padding_0, 
            PaddingRight = l_Padding_0
        }), 
        Zoom = v1.createElement(v2, {
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Image = l_ThumbnailHoverBar_0.ZoomImage, 
            ButtonPressed = v4.PromptPreviewThumbnail, 
            Theme = l_Theme_0
        }), 
        Delete = v1.createElement(v2, {
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            Image = l_ThumbnailHoverBar_0.DeleteImage, 
            ButtonPressed = v4.PromptDeleteThumbnail, 
            Theme = l_Theme_0
        })
    });
end;