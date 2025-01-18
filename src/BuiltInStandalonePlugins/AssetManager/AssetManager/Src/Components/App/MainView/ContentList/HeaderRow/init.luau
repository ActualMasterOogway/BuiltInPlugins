local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_SplitPane_0 = l_UI_0.SplitPane;
local v9 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useColumns);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useSortFilter);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v13 = require(script.Parent.styles);
local function _(v14, v15) --[[ Line: 34 ]] --[[ Name: getStyleForSelected ]]
    if v14 and v14.Key == v15 then
        if v14.IsAscending then
            return "Bold", "Ascending";
        else
            return "Bold", "Descending";
        end;
    else
        return "", "";
    end;
end;
local function v27(v17, v18, v19, v20) --[[ Line: 45 ]] --[[ Name: getColumns ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_Image_0 (copy)
    local v21 = {};
    for v22, v23 in v18 do
        local v24 = v17[1];
        local v25, v26;
        if v24 and v24.Key == v23 then
            if v24.IsAscending then
                v25 = "Bold";
                v26 = "Ascending";
            else
                v25 = "Bold";
                v26 = "Descending";
            end;
        else
            v25 = "";
            v26 = "";
        end;
        v21[v22] = v1.createElement(l_Pane_0, {
            LayoutOrder = v22, 
            [v1.Tag] = "X-PadS"
        }, {
            ColumnHeader = v1.createElement(l_Pane_0, {
                OnClick = function() --[[ Line: 59 ]] --[[ Name: OnClick ]]
                    -- upvalues: v19 (copy), v23 (copy)
                    v19:addSort(v23);
                end, 
                OnRightClick = function() --[[ Line: 62 ]] --[[ Name: OnRightClick ]]
                    -- upvalues: v19 (copy), v20 (copy)
                    v19:handleSortRightClick(v20);
                end, 
                [v1.Tag] = "X-Row X-Left X-Middle"
            }, {
                Text = v1.createElement(l_TextLabel_0, {
                    LayoutOrder = 1, 
                    Text = v20:getText("AssetProperty", v23), 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    [v1.Tag] = ("X-Fit %*"):format(v25)
                }), 
                ArrowIcon = if v25 ~= "" then v1.createElement(l_Image_0, {
                    LayoutOrder = 2, 
                    [v1.Tag] = ("%* Icon16"):format(v26)
                }) else nil
            })
        });
    end;
    return v21;
end;
return function(v28) --[[ Line: 85 ]] --[[ Name: HeaderRow ]]
    -- upvalues: l_Localization_0 (copy), v9 (copy), v11 (copy), v10 (copy), v27 (copy), v13 (copy), v1 (copy), l_Pane_0 (copy), l_SplitPane_0 (copy)
    local v29 = l_Localization_0.use();
    local v30 = v9.use();
    local v31 = v11(v30);
    local v32, v33 = v10(v30);
    local v34 = v27(v31, v32, v30, v29);
    local v35 = {};
    for v36, _ in v34 do
        v35[v36] = v13:GetAttribute("ColumnMinSize");
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v28.LayoutOrder, 
        OnRightClick = function() --[[ Line: 99 ]] --[[ Name: OnRightClick ]]
            -- upvalues: v30 (copy), v29 (copy)
            v30:handleSortRightClick(v29);
        end, 
        ZIndex = 2, 
        [v1.Tag] = "HeaderRow"
    }, {
        Contents = v1.createElement(l_SplitPane_0, {
            UseScale = false, 
            ClampSize = false, 
            HideBars = true, 
            MinSizes = v35, 
            Sizes = v33, 
            OnSizesChange = function(v38) --[[ Line: 111 ]] --[[ Name: OnSizesChange ]]
                -- upvalues: v30 (copy)
                v30:setColumnWidths(v38);
            end, 
            [v1.Tag] = "HeaderRow Contrast X-Stroke"
        }, v34)
    });
end;