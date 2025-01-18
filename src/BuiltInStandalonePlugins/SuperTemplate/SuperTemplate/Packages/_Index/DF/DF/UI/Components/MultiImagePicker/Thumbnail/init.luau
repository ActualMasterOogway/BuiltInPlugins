local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Parent.Cryo);
local v3 = require(l_Parent_0.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = require(l_Parent_0.Resources);
local v6 = require(script.Parent.ThumbnailHoverBar);
local _ = require(script.Parent.types);
local l_LOCALIZATION_PROJECT_NAME_0 = v5.LOCALIZATION_PROJECT_NAME;
local v9 = v1.PureComponent:extend("Thumbnail");
v9.init = function(v10) --[[ Line: 65 ]] --[[ Name: init ]]
    v10.state = {
        Hovering = false
    };
end;
v9.mouseHoverChanged = function(v11, v12) --[[ Line: 71 ]] --[[ Name: mouseHoverChanged ]]
    local l_props_0 = v11.props;
    if v12 then
        l_props_0.Mouse:__pushCursor("SizeAll");
    else
        l_props_0.Mouse:__resetCursor();
    end;
    v11:setState({
        Hovering = v12
    });
end;
v9.render = function(v14) --[[ Line: 86 ]] --[[ Name: render ]]
    -- upvalues: l_LOCALIZATION_PROJECT_NAME_0 (copy), v1 (copy), v2 (copy), v6 (copy)
    local l_props_1 = v14.props;
    local l_Theme_0 = l_props_1.Theme;
    local l_Localization_0 = l_props_1.Localization;
    local l_VideoHash_0 = l_props_1.VideoHash;
    local l_VideoTitle_0 = l_props_1.VideoTitle;
    local v20 = l_props_1.InReview or false;
    local v21 = l_props_1.IsModerated or false;
    local v22 = l_props_1.Preview or false;
    local l_Hovering_0 = v14.state.Hovering;
    local v24 = l_props_1.LayoutOrder or 1;
    local l_Id_0 = l_props_1.Id;
    local l_HoverBarEnabled_0 = l_props_1.HoverBarEnabled;
    local v27 = if v21 then l_Theme_0.ModeratedImage else if l_VideoHash_0 ~= nil then l_Theme_0.VideoPlaceholder else l_props_1.Image;
    local v28 = if v21 then l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "ImageModerated") else if v22 then l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "ImagePreview") else if v20 then l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "ImageReview") else nil;
    local l_createElement_0 = v1.createElement;
    local v30 = "ImageButton";
    local v31 = {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v24, 
        Image = v27, 
        ImageColor3 = l_VideoHash_0 ~= nil and l_Theme_0.Thumbnail.Background or nil, 
        ScaleType = Enum.ScaleType.Fit, 
        [v1.Ref] = v14.buttonRef, 
        [v1.Event.MouseEnter] = function() --[[ Line: 122 ]]
            -- upvalues: v14 (copy), l_props_1 (copy), v24 (copy), l_Id_0 (copy)
            v14:mouseHoverChanged(true);
            l_props_1.DragMove({
                index = v24, 
                thumbnailId = l_Id_0
            });
        end, 
        [v1.Event.MouseLeave] = function() --[[ Line: 130 ]]
            -- upvalues: v14 (copy)
            v14:mouseHoverChanged(false);
        end, 
        [v1.Event.MouseButton1Down] = function() --[[ Line: 134 ]]
            -- upvalues: l_props_1 (copy), v24 (copy), l_Id_0 (copy)
            l_props_1.StartDragging({
                index = v24, 
                thumbnailId = l_Id_0
            });
        end
    };
    local v32 = {};
    local l_createElement_1 = v1.createElement;
    local v34 = "TextLabel";
    local l_join_0 = v2.Dictionary.join;
    local l_Normal_0 = l_Theme_0.FontStyle.Normal;
    local v37 = {};
    local v38 = false;
    if v28 ~= nil then
        v38 = not (l_HoverBarEnabled_0 and l_Hovering_0);
    end;
    v37.Visible = v38;
    v37.BackgroundTransparency = 0.3;
    v37.BorderSizePixel = 0;
    v37.BackgroundColor3 = l_Theme_0.Colors.Black;
    v37.TextColor3 = l_Theme_0.Colors.White;
    v37.Size = UDim2.new(1, 0, 0, 30);
    v37.Position = UDim2.new(0, 0, 1, 0);
    v37.AnchorPoint = Vector2.new(0, 1);
    v37.Text = v28;
    v32.InfoText = l_createElement_1(v34, l_join_0(l_Normal_0, v37));
    v32.TitleFrame = v1.createElement("Frame", {
        Visible = l_VideoTitle_0 ~= nil, 
        BackgroundTransparency = 0.3, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.Colors.Black, 
        Size = UDim2.new(1, 0, 0, 30)
    }, {
        TitleText = v1.createElement("TextLabel", v2.Dictionary.join(l_Theme_0.FontStyle.Normal, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -20, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Text = l_VideoTitle_0, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left
        }))
    });
    v32.HoverBar = v1.createElement(v6, {
        Enabled = l_HoverBarEnabled_0 and l_Hovering_0, 
        PromptPreviewThumbnail = function() --[[ Line: 181 ]] --[[ Name: PromptPreviewThumbnail ]]
            -- upvalues: l_props_1 (copy), v24 (copy), l_Id_0 (copy), l_VideoHash_0 (copy), v27 (copy)
            l_props_1.PromptPreviewThumbnail({
                index = v24, 
                thumbnailId = l_Id_0, 
                videoHash = l_VideoHash_0, 
                image = v27
            });
        end, 
        PromptDeleteThumbnail = function() --[[ Line: 189 ]] --[[ Name: PromptDeleteThumbnail ]]
            -- upvalues: l_props_1 (copy), l_Id_0 (copy)
            l_props_1.PromptDeleteThumbnail({
                thumbnailId = l_Id_0
            });
        end, 
        Theme = l_Theme_0
    });
    return l_createElement_0(v30, v31, v32);
end;
return (l_withContext_0({
    Localization = v3.Localization, 
    Mouse = v3.Mouse
})(v9));