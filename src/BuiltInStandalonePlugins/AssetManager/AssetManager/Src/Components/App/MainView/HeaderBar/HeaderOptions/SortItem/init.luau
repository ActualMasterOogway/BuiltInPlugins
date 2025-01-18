local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useSortFilter);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(script.styles);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local function _(v13, v14) --[[ Line: 36 ]] --[[ Name: getStyleForSelected ]]
    if v13 and v13.Key == v14 then
        if v13.IsAscending then
            return "Bold", "ArrowUp";
        else
            return "Bold", "ArrowDown";
        end;
    else
        return "", "";
    end;
end;
return function(v16) --[[ Line: 47 ]] --[[ Name: SortItem ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_Localization_0 (copy), v8 (copy), v9 (copy), v1 (copy), l_Pane_0 (copy), v11 (copy), l_TextLabel_0 (copy), l_Image_0 (copy)
    local v17 = l_LayoutOrderIterator_0.new();
    local v18 = l_Localization_0.use();
    local v19 = v8.use();
    local v20 = v9(v19)[1];
    local l_Item_0 = v16.Item;
    local v22, v23;
    if v20 and v20.Key == l_Item_0 then
        if v20.IsAscending then
            v22 = "Bold";
            v23 = "ArrowUp";
        else
            v22 = "Bold";
            v23 = "ArrowDown";
        end;
    else
        v22 = "";
        v23 = "";
    end;
    v20 = v18:getText("AssetProperty", v16.Item);
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v16.LayoutOrder, 
        OnClick = v16.Activated, 
        Size = v11:GetAttribute("SortItemSize"), 
        [v1.Tag] = "SortItem X-Fit Secondary X-Row X-Left X-Middle"
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            LayoutOrder = v17:getNextOrder(), 
            Text = v20, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            [v1.Tag] = ("X-Fit Left X-Pad %*"):format(v22)
        }), 
        ArrowIcon = if v22 ~= "" then v1.createElement(l_Image_0, {
            LayoutOrder = v17:getNextOrder(), 
            [v1.Tag] = ("Icon16 %*"):format(v23)
        }) else nil
    });
end;