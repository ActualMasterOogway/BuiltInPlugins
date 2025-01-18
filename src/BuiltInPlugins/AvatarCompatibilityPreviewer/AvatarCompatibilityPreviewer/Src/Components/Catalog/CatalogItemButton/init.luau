local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v5 = require(l_script_FirstAncestor_0.Src.Resources.BuiltinItems);
local v6 = require(l_script_FirstAncestor_0.Src.Components.ItemDataPreview);
local v7 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v8 = require(l_script_FirstAncestor_0.Src.Util.equippedItemDataEquals);
local v9 = require(l_script_FirstAncestor_0.Src.Util.find);
local v10 = require(l_script_FirstAncestor_0.Src.Util.getItemAccessoryType);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useItemName);
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerClothingTypeIcons);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUI);
local v16 = v14();
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_Localization_0 = v2.ContextServices.Localization;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local function v35(v29) --[[ Line: 39 ]] --[[ Name: getAccessoryTypeDisambiguator ]]
    -- upvalues: v13 (copy), v10 (copy)
    assert(v13(), "FFlagAvatarPreviewerClothingTypeIcons not enabled");
    if #v29.palette.Items == 1 then
        return nil;
    else
        local function v31(v30) --[[ Line: 46 ]] --[[ Name: choiceIsLayeredClothing ]]
            -- upvalues: v10 (ref), v29 (copy)
            return v10({
                palette = v29.palette, 
                item = {
                    source = "builtin", 
                    builtinItem = v30
                }
            }) == "layered";
        end;
        local v32 = v31(v29.palette.Items[1]);
        local v33 = false;
        for v34 = 2, #v29.palette.Items do
            if v31(v29.palette.Items[v34]) ~= v32 then
                v33 = true;
                break;
            end;
        end;
        if not v33 then
            return nil;
        else
            return v10(v29);
        end;
    end;
end;
return function(v36) --[[ Line: 83 ]] --[[ Name: CatalogItemButton ]]
    -- upvalues: l_Analytics_0 (copy), l_Stylizer_0 (copy), v16 (copy), v3 (copy), v4 (copy), v7 (copy), l_Localization_0 (copy), v1 (copy), v8 (copy), v11 (copy), v12 (copy), v13 (copy), v35 (copy), l_showContextMenu_0 (copy), l_script_FirstAncestor_0 (copy), v9 (copy), v5 (copy), l_Button_0 (copy), v15 (copy), l_Pane_0 (copy), v6 (copy), l_StyleModifier_0 (copy), l_Image_0 (copy), l_TextLabel_0 (copy)
    local v37 = l_Analytics_0:use();
    local v38 = l_Stylizer_0:use("CatalogItemButton");
    local v39 = if v16 then v3.useContext(v4.Context) else nil;
    local v40 = v3.useContext(v7);
    local v41 = l_Localization_0:use();
    local v42 = v3.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: v37 (copy), v36 (copy), v40 (copy)
        v37:report("equipItem", v36.ItemData);
        v40.addEquippedItem(v36.ItemData);
    end, {
        v40.addEquippedItem, 
        v36.ItemData
    });
    local v43 = v3.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v37 (copy), v36 (copy), v40 (copy)
        v37:report("unequipItem", v36.ItemData);
        v40.removeEquippedItem(v36.ItemData);
    end, {
        v40.removeEquippedItem, 
        v36.ItemData
    });
    local v45 = v3.useMemo(function() --[[ Line: 102 ]]
        -- upvalues: v1 (ref), v40 (copy), v8 (ref), v36 (copy)
        return v1.find(v40.equippedItems, function(v44) --[[ Line: 103 ]]
            -- upvalues: v8 (ref), v36 (ref)
            return v8(v44, v36.ItemData);
        end);
    end, {
        v36.ItemData, 
        v40.equippedItems
    });
    local v46 = v11(v36.ItemData);
    local v47 = v12(false);
    local v48 = true;
    if v36.ItemData.palette.Key ~= "BodyRangeOfMotion" then
        v48 = true;
        if v36.ItemData.palette.Key ~= "Movement" then
            v48 = v36.ItemData.palette.Key == "BodyEmotes";
        end;
    end;
    local v49 = if v13() then v35(v36.ItemData) else nil;
    local v52 = v3.useCallback(function(_, v51) --[[ Line: 120 ]]
        -- upvalues: v36 (copy), l_showContextMenu_0 (ref), l_script_FirstAncestor_0 (ref), v41 (copy)
        if not v36.IsUserProvided or v51.UserInputType ~= Enum.UserInputType.MouseButton2 then
            return;
        else
            l_showContextMenu_0(l_script_FirstAncestor_0.Parent, {
                {
                    Text = v41:getText("CatalogContextMenu", "DeleteItem"), 
                    OnItemClicked = v36.Delete
                }, 
                {
                    Text = v41:getText("CatalogContextMenu", "DeleteAllItems"), 
                    OnItemClicked = v36.DeleteAll
                }
            });
            return;
        end;
    end, {
        v36.ItemData
    });
    local v53 = false;
    if v16 and #v39.focusedAttachments ~= nil and v36.ItemData.item.source == "builtin" and typeof(v36.ItemData.item.builtinItem) == "number" then
        local v55 = v9(v5.allItems, function(v54) --[[ Line: 145 ]]
            -- upvalues: v36 (copy)
            return v54.id == v36.ItemData.item.builtinItem;
        end);
        local v56 = false;
        if v55 ~= nil then
            v56 = false;
            if v55.attachment ~= nil then
                v56 = table.find(v39.focusedAttachments, v55.attachment) ~= nil;
            end;
        end;
        v53 = v56;
    end;
    local l_createElement_0 = v3.createElement;
    local l_l_Button_0_0 = l_Button_0;
    local v59 = {
        LayoutOrder = v36.LayoutOrder, 
        Size = v36.Size, 
        OnClick = if v45 then v43 else v42, 
        Style = if not not v16 or v15() then v45 and "RoundActive" or v53 and "RoundHighlighted" or "Round" else v45 and "RoundActive" or "Round", 
        Tooltip = if not v48 then v46 else nil
    };
    local v60 = {};
    local l_createElement_1 = v3.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v63 = {
        [v3.Event.InputBegan] = v52, 
        [v3.Event.MouseEnter] = v47.enable, 
        [v3.Event.MouseLeave] = v47.disable, 
        Padding = if v15() then v38.Padding else nil
    };
    local v64 = {
        ItemNamePadding = if v15() then nil else if v46 and v48 then v3.createElement("UIPadding", {
            PaddingBottom = v38.DEPRECATED_ItemNamePaddingBottom
        }) else nil, 
        Preview = v3.createElement(v6, {
            ItemData = v36.ItemData, 
            Selected = v45
        })
    };
    local v65 = false;
    if v36.Delete ~= nil then
        v65 = v47.enabled and v3.createElement(l_Pane_0, {
            AnchorPoint = v38.HoverX.AnchorPoint, 
            Position = v38.HoverX.Position, 
            Size = v38.HoverX.Size
        }, {
            RemoveButton = v3.createElement(l_Button_0, {
                StyleModifier = l_StyleModifier_0.Hover, 
                OnClick = v36.Delete
            }, {
                HoverX = v3.createElement(l_Image_0, {
                    Image = v38.HoverX.Image, 
                    Size = UDim2.fromScale(1, 1)
                })
            })
        });
    end;
    v64.HoverX = v65;
    v64.AccessoryTypeImage = v13() and v49 ~= nil and v3.createElement(l_Pane_0, {
        AnchorPoint = v38.AccessoryTypeImage.AnchorPoint, 
        Position = v38.AccessoryTypeImage.Position, 
        Size = v38.AccessoryTypeImage.Size
    }, {
        Image = v3.createElement(l_Image_0, {
            Image = if v49 == "layered" then v38.AccessoryTypeImage.LayeredImage else v38.AccessoryTypeImage.RigidImage, 
            ImageColor3 = v38.AccessoryTypeImage.Color, 
            Size = UDim2.fromScale(1, 1)
        })
    });
    v64.UserImage = v36.IsUserProvided and v3.createElement(l_Pane_0, {
        AnchorPoint = v38.UserImage.AnchorPoint, 
        Position = v38.UserImage.Position, 
        Size = v38.UserImage.Size
    }, {
        UserImage = v3.createElement(l_Image_0, {
            Image = v38.UserImage.Image, 
            ImageColor3 = v38.UserImage.Color, 
            Size = UDim2.fromScale(1, 1)
        })
    });
    v60.Contents = l_createElement_1(l_l_Pane_0_0, v63, v64);
    v60.ItemName = if v46 and v48 then v3.createElement(l_TextLabel_0, {
        Text = v46, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Bottom, 
        ZIndex = 2
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = if v15() then v38.TextLabelPadding else UDim.new(0, 3), 
            PaddingBottom = if v15() then v38.TextLabelPadding else nil, 
            PaddingRight = if v15() then v38.TextLabelPadding else nil, 
            PaddingTop = if v15() then v38.TextLabelPadding else nil
        })
    }) else nil;
    return l_createElement_0(l_l_Button_0_0, v59, v60);
end;