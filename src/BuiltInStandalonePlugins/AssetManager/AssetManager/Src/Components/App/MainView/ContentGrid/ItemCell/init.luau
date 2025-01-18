local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v8 = require(l_script_FirstAncestor_0.Src.Components.Shared.AssetThumbnail);
local v9 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useItems);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useItemSelection);
local l_useState_0 = v1.useState;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_DoubleClickDetector_0 = v2.Util.DoubleClickDetector;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_GetTextSize_0 = v2.Util.GetTextSize;
local v17 = require(script.styles);
return function(v18) --[[ Line: 40 ]] --[[ Name: ItemCell ]]
    -- upvalues: l_useState_0 (copy), l_DoubleClickDetector_0 (copy), l_LayoutOrderIterator_0 (copy), l_Localization_0 (copy), v9 (copy), v11 (copy), v10 (copy), l_GetTextSize_0 (copy), v17 (copy), v1 (copy), l_Pane_0 (copy), v8 (copy), l_TextLabel_0 (copy), l_Tooltip_0 (copy)
    local v19 = l_useState_0(l_DoubleClickDetector_0.new());
    local v20 = l_LayoutOrderIterator_0.new();
    local v21 = l_Localization_0.use();
    local v22 = v9.use();
    local l_Cell_0 = v18.Cell;
    local v24 = v11(v22);
    local v25 = v10(v22);
    local v26 = "";
    if v24[l_Cell_0.AssetId] then
        v26 = "SelectedCell";
    end;
    local v27 = false;
    if l_GetTextSize_0(v18.Cell.DisplayName).X > v18.Size.X.Offset - v17:GetAttribute("CellTagPadding") * 2 then
        v27 = true;
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v18.Key, 
        Size = v18.Size, 
        Position = v18.Position, 
        OnClick = function() --[[ Line: 63 ]] --[[ Name: OnClick ]]
            -- upvalues: v22 (copy), l_Cell_0 (copy), v25 (copy), v18 (copy), v19 (copy)
            v22:handleClick(l_Cell_0.AssetId, v25, v18.Key, v19:isDoubleClick());
        end, 
        OnRightClick = function() --[[ Line: 66 ]] --[[ Name: OnRightClick ]]
            -- upvalues: v22 (copy), l_Cell_0 (copy), v18 (copy), v21 (copy)
            v22:handleRightClick(l_Cell_0.AssetId, v18.Key, v21);
        end, 
        [v1.Tag] = "ItemCell X-Top X-Center X-ColumnS"
    }, {
        ThumbnailContainer = v1.createElement(l_Pane_0, {
            [v1.Tag] = ("ThumbnailContainer Secondary X-Corner X-Pad X-Center X-Middle %*"):format(v26)
        }, {
            Thumbnail = v1.createElement(v8, {
                AssetId = l_Cell_0.AssetId
            })
        }), 
        TagContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = v20:getNextOrder(), 
            [v1.Tag] = "TagContainer X-Column X-Left X-Middle"
        }, {
            NameTag = v1.createElement(l_TextLabel_0, {
                LayoutOrder = v20:getNextOrder(), 
                Text = v18.Cell.DisplayName, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                [v1.Tag] = "Left"
            }, {
                Tooltip = if v27 then v1.createElement(l_Tooltip_0, {
                    Text = v18.Cell.DisplayName
                }) else nil
            }), 
            TypeTag = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v20:getNextOrder(), 
                Text = v21:getText("AssetType", l_Cell_0.AssetType), 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                [v1.Tag] = "Body"
            })
        })
    });
end;