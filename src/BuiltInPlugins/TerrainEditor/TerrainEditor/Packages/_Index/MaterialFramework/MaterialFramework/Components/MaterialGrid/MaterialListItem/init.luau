local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Types);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Framework);
local v4 = require(l_Parent_1.React);
local l_forwardRef_0 = v4.forwardRef;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_Shimmer_0 = l_UI_0.Shimmer;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v11 = require(l_Parent_0.Components.MaterialPreview);
local v12 = require(l_Parent_0.Flags.getFFlagMaterialPickerUIChanges);
return (l_forwardRef_0(function(v13, v14) --[[ Line: 65 ]]
    -- upvalues: v12 (copy), v4 (copy), l_Pane_0 (copy), l_Shimmer_0 (copy), l_Button_0 (copy), v11 (copy), l_TextLabel_0 (copy)
    local l_Style_0 = v13.Style;
    local l_Offset_0 = v13.Size.Y.Offset;
    local l_ListItemSpacing_0 = l_Style_0.ListItemSpacing;
    local v18 = UDim2.new(1, -(l_Offset_0 + l_ListItemSpacing_0), 1, 0);
    local v19 = nil;
    v19 = if v12() then v13.Selected and v13.Applied and "RoundActiveApplied" or v13.Selected and "RoundActive" or v13.Applied and "RoundApplied" or "Round" else v13.Selected and "RoundActive" or "Round";
    if v13.Loading then
        return v4.createElement(l_Pane_0, {
            ClipsDescendants = true, 
            LayoutOrder = v13.LayoutOrder, 
            Position = v13.Position, 
            Size = UDim2.new(1, -10, 0, l_Offset_0), 
            Style = "CornerBox"
        }, {
            Shimmer = v4.createElement(l_Shimmer_0)
        });
    else
        return v4.createElement(l_Button_0, {
            LayoutOrder = v13.LayoutOrder, 
            OnClick = v13.OnClick, 
            OnRightClick = v13.OnRightClick, 
            OnMouseEnter = v13.OnMouseEnter, 
            OnMouseLeave = v13.OnMouseLeave, 
            Position = v13.Position, 
            Size = UDim2.new(1, -10, 0, l_Offset_0), 
            Style = v19
        }, {
            Content = v4.createElement(l_Pane_0, {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Horizontal, 
                Spacing = l_ListItemSpacing_0
            }, {
                MaterialPreview = if v13.CustomPreview then v4.createElement(v13.CustomPreview, {
                    Size = UDim2.fromOffset(l_Offset_0, l_Offset_0)
                }) else v4.createElement(v11, {
                    InitialDistance = v13.InitialDistance, 
                    LayoutOrder = 1, 
                    Material = v13.Material, 
                    MeshPartBackgroundColor = if v12() then l_Style_0.ListItemBackgroundColor else nil, 
                    Size = UDim2.fromOffset(l_Offset_0, l_Offset_0), 
                    Static = true, 
                    Transparent = true, 
                    ref = v14
                }), 
                Label = v4.createElement(l_TextLabel_0, {
                    LayoutOrder = 2, 
                    Size = v18, 
                    Text = v13.Text, 
                    TextSize = l_Style_0.TextSize, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextWrapped = false
                })
            })
        });
    end;
end));