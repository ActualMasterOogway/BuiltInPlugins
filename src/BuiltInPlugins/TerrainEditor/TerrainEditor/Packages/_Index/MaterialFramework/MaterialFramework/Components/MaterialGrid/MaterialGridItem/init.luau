local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Types);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Dash);
local v4 = require(l_Parent_1.Framework);
local v5 = require(l_Parent_1.React);
local v6 = v4.SharedFlags.getFFlagDevFrameworkShimmerImprovements();
local v7 = require(l_Parent_0.Flags.getFFlagMaterialPickerInstantTooltip);
local l_UI_0 = v4.UI;
local _ = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_Shimmer_0 = l_UI_0.Shimmer;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local _ = v4.Util.prioritize;
local v15 = require(l_Parent_0.Components.MaterialPreview);
local _ = require(l_Parent_0.Enums.MaterialPreviewGeometryType);
local v17 = require(l_Parent_0.Flags.getFFlagMaterialPickerUIChanges);
return v5.forwardRef(function(v18, v19) --[[ Line: 95 ]] --[[ Name: MaterialGridItem ]]
    -- upvalues: v5 (copy), l_TextLabel_0 (copy), l_Pane_0 (copy), v6 (copy), l_Shimmer_0 (copy), v7 (copy), v17 (copy), v15 (copy), l_Tooltip_0 (copy), v3 (copy)
    local l_Style_0 = v18.Style;
    local function v22() --[[ Line: 98 ]] --[[ Name: renderLabel ]]
        -- upvalues: l_Style_0 (copy), v5 (ref), l_TextLabel_0 (ref), v18 (copy)
        local l_GridItemLabelPadding_0 = l_Style_0.GridItemLabelPadding;
        return v5.createElement(l_TextLabel_0, {
            AnchorPoint = Vector2.new(0, 1), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            Position = UDim2.fromScale(0, 1), 
            Text = v18.Text, 
            TextSize = l_Style_0.TextSize, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = false
        }, {
            Padding = v5.createElement("UIPadding", {
                PaddingBottom = l_GridItemLabelPadding_0.PaddingBottom, 
                PaddingLeft = l_GridItemLabelPadding_0.PaddingLeft
            })
        });
    end;
    local v23 = false;
    if v18.ShowGridLabels ~= false then
        v23 = v18.Text and v18.Text ~= "";
    end;
    local v24, v25 = v5.useState(false);
    if v18.Loading then
        local l_ShimmerSizeOffset_0 = l_Style_0.ShimmerSizeOffset;
        return v5.createElement(l_Pane_0, {
            LayoutOrder = v18.LayoutOrder, 
            Position = v18.Position, 
            Size = v18.Size, 
            Style = "BorderBox"
        }, {
            Shimmer = if v6 then v5.createElement(l_Shimmer_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                CornerRadius = l_Style_0.GridItemCornerRadius, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, -l_ShimmerSizeOffset_0, 1, -l_ShimmerSizeOffset_0)
            }) else v5.createElement(l_Shimmer_0)
        });
    else
        local v27 = nil;
        local v28 = nil;
        if v7() and v18.ShouldCenterTooltip then
            v27 = UDim2.fromScale(0.5, 0.5);
            local v29 = v18.Position.X.Offset + v18.GridItemSize / 2;
            local v30 = v18.Position.Y.Offset + 0.8 * v18.GridItemSize - v18.CanvasPosition.Y;
            if v18.ContainerYBounds then
                v30 = v30 + v18.ContainerYBounds.Min;
            end;
            v28 = Vector2.new(v29, v30);
        end;
        local v31 = nil;
        if v17() then
            v31 = l_Style_0.GridItemBackgroundColor;
            if v18.Applied then
                v31 = l_Style_0.GridItemBackgroundColorApplied;
            end;
            if v7() then
                if v24 and v18.HoverEffectsEnabled then
                    v31 = l_Style_0.GridItemBackgroundColorHovered;
                end;
            elseif v24 then
                v31 = l_Style_0.GridItemBackgroundColorHovered;
            end;
        else
            v31 = if v24 then l_Style_0.GridItemBackgroundColorHovered else l_Style_0.GridItemBackgroundColor;
        end;
        local v32 = if v18.Selected then l_Style_0.GridItemBorderColorSelected else l_Style_0.GridItemBorderColor;
        local function v33() --[[ Line: 178 ]] --[[ Name: onMouseEnter ]]
            -- upvalues: v17 (ref), v18 (copy), v25 (copy)
            if v17() and v18.OnMouseEnter then
                v18.OnMouseEnter();
            end;
            v25(true);
        end;
        local function v34() --[[ Line: 187 ]] --[[ Name: onMouseLeave ]]
            -- upvalues: v17 (ref), v18 (copy), v25 (copy)
            if v17() and v18.OnMouseLeave then
                v18.OnMouseLeave();
            end;
            v25(false);
        end;
        local v35 = {
            MaterialPreview = if v18.CustomPreview then v5.createElement(v18.CustomPreview, {
                Size = UDim2.fromScale(1, 1)
            }) else v5.createElement(v15, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor = v31, 
                InitialDistance = v18.InitialDistance, 
                Material = v18.Material, 
                MaterialPreviewGeometryType = v18.MaterialPreviewGeometryType, 
                MeshPartBackgroundColor = if v17() then l_Style_0.GridItemBackgroundColor else nil, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Static = true, 
                Style = l_Style_0.MaterialPreviewStyle, 
                Transparent = true, 
                ref = if v17() then v19 else nil
            }), 
            Label = if v23 then v22() else nil, 
            UICorner = v5.createElement("UICorner", {
                CornerRadius = l_Style_0.GridItemCornerRadius
            }), 
            UIStroke = v5.createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = v32, 
                Thickness = 1
            }), 
            Tooltip = if not v23 then if v7() then v5.createElement(l_Tooltip_0, {
                AnchorPoint = v27, 
                ContainerXBounds = v18.ContainerXBounds, 
                ContainerYBounds = v18.ContainerYBounds, 
                Enabled = v18.HoverEffectsEnabled, 
                OnTooltipShown = v18.OnTooltipShown, 
                Position = v28, 
                ShowDelay = v18.InstantTooltipEnabled and 0 or v18.TooltipDelay, 
                Text = v18.Text
            }) else v5.createElement(l_Tooltip_0, {
                Text = v18.Text
            }) else nil
        };
        local v36 = nil;
        if v18.OnRenderChildren then
            v36 = v18.OnRenderChildren();
        end;
        return v5.createElement("TextButton", {
            AutoButtonColor = false, 
            BackgroundColor3 = v31, 
            BorderSizePixel = 0, 
            LayoutOrder = v18.LayoutOrder, 
            Position = v18.Position, 
            Size = v18.Size, 
            Text = "", 
            Name = v18.Text, 
            [v5.Event.Activated] = v18.OnClick, 
            [v5.Event.MouseButton2Click] = v18.OnRightClick, 
            [v5.Event.MouseEnter] = v33, 
            [v5.Event.MouseLeave] = v34, 
            [v5.Event.MouseMoved] = if v7() then v18.OnMouseMoved else nil
        }, v3.join(v35, v36));
    end;
end);