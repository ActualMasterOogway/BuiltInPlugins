local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.Orientation);
local v5 = require(l_Parent_0.Src.Util.MouseCursorManager);
local l_Components_0 = l_Parent_0.Src.Components;
local v7 = require(l_Components_0.ImageEditor);
local v8 = require(l_Components_0.TextEditor);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v18 = v2.PureComponent:extend("SliceEditor");
local v19 = v4.Left.rawValue();
local v20 = v4.Right.rawValue();
local v21 = v4.Top.rawValue();
local v22 = v4.Bottom.rawValue();
local function _(v23, v24) --[[ Line: 45 ]] --[[ Name: checkEqualSlices ]]
    -- upvalues: v19 (copy), v20 (copy), v21 (copy), v22 (copy)
    local v25 = false;
    if v23[v19] == v24[v19] then
        v25 = false;
        if v23[v20] == v24[v20] then
            v25 = false;
            if v23[v21] == v24[v21] then
                v25 = v23[v22] == v24[v22];
            end;
        end;
    end;
    return v25;
end;
v18.init = function(v27, _) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy), v20 (copy), v21 (copy), v22 (copy), l_ChangeHistoryService_0 (copy)
    v27.getImageDimensions = function() --[[ Line: 68 ]]
        -- upvalues: v27 (copy)
        local l_imageRectSize_0 = v27.props.imageRectSize;
        if l_imageRectSize_0 and l_imageRectSize_0.X > 0 and l_imageRectSize_0.Y > 0 then
            return l_imageRectSize_0;
        else
            return v27.props.pixelDimensions;
        end;
    end;
    v27.clampAndRoundSliceRect = function(v30) --[[ Line: 77 ]]
        -- upvalues: v27 (copy), v19 (ref), v20 (ref), v21 (ref), v22 (ref)
        local v31 = v27.getImageDimensions();
        local _ = nil;
        local _ = nil;
        local _ = nil;
        local _ = nil;
        return {
            math.clamp(math.round(v30[v19]), 0, v31.X), 
            math.clamp(math.round(v30[v20]), 0, v31.X), 
            math.clamp(math.round(v30[v21]), 0, v31.Y), 
            (math.clamp(math.round(v30[v22]), 0, v31.Y))
        };
    end;
    v27.setSliceRect = function(v36, v37) --[[ Line: 88 ]]
        -- upvalues: v27 (copy), v19 (ref), v21 (ref), v20 (ref), v22 (ref), l_ChangeHistoryService_0 (ref)
        local l_v36_0 = v36;
        if v37 then
            l_v36_0 = v27.clampAndRoundSliceRect(v36);
        end;
        if v27.props.selectedObject then
            v27.props.selectedObject.SliceCenter = Rect.new(l_v36_0[v19], l_v36_0[v21], l_v36_0[v20], l_v36_0[v22]);
        end;
        l_ChangeHistoryService_0:SetWaypoint("9SliceEditor changed SliceCenter");
    end;
    v27.onRevert = function() --[[ Line: 101 ]]
        -- upvalues: v27 (copy)
        v27.setSliceRect(v27.props.revertSliceRect, false);
    end;
end;
v18.didMount = function(v39) --[[ Line: 107 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy)
    v5.resetCursor(v39.props.Mouse);
end;
v18.render = function(v40) --[[ Line: 111 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v7 (copy), v8 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy)
    local l_props_0 = v40.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_selectedObject_0 = l_props_0.selectedObject;
    local v44 = v40.getImageDimensions();
    local l_setSliceRect_0 = v40.setSliceRect;
    local l_sliceRect_0 = l_props_0.sliceRect;
    local l_Localization_1 = l_props_0.Localization;
    local l_Button_1 = l_props_0.Stylizer.Button;
    local v49 = false;
    if not l_selectedObject_0 then
        local v50 = l_Localization_1:getText("SliceEditor", "NoImageSelectedMessage");
        if l_props_0.loading then
            v50 = l_Localization_1:getText("SliceEditor", "ImageLoadingMessage");
        end;
        return v2.createElement(l_Pane_0, {
            Style = "Box", 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromOffset(0, 0)
        }, {
            EntireFrame = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            }, {
                Message = v2.createElement(l_TextLabel_0, {
                    Text = v50, 
                    TextWrapped = true, 
                    Size = l_Stylizer_0.InfoBoxSize
                })
            }), 
            LoadingImage = v2.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                ImageTransparency = 0.99, 
                Image = l_props_0.contentIdToLoad, 
                Size = UDim2.fromOffset(1, 1), 
                Position = UDim2.fromOffset(0, 0), 
                ScaleType = Enum.ScaleType.Fit, 
                [v2.Ref] = l_props_0.loadingImageRef
            })
        });
    else
        local l_sliceRect_1 = l_props_0.sliceRect;
        local l_revertSliceRect_0 = l_props_0.revertSliceRect;
        local v53 = false;
        if l_sliceRect_1[v19] == l_revertSliceRect_0[v19] then
            v53 = false;
            if l_sliceRect_1[v20] == l_revertSliceRect_0[v20] then
                v53 = false;
                if l_sliceRect_1[v21] == l_revertSliceRect_0[v21] then
                    v53 = l_sliceRect_1[v22] == l_revertSliceRect_0[v22];
                end;
            end;
        end;
        if not v53 then
            v49 = true;
        end;
        return v2.createElement(l_Pane_0, {
            Style = "Box", 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromOffset(0, 0), 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = 0, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Upper = v2.createElement(l_Pane_0, {
                Size = UDim2.new(1, 0, 1, -l_Stylizer_0.ButtonsAreaSize.Y.Offset), 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Spacing = 0, 
                Padding = {
                    Top = l_Stylizer_0.PaddingPx, 
                    Left = l_Stylizer_0.PaddingPx, 
                    Right = l_Stylizer_0.PaddingPx, 
                    Bottom = 0
                }
            }, {
                ImageEditorComponent = v2.createElement(v7, {
                    layoutOrder = 1, 
                    size = UDim2.new(1 - l_Stylizer_0.TextAreaXWindowScaleFactor, -l_Stylizer_0.TextAreaSize.X.Offset, 1, 0), 
                    selectedObject = l_selectedObject_0, 
                    pixelDimensions = v44, 
                    setSliceRect = l_setSliceRect_0, 
                    sliceRect = l_sliceRect_0, 
                    imageRectOffset = l_props_0.imageRectOffset, 
                    imageRectSize = v44, 
                    imageColor3 = l_props_0.imageColor3, 
                    resampleMode = l_props_0.resampleMode
                }), 
                TextEditorComponent = v2.createElement(v8, {
                    layoutOrder = 2, 
                    size = UDim2.new(l_Stylizer_0.TextAreaXWindowScaleFactor, l_Stylizer_0.TextAreaSize.X.Offset, 0, l_Stylizer_0.TextAreaSize.Y.Offset), 
                    pixelDimensions = v44, 
                    setSliceRect = l_setSliceRect_0, 
                    sliceRect = l_sliceRect_0
                })
            }), 
            Lower = v2.createElement(l_Pane_0, {
                LayoutOrder = 2, 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.ButtonsAreaSize.Y.Offset), 
                Position = UDim2.fromOffset(0, l_Stylizer_0.ButtonsAreaYPos), 
                Spacing = l_Stylizer_0.ButtonsSpacing
            }, {
                CloseButton = v2.createElement(l_Button_0, {
                    OnClick = l_props_0.onClose, 
                    Size = l_Button_1.Size, 
                    Style = l_Button_1.Style, 
                    LayoutOrder = 1, 
                    Text = l_Localization_1:getText("SliceEditor", "CloseButton")
                }), 
                RevertButton = v2.createElement(l_Button_0, {
                    OnClick = v40.onRevert, 
                    Size = l_Button_1.Size, 
                    Style = l_Button_1.Style, 
                    StyleModifier = not v49 and l_StyleModifier_0.Disabled or nil, 
                    LayoutOrder = 2, 
                    Text = l_Localization_1:getText("SliceEditor", "RevertButton")
                })
            })
        });
    end;
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v18));