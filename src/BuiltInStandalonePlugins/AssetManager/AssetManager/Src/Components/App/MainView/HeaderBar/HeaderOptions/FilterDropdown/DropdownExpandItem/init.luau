local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v8 = require(script.Parent.FlyoutToggleItem);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v10 = require(script.styles);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v12(v13) --[[ Line: 28 ]] --[[ Name: DropdownExpandItem ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), v8 (copy), v12 (copy), v10 (copy), l_Pane_0 (copy), l_DropdownMenu_0 (copy), l_TextLabel_0 (copy), l_Image_0 (copy)
    local v14 = l_LayoutOrderIterator_0.new();
    local l_Item_0 = v13.Item;
    local function v18(v16, v17) --[[ Line: 32 ]] --[[ Name: onRenderChildItem ]]
        -- upvalues: v1 (ref), v8 (ref), v12 (ref)
        if v16.Component then
            return v16:Component(v17);
        elseif v16.Items == nil or next(v16.Items) == nil then
            return v1.createElement(v8, {
                Item = v16, 
                LayoutOrder = v17
            });
        else
            return v1.createElement(v12, {
                Item = v16, 
                LayoutOrder = v17
            });
        end;
    end;
    local l_v10_Attribute_0 = v10:GetAttribute("BaseWidth");
    local l_v10_Attribute_1 = v10:GetAttribute("OffsetWidth");
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v13.LayoutOrder, 
        Size = UDim2.new(0, math.max(l_Item_0.Width, l_v10_Attribute_0) + l_v10_Attribute_1, 0, 0), 
        [v1.Event.MouseEnter] = function() --[[ Line: 52 ]]
            -- upvalues: v13 (copy)
            if v13.OnHover then
                v13.OnHover();
            end;
        end, 
        [v1.Tag] = "FlyoutItem Secondary"
    }, {
        Menu = v1.createElement(l_DropdownMenu_0, {
            UseAutoWidth = true, 
            DropFromSide = true, 
            Hide = not v13.Hovered, 
            OnRenderItem = v18, 
            OnItemActivated = function() --[[ Line: 64 ]] --[[ Name: OnItemActivated ]]

            end, 
            OnFocusLost = function() --[[ Line: 67 ]] --[[ Name: OnFocusLost ]]
                -- upvalues: v13 (copy)
                if v13.OnFocusLost then
                    v13.OnFocusLost();
                end;
            end, 
            Items = l_Item_0.Items
        }), 
        Contents = v1.createElement(l_Pane_0, {
            [v1.Tag] = "Contents"
        }, {
            LabelContainer = v1.createElement(l_Pane_0, {
                LayoutOrder = v14:getNextOrder(), 
                [v1.Tag] = "Label X-Fit"
            }, {
                Label = v1.createElement(l_TextLabel_0, {
                    Text = l_Item_0.Text, 
                    [v1.Tag] = "Left"
                })
            }), 
            IconContainer = v1.createElement(l_Pane_0, {
                LayoutOrder = v14:getNextOrder(), 
                [v1.Tag] = "Icon Arrow"
            }, {
                Icon = v1.createElement(l_Image_0, {
                    LayoutOrder = v14:getNextOrder(), 
                    [v1.Tag] = "Icon16 X-AnchorCenter"
                })
            })
        })
    });
end;
return v12;