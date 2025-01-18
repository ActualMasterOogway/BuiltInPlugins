local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Components_0 = l_Parent_0.Src.Components;
local v11 = require(l_Components_0.PromptSelectorWithPreview.PreviewToolbarButton);
local v12 = require(l_Parent_0.Src.Components.LoadingImage);
local v13 = v1.PureComponent:extend("PreviewImage");
v13.init = function(v14) --[[ Line: 45 ]] --[[ Name: init ]]
    v14.state = {
        promptSelectionHovered = false
    };
    v14.onPromptSelectionHover = function() --[[ Line: 50 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            promptSelectionHovered = true
        });
    end;
    v14.onPromptSelectionHoverEnd = function() --[[ Line: 56 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            promptSelectionHovered = false
        });
    end;
end;
v13.render = function(v15) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_TextLabel_0 (copy), v12 (copy), l_Image_0 (copy), v11 (copy)
    local l_props_0 = v15.props;
    local l_PromptSelectorWithPreview_0 = l_props_0.Stylizer.PromptSelectorWithPreview;
    local l_Localization_1 = l_props_0.Localization;
    local l_state_0 = v15.state;
    local v20 = l_props_0.ImageId and l_props_0.ImageId ~= "";
    local v21 = v20 and l_state_0.promptSelectionHovered and true or false;
    return v1.createElement("ImageLabel", {
        ZIndex = 1, 
        Size = UDim2.new(0, l_PromptSelectorWithPreview_0.PreviewSize, 0, l_PromptSelectorWithPreview_0.PreviewSize), 
        Image = "", 
        [v1.Event.MouseEnter] = v15.onPromptSelectionHover, 
        [v1.Event.MouseLeave] = v15.onPromptSelectionHoverEnd
    }, {
        PreviewNoImageSign = not v20 and v1.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_PromptSelectorWithPreview_0.ImportImageBackground
        }, {
            NoImageText = v1.createElement(l_TextLabel_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextSize = l_PromptSelectorWithPreview_0.TextHeight, 
                Text = l_Localization_1:getText("CreateDialog", "NoImageSelected"), 
                TextWrapped = true, 
                TextColor = l_PromptSelectorWithPreview_0.ButtonIconColor
            })
        }), 
        PreviewContentContainer = v20 and v1.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            PreviewContent = if l_props_0.IsTempId == true then v1.createElement(v12, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = l_props_0.ImageId, 
                ScaleType = Enum.ScaleType.Fit
            }) else v1.createElement(l_Image_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Image = l_props_0.ImageId
            })
        }), 
        Toolbar = if l_props_0.IsTempId == false then v1.createElement("Frame", {
            ZIndex = 3, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 0, l_PromptSelectorWithPreview_0.ToolbarHeight), 
            Visible = v21, 
            BackgroundTransparency = l_PromptSelectorWithPreview_0.ToolbarTransparency, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_PromptSelectorWithPreview_0.ToolbarBackgroundColor
        }, {
            ExpandPreview = v1.createElement(v11, {
                Icon = l_PromptSelectorWithPreview_0.ExpandIcon, 
                [v1.Event.Activated] = l_props_0.OpenExpandedPreview
            }), 
            ClearButton = v1.createElement(v11, {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                Icon = l_PromptSelectorWithPreview_0.ClearIcon, 
                [v1.Event.Activated] = l_props_0.ClearSelection
            })
        }) else nil
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v13));