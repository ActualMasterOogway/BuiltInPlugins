local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.EquippedItemsSidebar.EquippedItemSideMenu);
local v4 = require(l_script_FirstAncestor_0.Src.Components.ItemDataPreview);
local v5 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v6 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUI);
local l_UI_0 = v1.UI;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_Pane_0 = l_UI_0.Pane;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_StyleModifier_0 = v1.Util.StyleModifier;
return function(v18) --[[ Line: 40 ]] --[[ Name: EquippedItemPreview ]]
    -- upvalues: l_Localization_0 (copy), l_Stylizer_0 (copy), v2 (copy), v10 (copy), v6 (copy), v5 (copy), v7 (copy), l_showContextMenu_0 (copy), l_script_FirstAncestor_0 (copy), l_Pane_0 (copy), l_StyleModifier_0 (copy), v11 (copy), l_UI_0 (copy), v4 (copy), v3 (copy)
    local v19 = l_Localization_0:use();
    local v20 = l_Stylizer_0:use("EquippedItemPreview");
    local v21 = v2.useContext(if v10() then v6.Context else v5);
    local v22 = v2.useContext(v7);
    local v23, v24 = v2.useState(false);
    local v25 = v2.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v21 (copy), v18 (copy)
        v21.openPalette(v18.ItemData.palette.Key);
    end, {
        v18.ItemData, 
        v21.openPalette
    });
    local v26 = v2.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: v22 (copy), v18 (copy)
        v22.removeEquippedItem(v18.ItemData);
    end, {
        v18.ItemData, 
        v22.removeEquippedItem
    });
    v2.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v23 (copy), v21 (copy)
        if not v23 then
            return nil;
        else
            v21.incrementDummyPreviewLock();
            return function() --[[ Line: 70 ]]
                -- upvalues: v21 (ref)
                v21.decrementDummyPreviewLock();
            end;
        end;
    end, {
        v23
    });
    local v27, v28 = v2.useState(Vector2.new());
    local v31 = v2.useCallback(function(_, v30) --[[ Line: 77 ]]
        -- upvalues: v28 (copy), l_showContextMenu_0 (ref), l_script_FirstAncestor_0 (ref), v19 (copy), v18 (copy), v25 (copy), v26 (copy), v22 (copy), v24 (copy)
        if v30.UserInputType == Enum.UserInputType.MouseButton1 then
            v28(Vector2.new(v30.Position.X, v30.Position.Y));
            return;
        elseif v30.UserInputType == Enum.UserInputType.MouseButton2 then
            l_showContextMenu_0(l_script_FirstAncestor_0.Parent, {
                {
                    Text = v19:getText("EquippedItemContextMenu", "OpenPalette", {
                        palette = v19:getText("AssetPalettes", v18.ItemData.palette.Key)
                    }), 
                    OnItemClicked = v25
                }, 
                {
                    ShowSeparator = true
                }, 
                {
                    Text = v19:getText("EquippedItemContextMenu", "UnequipItem"), 
                    OnItemClicked = v26
                }, 
                {
                    Text = v19:getText("EquippedItemContextMenu", "UnequipAllItems"), 
                    OnItemClicked = v22.removeAllEquippedItems
                }
            });
            return;
        else
            if v30.UserInputType == Enum.UserInputType.MouseMovement then
                v24(true);
            end;
            return;
        end;
    end, {
        v18.ItemData, 
        v25, 
        v26
    });
    local v34 = v2.useCallback(function(_, v33) --[[ Line: 108 ]]
        -- upvalues: v24 (copy), v27 (copy), v25 (copy)
        if v33.UserInputType == Enum.UserInputType.MouseMovement then
            v24(false);
            return;
        else
            if v33.UserInputType == Enum.UserInputType.MouseButton1 and (Vector2.new(v33.Position.X, v33.Position.Y) - v27).Magnitude < 4 then
                v25();
            end;
            return;
        end;
    end, {
        v27
    });
    return v2.createElement(l_Pane_0, {
        Style = "EquippedItemPreview", 
        StyleModifier = if v23 then l_StyleModifier_0.Hover else if v18.ItemData.isHidden then l_StyleModifier_0.Disabled else nil, 
        LayoutOrder = v18.LayoutOrder, 
        Position = v18.Position, 
        Size = v18.Size, 
        [v2.Event.InputBegan] = v31, 
        [v2.Event.InputEnded] = v34, 
        [v2.Tag] = "data-testid=EquippedItemPreview"
    }, {
        UICorner = if v11() then v2.createElement("UICorner", {
            CornerRadius = v20.CornerRadius + UDim.new(0, v20.StrokeThickness)
        }) else nil, 
        Inner = v2.createElement(l_Pane_0, {
            Style = "EquippedItemPreviewInner", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, -v20.StrokeThickness, 1, -v20.StrokeThickness)
        }, {
            UIStroke = v2.createElement("UIStroke", {
                Color = v20.StrokeColor, 
                Thickness = v20.StrokeThickness
            }), 
            UICorner = if v11() then v2.createElement("UICorner", {
                CornerRadius = v20.CornerRadius
            }) else nil, 
            HoverX = if not v23 or v18.IsDragging then nil else v2.createElement(l_Pane_0, {
                AnchorPoint = v20.HoverX.AnchorPoint, 
                Position = v20.HoverX.Position, 
                Size = v20.HoverX.Size, 
                OnClick = v26
            }, {
                HoverX = v2.createElement(l_UI_0.Image, {
                    Image = v20.HoverX.Image, 
                    Size = UDim2.fromScale(1, 1)
                })
            }), 
            Preview = v2.createElement(v4, {
                ItemData = v18.ItemData, 
                Selected = false, 
                Transparency = if v18.ItemData.isHidden then v20.ItemHiddenTransparency else v20.ItemWornTransparency
            })
        }), 
        Outer = v2.createElement(v3, {
            ItemData = v18.ItemData, 
            tileHovered = v23
        })
    });
end;