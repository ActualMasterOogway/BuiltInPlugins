local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_IconButton_0 = v1.UI.IconButton;
local _ = v1.UI.Image;
local l_Pane_0 = v1.UI.Pane;
local _ = v1.UI.TextLabel;
local v11 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v13 = require(l_script_FirstAncestor_0.Src.Util.getItems);
local v14 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v15 = require(l_script_FirstAncestor_0.Src.Types);
local l_EnumType_0 = v15.EnumType;
local l_TerrainType_0 = v15.TerrainType;
local function _(v18, v19, v20) --[[ Line: 35 ]] --[[ Name: getItemsPerRow ]]
    return (math.clamp(math.floor(v18 / v19), 1, v20));
end;
return function(v22) --[[ Line: 39 ]] --[[ Name: TerrainTypeRenderer ]]
    -- upvalues: l_Localization_0 (copy), v11 (copy), l_useMemo_0 (copy), v13 (copy), l_EnumType_0 (copy), l_Stylizer_0 (copy), l_useState_0 (copy), v14 (copy), l_TerrainType_0 (copy), v2 (copy), l_Pane_0 (copy), l_IconButton_0 (copy)
    local v23 = l_Localization_0:use();
    local v24 = v11:use();
    local v25 = l_useMemo_0(function() --[[ Line: 42 ]]
        -- upvalues: v13 (ref), v23 (copy), l_EnumType_0 (ref)
        return v13(v23, nil, l_EnumType_0.TerrainType);
    end);
    local v26 = l_Stylizer_0:use("TerrainTypeRenderer");
    local l_l_useState_0_0 = l_useState_0;
    local v28 = v24:getPluginWidth();
    local l_ItemMinWidth_0 = v26.ItemMinWidth;
    local l_ItemsPerRow_0 = v26.ItemsPerRow;
    local v31;
    l_l_useState_0_0, v31 = l_l_useState_0_0((math.clamp(math.floor(v28 / l_ItemMinWidth_0), 1, l_ItemsPerRow_0)));
    v14(v24.PluginWidth, function(v32) --[[ Line: 49 ]]
        -- upvalues: v31 (copy), v26 (copy)
        local l_v31_0 = v31;
        local l_ItemMinWidth_1 = v26.ItemMinWidth;
        local l_ItemsPerRow_1 = v26.ItemsPerRow;
        l_v31_0((math.clamp(math.floor(v32 / l_ItemMinWidth_1), 1, l_ItemsPerRow_1)));
    end, {
        v31
    });
    v28 = {};
    l_ItemMinWidth_0 = {};
    l_ItemsPerRow_0 = 0;
    local v36 = 1;
    for _, v38 in v25 do
        local l_Id_0 = v38.Id;
        if l_Id_0 ~= l_TerrainType_0.None then
            local l_Label_0 = v38.Label;
            v36 = math.floor(l_ItemsPerRow_0 / l_l_useState_0_0) + 1;
            local v41 = l_ItemsPerRow_0 % l_l_useState_0_0 + 1;
            l_ItemMinWidth_0[l_Id_0] = v2.createElement(l_Pane_0, {
                LayoutOrder = v41, 
                Size = UDim2.new(1 / l_l_useState_0_0, -v26.Spacing * ((l_l_useState_0_0 - 1) / l_l_useState_0_0), 0, v26.Height)
            }, {
                Button = v2.createElement(l_IconButton_0, {
                    BorderColor = if l_Id_0 == v22.Value then v26.BorderColor else nil, 
                    IconSize = v26.IconSize, 
                    LeftIcon = ("rbxasset://textures/TerrainEditor/%*.png"):format((string.lower(l_Id_0))), 
                    OnClick = function() --[[ Line: 77 ]] --[[ Name: OnClick ]]
                        -- upvalues: v22 (copy), l_Id_0 (copy), l_TerrainType_0 (ref)
                        if v22.Value == l_Id_0 then
                            v22.OnChanged(l_TerrainType_0.None);
                            return;
                        else
                            v22.OnChanged(l_Id_0);
                            return;
                        end;
                    end, 
                    Size = UDim2.fromScale(1, 1), 
                    Text = l_Label_0
                })
            });
            if v41 == l_l_useState_0_0 then
                v28[("Row%*"):format(v36)] = v2.createElement(l_Pane_0, {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Horizontal, 
                    LayoutOrder = v36, 
                    Size = UDim2.new(1, 0, 0, v26.Height), 
                    Spacing = v26.Spacing
                }, l_ItemMinWidth_0);
                l_ItemMinWidth_0 = {};
            end;
            l_ItemsPerRow_0 = l_ItemsPerRow_0 + 1;
        end;
    end;
    if next(l_ItemMinWidth_0) then
        v28.FinalRow = v2.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v36, 
            Size = UDim2.new(1, 0, 0, v26.Height), 
            Spacing = v26.Spacing
        }, l_ItemMinWidth_0);
    end;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        Size = UDim2.fromScale(1, 0), 
        Spacing = v26.Spacing
    }, v28);
end;