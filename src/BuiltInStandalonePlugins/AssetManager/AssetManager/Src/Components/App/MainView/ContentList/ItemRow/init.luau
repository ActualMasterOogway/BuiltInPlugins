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
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useColumns);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useItems);
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useItemSelection);
local l_useState_0 = v1.useState;
local v14 = require(l_script_FirstAncestor_0.Src.Types);
local l_DoubleClickDetector_0 = v2.Util.DoubleClickDetector;
local l_GetTextSize_0 = v2.Util.GetTextSize;
local v17 = require(script.styles);
local function v22(v18, v19, v20) --[[ Line: 38 ]] --[[ Name: getTextForProperty ]]
    -- upvalues: v14 (copy)
    local v21 = v18[v19];
    if v19 == v14.AssetInfoField.Creator then
        if v21.Name ~= "" then
            return v21.Name;
        else
            return v21.Id;
        end;
    elseif v19 == v14.AssetInfoField.Modified or v19 == v14.AssetInfoField.Created then
        return v21:FormatLocalTime("lll", "en-us");
    elseif v19 == v14.AssetInfoField.AssetType then
        return v20:getText("AssetType", v21);
    else
        return (tostring(v21));
    end;
end;
local function v35(v23, v24, v25) --[[ Line: 55 ]] --[[ Name: buildRowElements ]]
    -- upvalues: v10 (copy), v22 (copy), l_GetTextSize_0 (copy), v17 (copy), v1 (copy), l_Tooltip_0 (copy), l_Pane_0 (copy), v8 (copy), l_TextLabel_0 (copy)
    local v26 = {};
    local v27, v28 = v10(v24);
    for v29, v30 in v27 do
        local v31 = v22(v23, v30, v25);
        local l_Offset_0 = v28[v29].Offset;
        local v33 = if l_GetTextSize_0(v31).X > l_Offset_0 - v17:GetAttribute("CellContentPadding") * 2 then v1.createElement(l_Tooltip_0, {
            Text = v31
        }) else nil;
        if v29 == 1 then
            local v34 = l_Offset_0 - v17:GetAttribute("ThumbnailSize") - v17:GetAttribute("CellContentPadding");
            v26[v29] = v1.createElement(l_Pane_0, {
                LayoutOrder = v29, 
                Size = UDim2.new(0, l_Offset_0, 1, 0), 
                [v1.Tag] = "ThumbnailPadding X-Row X-Left X-Middle"
            }, {
                ThumbnailContainer = v1.createElement(l_Pane_0, {
                    LayoutOrder = 1, 
                    [v1.Tag] = "ThumbnailContainer Secondary X-Corner X-Center X-Middle X-PadS"
                }, {
                    Thumbnail = v1.createElement(v8, {
                        AssetId = v23.AssetId
                    })
                }), 
                AssetName = v1.createElement(l_TextLabel_0, {
                    LayoutOrder = 2, 
                    Text = v31, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Size = UDim2.new(0, v34, 0, 0), 
                    [v1.Tag] = "Left X-FitY"
                }, {
                    Tooltip = v33
                })
            });
        else
            v26[v29] = v1.createElement(l_TextLabel_0, {
                LayoutOrder = v29, 
                Text = v31, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Size = UDim2.new(0, l_Offset_0, 1, 0), 
                [v1.Tag] = "Left"
            }, {
                Tooltip = v33
            });
        end;
    end;
    return v26;
end;
return function(v36) --[[ Line: 113 ]] --[[ Name: ItemRow ]]
    -- upvalues: l_useState_0 (copy), l_DoubleClickDetector_0 (copy), l_Localization_0 (copy), v9 (copy), v12 (copy), v11 (copy), v35 (copy), v1 (copy), l_Pane_0 (copy)
    local v37 = l_useState_0(l_DoubleClickDetector_0.new());
    local v38 = l_Localization_0.use();
    local v39 = v9.use();
    local l_AssetInfo_0 = v36.AssetInfo;
    local v41 = v12(v39);
    local v42 = v11(v39);
    local v43 = v36.Key % 2 == 0 and "ContrastRow" or "";
    if v41[l_AssetInfo_0.AssetId] then
        v43 = "SelectedRow";
    end;
    local v44 = v35(l_AssetInfo_0, v39, v38);
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v36.Key, 
        Position = v36.Position, 
        OnClick = function() --[[ Line: 131 ]] --[[ Name: OnClick ]]
            -- upvalues: v39 (copy), l_AssetInfo_0 (copy), v42 (copy), v36 (copy), v37 (copy)
            v39:handleClick(l_AssetInfo_0.AssetId, v42, v36.Key, v37:isDoubleClick());
        end, 
        OnRightClick = function() --[[ Line: 134 ]] --[[ Name: OnRightClick ]]
            -- upvalues: v39 (copy), l_AssetInfo_0 (copy), v36 (copy), v38 (copy)
            v39:handleRightClick(l_AssetInfo_0.AssetId, v36.Key, v38);
        end, 
        [v1.Tag] = ("ItemRow X-FitX X-Row X-Left X-Middle %*"):format(v43)
    }, {
        v44
    });
end;