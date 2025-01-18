local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_useState_0 = v1.useState;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v9 = require(script.Parent.DropdownExpandItem.styles);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v11) --[[ Line: 25 ]] --[[ Name: FlyoutToggleItem ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_useState_0 (copy), v9 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_Image_0 (copy)
    local v12 = l_LayoutOrderIterator_0.new();
    local l_Item_0 = v11.Item;
    local v14, v15 = l_useState_0(l_Item_0.Enabled);
    local l_v9_Attribute_0 = v9:GetAttribute("BaseWidth");
    local l_v9_Attribute_1 = v9:GetAttribute("OffsetWidth");
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v11.LayoutOrder, 
        OnClick = function() --[[ Line: 34 ]] --[[ Name: OnClick ]]
            -- upvalues: v15 (copy), v14 (copy), l_Item_0 (copy)
            v15(not v14);
            if l_Item_0.OnClick then
                l_Item_0.OnClick();
            end;
        end, 
        Size = UDim2.new(0, math.max(l_Item_0.Width, l_v9_Attribute_0) + l_v9_Attribute_1, 0, 0), 
        [v1.Tag] = "FlyoutItem Secondary"
    }, {
        Contents = v1.createElement(l_Pane_0, {
            [v1.Tag] = "Contents"
        }, {
            LabelContainer = v1.createElement(l_Pane_0, {
                LayoutOrder = v12:getNextOrder(), 
                [v1.Tag] = "Label X-Fit"
            }, {
                Label = v1.createElement(l_TextLabel_0, {
                    Text = l_Item_0.Text, 
                    [v1.Tag] = "Left"
                })
            }), 
            IconContainer = v1.createElement(l_Pane_0, {
                LayoutOrder = v12:getNextOrder(), 
                [v1.Tag] = ("Icon %*"):format(v14 and "Checkmark" or "")
            }, {
                Icon = v1.createElement(l_Image_0, {
                    LayoutOrder = v12:getNextOrder(), 
                    [v1.Tag] = "Icon16 X-AnchorCenter"
                })
            })
        })
    });
end;