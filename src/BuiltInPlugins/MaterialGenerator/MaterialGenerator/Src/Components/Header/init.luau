local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.MaterialFramework);
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local l_Enum_0 = l_Parent_0.Src.Enum;
local v7 = require(l_Enum_0.GenerationErrorType);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_StudioServices_0 = v2.Context.StudioServices;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v22 = require(l_Actions_0.SetTextPrompt);
local v23 = require(l_Actions_0.SetInitialImageId);
local v24 = require(l_Actions_0.SetGenerationError);
local v25 = require(l_Parent_0.Src.Thunks.GenerateImages);
local v26 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorSupportVariations2);
local l_MaterialGeneratorErrorAnalytics_0 = game:GetFastFlag("MaterialGeneratorErrorAnalytics");
local _ = require(l_Parent_0.Src.Types);
local v29 = v3.PureComponent:extend("Header");
v29.init = function(v30) --[[ Line: 96 ]] --[[ Name: init ]]
    -- upvalues: v26 (copy)
    v30:setState({
        retriesAttempt = 0, 
        addedImageHovered = false, 
        addImageCloseButtonHovered = false, 
        textInputShouldFocus = true, 
        isQueryingForImage = false
    });
    v30.textPromptChanged = function(v31) --[[ Line: 105 ]]
        -- upvalues: v30 (copy)
        v30.props.dispatchSetTextPrompt(v31);
    end;
    v30.onAddedImageHovered = function() --[[ Line: 109 ]]
        -- upvalues: v26 (ref), v30 (copy)
        if not v26() then
            return;
        else
            v30:setState({
                addedImageHovered = true
            });
            return;
        end;
    end;
    v30.onAddedImageUnhovered = function() --[[ Line: 119 ]]
        -- upvalues: v26 (ref), v30 (copy)
        if not v26() then
            return;
        else
            v30:setState({
                addedImageHovered = false
            });
            return;
        end;
    end;
    v30.onAddedImageCloseButtonHovered = function() --[[ Line: 129 ]]
        -- upvalues: v26 (ref), v30 (copy)
        if not v26() then
            return;
        else
            v30:setState({
                addImageCloseButtonHovered = true
            });
            return;
        end;
    end;
    v30.onAddedImageCloseButtonUnhovered = function() --[[ Line: 139 ]]
        -- upvalues: v26 (ref), v30 (copy)
        if not v26() then
            return;
        else
            v30:setState({
                addImageCloseButtonHovered = false
            });
            return;
        end;
    end;
    v30.addImage = function() --[[ Line: 149 ]]
        -- upvalues: v26 (ref), v30 (copy)
        if not v26() then
            return;
        elseif v30.state.isQueryingForImage then
            return;
        else
            v30:setState({
                addedImageHovered = false, 
                isQueryingForImage = true
            });
            local v32 = {
                "png", 
                "jpg", 
                "jpeg"
            };
            local v33 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 166 ]]
                -- upvalues: v30 (ref), v33 (ref), v32 (copy)
                v33 = v30.props.StudioServices:getService("StudioService"):PromptImportFile(v32);
            end);
            if l_status_0 then
                if v33 then
                    v30.props.dispatchSetInitialImageId(v33:GetTemporaryId());
                end;
            else
                v30.props.dispatchSetImageError(l_result_0);
            end;
            v30:setState({
                isQueryingForImage = false
            });
            return;
        end;
    end;
    v30.clearImage = function() --[[ Line: 184 ]]
        -- upvalues: v26 (ref), v30 (copy)
        if not v26() then
            return;
        else
            v30:setState({
                addedImageHovered = false
            });
            v30.props.dispatchSetInitialImageId(nil);
            return;
        end;
    end;
    v30.generate = function(v36) --[[ Line: 195 ]]
        -- upvalues: v30 (copy)
        if not v30.props.Localization then
            return;
        else
            local l_StudioServices_1 = v30.props.StudioServices;
            local l_Analytics_1 = v30.props.Analytics;
            v30.props.dispatchGenerateImages(l_StudioServices_1, l_Analytics_1, v36);
            v30:setState({
                textInputShouldFocus = true
            });
            return;
        end;
    end;
    v30.unsetFocusLater = function() --[[ Line: 209 ]]
        -- upvalues: v30 (copy)
        task.defer(function() --[[ Line: 210 ]]
            -- upvalues: v30 (ref)
            v30:setState({
                textInputShouldFocus = false
            });
        end);
    end;
end;
v29.didMount = function(v39) --[[ Line: 218 ]] --[[ Name: didMount ]]
    v39.unsetFocusLater();
end;
v29.willUnmount = function(v40) --[[ Line: 222 ]] --[[ Name: willUnmount ]]
    v40:_setDeferredTask(nil);
end;
v29.didUpdate = function(v41) --[[ Line: 226 ]] --[[ Name: didUpdate ]]
    if v41.state.textInputShouldFocus then
        v41.unsetFocusLater();
    end;
end;
v29._computeRetryTime = function(_, v43) --[[ Line: 234 ]] --[[ Name: _computeRetryTime ]]
    return 1 + 5 / (1 + 2.71828 ^ ((0.5 - v43 / 10) * 10));
end;
v29._setDeferredTask = function(v44, v45) --[[ Line: 239 ]] --[[ Name: _setDeferredTask ]]
    if v44.deferredQueryingTask then
        task.cancel(v44.deferredQueryingTask);
        v44.deferredQueryingTask = nil;
    end;
    v44.deferredQueryingTask = v45;
end;
v29._renderLoader = function(_, v47, v48) --[[ Line: 248 ]] --[[ Name: _renderLoader ]]
    -- upvalues: v3 (copy), l_Pane_0 (copy), l_LoadingIndicator_0 (copy)
    return v3.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = v47.LayoutOrder, 
        Padding = v48.Padding, 
        Spacing = v48.VerticalSpacing, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        Loading = v3.createElement(l_LoadingIndicator_0)
    });
end;
v29.render = function(v49) --[[ Line: 260 ]] --[[ Name: render ]]
    -- upvalues: v26 (copy), v3 (copy), l_Image_0 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), l_MaterialGeneratorErrorAnalytics_0 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy), l_LoadingIndicator_0 (copy)
    local l_props_0 = v49.props;
    local l_Header_0 = l_props_0.Stylizer.Header;
    local l_Localization_1 = l_props_0.Localization;
    local v53 = l_props_0.IsGeneratingImages or l_props_0.TextPrompt == nil or l_props_0.TextPrompt == "";
    local v54 = 0;
    local v55 = nil;
    local v56 = false;
    if v26() then
        if not v49.props.initialImageId and not v49.state.isQueryingForImage then
            v56 = true;
            v55 = nil;
        else
            v54 = l_Header_0.PromptHeight + l_Header_0.ImagePadding;
            v56 = false;
            v55 = v3.createElement("Frame", {
                Size = UDim2.fromOffset(l_Header_0.PromptHeight, l_Header_0.PromptHeight), 
                Position = UDim2.fromScale(0, 0.5), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1
            }, {
                ImagePreview = v3.createElement("ImageButton", {
                    BackgroundColor3 = l_Header_0.ImageBackgroundColor3, 
                    BorderSizePixel = 0, 
                    Image = v49.props.initialImageId, 
                    Size = UDim2.fromOffset(l_Header_0.PromptHeight - 2, l_Header_0.PromptHeight - 2), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    ZIndex = 2, 
                    ImageColor3 = l_Header_0.ImageColor3, 
                    ScaleType = Enum.ScaleType.Crop, 
                    [v3.Event.Activated] = v49.addImage, 
                    [v3.Event.MouseEnter] = v49.onAddedImageHovered, 
                    [v3.Event.MouseLeave] = v49.onAddedImageUnhovered
                }, {
                    UICorner = v3.createElement("UICorner", {
                        CornerRadius = l_Header_0.ImageCornerRadius
                    }), 
                    UIStroke = v3.createElement("UIStroke", {
                        Thickness = 1, 
                        Color = l_Header_0.ImageBorderColor
                    }), 
                    AddImageIcon = v3.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        ImageColor3 = if v49.props.initialImageId then l_Header_0.AddImageButtonIconColor else l_Header_0.AddImageButtonIconColorNoImage, 
                        Size = UDim2.fromOffset(32, 32), 
                        Visible = v49.state.addedImageHovered or v49.state.isQueryingForImage, 
                        Image = "rbxasset://textures/MaterialGenerator/AddImage_64x64.png", 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5)
                    }), 
                    CloseButton = v3.createElement("ImageButton", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(22, 22), 
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.fromScale(1, 0), 
                        Visible = v49.state.addedImageHovered, 
                        [v3.Event.Activated] = v49.clearImage, 
                        [v3.Event.MouseEnter] = v49.onAddedImageCloseButtonHovered, 
                        [v3.Event.MouseLeave] = v49.onAddedImageCloseButtonUnhovered
                    }, {
                        Icon = v3.createElement(l_Image_0, {
                            BackgroundTransparency = 1, 
                            Image = "rbxasset://textures/StudioSharedUI/close.png", 
                            Size = UDim2.fromOffset(16, 16), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        }, {
                            UIScale = v3.createElement("UIScale", {
                                Scale = v49.state.addImageCloseButtonHovered and 1.2 or 1
                            })
                        })
                    })
                })
            });
        end;
    end;
    local function v57() --[[ Line: 348 ]] --[[ Name: onGenerateClick ]]
        -- upvalues: v49 (copy)
        v49.generate("ButtonClick");
    end;
    local function v58() --[[ Line: 352 ]] --[[ Name: onPromptEnter ]]
        -- upvalues: v49 (copy)
        v49.generate("KeyboardEnter");
    end;
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Padding = l_Header_0.Padding, 
        Spacing = l_Header_0.VerticalSpacing, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        TextPromptPane = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_Header_0.PromptHeight), 
            BackgroundTransparency = 1
        }, {
            Preview = v55, 
            TextPrompt = v3.createElement(l_TextInput_0, {
                LayoutOrder = 1, 
                MultiLine = l_Header_0.MultiLinePrompt, 
                OnEnter = if v53 then nil else if l_MaterialGeneratorErrorAnalytics_0 then v58 else v49.generate, 
                OnTextChanged = v49.textPromptChanged, 
                PlaceholderText = l_Localization_1:getText("Header", "PromptPlaceholderText"), 
                ShouldFocus = v49.state.textInputShouldFocus, 
                Position = UDim2.new(0, v54, 0, 0), 
                Size = UDim2.new(1, -v54, 0, l_Header_0.PromptHeight), 
                Text = l_props_0.TextPrompt, 
                TextYAlignment = l_Header_0.TextYAlignment
            }), 
            AddImageButton = v56 and v3.createElement(l_Button_0, {
                Style = "RoundSubtle", 
                Size = l_Header_0.UploadButtonSize, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 5 + v54, 1, -5), 
                Tooltip = l_Localization_1:getText("Header", "AddImageTooltip"), 
                OnClick = v49.addImage
            }, {
                Icon = v3.createElement(l_Image_0, {
                    BackgroundTransparency = 1, 
                    ImageColor3 = l_Header_0.AddImageButtonIconColor, 
                    Image = "rbxasset://textures/MaterialGenerator/AddImage_48x48.png", 
                    Size = UDim2.fromOffset(24, 24), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5)
                })
            }), 
            GenerateButton = v26() and v3.createElement(l_Button_0, {
                OnClick = if l_MaterialGeneratorErrorAnalytics_0 then v57 else v49.generate, 
                Size = l_Header_0.GenerateButtonSize, 
                AnchorPoint = Vector2.new(1, 1), 
                Position = UDim2.new(1, -5, 1, -5), 
                Style = "RoundPrimary", 
                StyleModifier = if v53 then l_StyleModifier_0.Disabled else nil, 
                Text = l_props_0.IsGeneratingImages and "" or l_Localization_1:getText("Header", "GenerateButton")
            }, {
                LoadingIndicator = l_props_0.IsGeneratingImages and v3.createElement(l_LoadingIndicator_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(24, 16)
                })
            })
        }), 
        SettingsRow = if not v26() then v3.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, l_Header_0.RowHeight), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            GenerateButton = v3.createElement(l_Button_0, {
                OnClick = if l_MaterialGeneratorErrorAnalytics_0 then v57 else v49.generate, 
                Size = l_Header_0.GenerateButtonSize, 
                Style = "RoundPrimary", 
                StyleModifier = if v53 then l_StyleModifier_0.Disabled else nil, 
                Text = l_Localization_1:getText("Header", "GenerateButton")
            })
        }) else nil
    });
end;
v29.getDerivedStateFromProps = function(_, v60) --[[ Line: 439 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: l_StyleModifier_0 (copy), v3 (copy)
    local v61 = nil;
    if v60.isQueryingForImage then
        v61 = l_StyleModifier_0.Selected;
    elseif v60.addedImageHovered then
        v61 = l_StyleModifier_0.Hover;
    end;
    if v61 ~= v60.StyleModifier then
        return {
            StyleModifier = v61 or v3.None
        };
    else
        return nil;
    end;
end;
v29 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    StudioServices = l_StudioServices_0, 
    Stylizer = l_Stylizer_0
})(v29);
return v4.connect(function(v62, _) --[[ Line: 463 ]] --[[ Name: mapStateToProps ]]
    return {
        initialImageId = v62.MaterialsReducer.initialImageId, 
        IsGeneratingImages = v62.AppStateReducer.generatingImages > 0, 
        TextPrompt = v62.AppStateReducer.textPrompt
    };
end, function(v64) --[[ Line: 471 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v24 (copy), v7 (copy), v25 (copy), v22 (copy), v23 (copy)
    return {
        dispatchSetImageError = function(v65) --[[ Line: 473 ]] --[[ Name: dispatchSetImageError ]]
            -- upvalues: v64 (copy), v24 (ref), v7 (ref)
            v64(v24(v7.FailedToSetImage, v65));
        end, 
        dispatchGenerateImages = function(v66, v67) --[[ Line: 476 ]] --[[ Name: dispatchGenerateImages ]]
            -- upvalues: v64 (copy), v25 (ref)
            v64(v25(v66, v67));
        end, 
        dispatchSetTextPrompt = function(v68) --[[ Line: 479 ]] --[[ Name: dispatchSetTextPrompt ]]
            -- upvalues: v64 (copy), v22 (ref)
            v64(v22(v68));
        end, 
        dispatchSetInitialImageId = function(v69) --[[ Line: 482 ]] --[[ Name: dispatchSetInitialImageId ]]
            -- upvalues: v64 (copy), v23 (ref)
            v64(v23(v69));
        end
    };
end)(v29);