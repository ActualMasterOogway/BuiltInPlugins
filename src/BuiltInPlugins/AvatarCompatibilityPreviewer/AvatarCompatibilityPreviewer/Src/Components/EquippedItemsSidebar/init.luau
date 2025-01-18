local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(script.EquippedItemPreview);
local v4 = require(script.Parent.ResetCameraButton);
local v5 = require(l_script_FirstAncestor_0.Src.Components.DraggableTileList);
local v6 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.getItemAccessoryType);
local v8 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_isLayeredClothing);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerClothingTypeIcons);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUI);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Analytics_0 = v1.ContextServices.Analytics;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v19) --[[ Line: 34 ]] --[[ Name: EquippedItemsSidebar ]]
    -- upvalues: l_Analytics_0 (copy), l_Stylizer_0 (copy), v2 (copy), v6 (copy), l_LayoutOrderIterator_0 (copy), v11 (copy), v7 (copy), v8 (copy), v3 (copy), l_Pane_0 (copy), v12 (copy), v4 (copy), v5 (copy), l_ScrollingFrame_0 (copy)
    local v20 = l_Analytics_0:use();
    local v21 = l_Stylizer_0:use("EquippedItemsSidebar");
    local v22 = v2.useContext(v6);
    local v23 = {};
    local v24 = {};
    local v25 = l_LayoutOrderIterator_0.new();
    for _, v27 in v22.equippedItems do
        if if v11() then v7(v27) == "layered" else v8(v27) then
            table.insert(v23, 1, v27);
        else
            table.insert(v24, v2.createElement(v3, {
                ItemData = v27, 
                LayoutOrder = v25:getNextOrder(), 
                Size = v21.CellSize
            }));
        end;
    end;
    local v28, v29 = v2.useState(Vector2.new());
    local v32 = v2.useCallback(function(v30, v31) --[[ Line: 66 ]]
        -- upvalues: v20 (copy), v19 (copy), v23 (copy)
        v20:report("changedLayers");
        v19.OnClothingLayerOrderChanged(#v23 - v30 + 1, #v23 - v31 + 1);
    end, {
        v19.OnClothingLayerOrderChanged, 
        #v23
    });
    return v2.createElement(l_Pane_0, {
        AnchorPoint = if v12() then Vector2.new(1, 0) else Vector2.new(1, 1), 
        Position = if v12() then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 1) - v21.DEPRECATED_PositionOffset, 
        Size = v21.Size, 
        AutomaticSize = if v12() then Enum.AutomaticSize.XY else nil, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = v21.SidebarSpacing, 
        HorizontalAlignment = if v12() then Enum.HorizontalAlignment.Right else nil, 
        VerticalAlignment = if v12() then Enum.VerticalAlignment.Top else nil
    }, {
        Contents = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = if v12() then Enum.VerticalAlignment.Top else nil, 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = v21.SidebarSpacing, 
            Padding = if v12() then {
                Top = v21.SidebarPadding, 
                Left = v21.SidebarPadding, 
                Right = v21.SidebarPadding
            } else nil, 
            [v2.Change.AbsoluteSize] = function(v33) --[[ Line: 103 ]]
                -- upvalues: v29 (copy)
                v29(v33.AbsoluteSize);
            end
        }, {
            ResetCameraButton = v2.createElement(v4, {
                LayoutOrder = v25:getNextOrder()
            }), 
            LayeredClothingEquipment = v2.createElement(v5, {
                cellSize = v21.CellSize, 
                spacing = if v12() then v21.ItemSpacing else nil, 
                layoutOrder = v25:getNextOrder(), 
                tiles = v23, 
                render = function(v34, v35) --[[ Line: 117 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v3 (ref)
                    return v2.createElement(v3, {
                        ItemData = v34, 
                        Size = UDim2.fromScale(1, 1), 
                        IsDragging = v35
                    }), tostring(v34.palette) .. "/" .. tostring(v34.item);
                end, 
                move = v32
            })
        }), 
        OtherEquipment = v2.createElement(l_ScrollingFrame_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            AutoSizeCanvas = false, 
            AutomaticCanvasSize = if v12() then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            LayoutOrder = v25:getNextOrder(), 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = v21.ItemSpacing, 
            ScrollBarThickness = if v12() then v21.ScrollBarThickness else nil, 
            Padding = if v12() then {
                Right = v21.SidebarPadding, 
                Left = -v21.SidebarPadding
            } else nil, 
            Size = if v12() then UDim2.new(1, 0, 1, -v28.Y - v21.SidebarSpacing - 0.5 * v21.SidebarPadding) else UDim2.new(0, v21.CellSize.X.Offset + v21.FrameSizeOffset, 1, -v28.Y), 
            ScrollingFrameSize = UDim2.new(0, v21.ScrollingFrameSizeOffset, 1, 0)
        }, v24)
    });
end;