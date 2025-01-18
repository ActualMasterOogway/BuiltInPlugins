local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v7 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v10 = require(script.Parent.DropdownExpandItem.styles);
return function(v11) --[[ Line: 29 ]] --[[ Name: ResetFilters ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v7 (copy), l_Localization_0 (copy), v10 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local v12 = l_LayoutOrderIterator_0.new();
    local v13 = v7.use();
    local v14 = l_Localization_0.use();
    local l_Item_0 = v11.Item;
    local l_v10_Attribute_0 = v10:GetAttribute("BaseWidth");
    local l_v10_Attribute_1 = v10:GetAttribute("OffsetWidth");
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v11.LayoutOrder, 
        OnClick = function() --[[ Line: 39 ]] --[[ Name: OnClick ]]
            -- upvalues: v13 (copy)
            v13:clearFilters();
        end, 
        Size = UDim2.new(0, math.max(l_Item_0.Width, l_v10_Attribute_0) + l_v10_Attribute_1, 0, 0), 
        [v1.Event.MouseEnter] = function() --[[ Line: 43 ]]
            -- upvalues: v11 (copy)
            if v11.OnHover then
                v11.OnHover();
            end;
        end, 
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
                    Text = v14:getText("Filters", "ResetFilters"), 
                    [v1.Tag] = "Left"
                })
            })
        })
    });
end;