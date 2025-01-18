local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local v1 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local l_Theme_0 = v1.Resources.Theme;
local l_StyleKey_0 = v2.Style.StyleKey;
local l_ContextServices_0 = v2.ContextServices;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local l_TextService_0 = game:GetService("TextService");
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialPickerRemoveToggles);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagEnableMaterialGenerator);
local v12 = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/Generate.png", "Light");
local v13 = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/Generate.png", "Dark");
local v14 = string.format("rbxasset://studio_svg_textures/Shared/Modeling/%s/Large/Material.png", "Light");
local v15 = string.format("rbxasset://studio_svg_textures/Shared/Modeling/%s/Large/Material.png", "Dark");
local v16 = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/Grid.png", "Light");
local v17 = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/Grid.png", "Dark");
local v18 = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/List.png", "Light");
local v19 = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/List.png", "Dark");
local v20 = {
    [l_StyleKey_0.MaterialGeneratorButtonIcon] = v13, 
    [l_StyleKey_0.MaterialManagerButtonIcon] = v15, 
    [l_StyleKey_0.ViewToggleButtonGridIcon] = v17, 
    [l_StyleKey_0.ViewToggleButtonListIcon] = v19, 
    [l_StyleKey_0.FilterChipTextColor] = Color3.fromHex("FFFFFF"), 
    [l_StyleKey_0.FilterChipBorderColor] = Color3.fromHex("262626"), 
    [l_StyleKey_0.FilterChipInactiveBackgroundColor] = Color3.fromHex("3C3C3C"), 
    [l_StyleKey_0.FilterChipInactiveHoverBackgroundColor] = Color3.fromHex("424242"), 
    [l_StyleKey_0.FilterChipActiveBackgroundColor] = Color3.fromHex("1A1A1A"), 
    [l_StyleKey_0.FilterChipActiveHoverBackgroundColor] = Color3.fromHex("252525")
};
local v21 = {
    [l_StyleKey_0.MaterialGeneratorButtonIcon] = v12, 
    [l_StyleKey_0.MaterialManagerButtonIcon] = v14, 
    [l_StyleKey_0.ViewToggleButtonGridIcon] = v16, 
    [l_StyleKey_0.ViewToggleButtonListIcon] = v18, 
    [l_StyleKey_0.FilterChipTextColor] = Color3.fromHex("000000"), 
    [l_StyleKey_0.FilterChipBorderColor] = Color3.fromHex("B6B6B6"), 
    [l_StyleKey_0.FilterChipInactiveBackgroundColor] = Color3.fromHex("FFFFFF"), 
    [l_StyleKey_0.FilterChipInactiveHoverBackgroundColor] = Color3.fromHex("E4EEFE"), 
    [l_StyleKey_0.FilterChipActiveBackgroundColor] = Color3.fromHex("A8A8A8"), 
    [l_StyleKey_0.FilterChipActiveHoverBackgroundColor] = Color3.fromHex("D8E6FF")
};
return function(v22) --[[ Line: 69 ]] --[[ Name: createThemeTable ]]
    -- upvalues: l_StyleKey_0 (copy), v10 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_TextService_0 (copy), v11 (copy), l_Theme_0 (copy), v20 (copy), v21 (copy)
    local v23 = {
        MainView = {
            Padding = 10, 
            ScrollBarThickness = 8
        }, 
        PrimaryTools = {
            Size = UDim2.new(1, 0, 0, 40), 
            Spacing = 4, 
            Padding = 8, 
            SearchBar = {
                Size = UDim2.new(1, -24, 1, 0)
            }, 
            ViewToggle = {
                Size = UDim2.new(0, 24, 0, 24), 
                LeftIconGrid = l_StyleKey_0.ViewToggleButtonGridIcon, 
                LeftIconList = l_StyleKey_0.ViewToggleButtonListIcon
            }
        }, 
        Filters = {
            Size = UDim2.new(1, 0, 0, 30), 
            ChipSize = UDim2.new(1, 0, 0, 22), 
            TextColor = l_StyleKey_0.FilterChipTextColor, 
            BorderColor = l_StyleKey_0.FilterChipBorderColor, 
            InactiveBackgroundColor = l_StyleKey_0.FilterChipInactiveBackgroundColor, 
            InactiveHoverBackgroundColor = l_StyleKey_0.FilterChipInactiveHoverBackgroundColor, 
            ActiveBackgroundColor = l_StyleKey_0.FilterChipActiveBackgroundColor, 
            ActiveHoverBackgroundColor = l_StyleKey_0.FilterChipActiveHoverBackgroundColor, 
            TextSize = 15
        }, 
        MaterialGrid = {
            GridItemsPerRow = 3, 
            GridItemRowsPerPage = 3, 
            GridItemPadding = 4, 
            GridItemSize = 80, 
            ListPadding = {
                Top = 3, 
                Left = 3
            }, 
            SnapshotSize = UDim2.fromOffset(64, 64), 
            SnapshotBorderThickness = 0.6, 
            TooltipDelay = 0.4
        }, 
        Footer = {
            Padding = 8, 
            Spacing = 4, 
            Size = UDim2.new(1, 0, 0, 40), 
            IconButton = {
                ActiveBackgroundColor = if v10() then nil else l_StyleKey_0.BackgroundDefault, 
                BackgroundColor = l_StyleKey_0.Button, 
                IconSize = 16, 
                Spacing = 8, 
                Padding = 8, 
                MaterialManagerButton = {
                    Icon = l_StyleKey_0.MaterialManagerButtonIcon
                }, 
                MaterialGeneratorButton = {
                    Icon = l_StyleKey_0.MaterialGeneratorButtonIcon, 
                    Size = UDim2.new(0, 97, 1, 0)
                }
            }
        }
    };
    local l_GridItemSize_0 = v23.MaterialGrid.GridItemSize;
    local l_ScrollBarThickness_0 = v23.MainView.ScrollBarThickness;
    local l_GridItemsPerRow_0 = v23.MaterialGrid.GridItemsPerRow;
    local l_GridItemPadding_0 = v23.MaterialGrid.GridItemPadding;
    local v28 = l_GridItemsPerRow_0 * l_GridItemSize_0 + (l_GridItemsPerRow_0 + 1) * l_GridItemPadding_0 + l_ScrollBarThickness_0;
    local l_GridItemRowsPerPage_0 = v23.MaterialGrid.GridItemRowsPerPage;
    local v30 = l_GridItemRowsPerPage_0 * l_GridItemSize_0 + (l_GridItemRowsPerPage_0 + 1) * l_GridItemPadding_0;
    local l_Offset_0 = v23.PrimaryTools.Size.Y.Offset;
    local l_Offset_1 = v23.Filters.Size.Y.Offset;
    local l_Offset_2 = v23.Footer.Size.Y.Offset;
    local v34 = l_Offset_0 + l_Offset_1 + v30 + l_Offset_2;
    local l_IconSize_0 = v23.Footer.IconButton.IconSize;
    local l_Size_0 = v23.Footer.IconButton.MaterialGeneratorButton.Size;
    local v37 = v28 - l_Size_0.X.Offset - v23.Footer.Padding * 2 - v23.Footer.Spacing;
    local v38 = nil;
    v38 = v22 and "Material Manager" or l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "MaterialPicker"
    }):getText("MainView", "MaterialManagerButton");
    local v39 = v37 - l_IconSize_0 - v23.Footer.IconButton.Padding * 2 - v23.Footer.IconButton.Spacing;
    local l_X_0 = l_TextService_0:GetTextSize(v38, l_IconSize_0, Enum.Font.SourceSans, Vector2.new(v37, l_IconSize_0)).X;
    if v39 < l_X_0 then
        v37 = v37 + (l_X_0 - v39) + 16;
    end;
    local v41 = nil;
    v41 = if v11() then v28 - l_Size_0.X.Offset - v23.Footer.Padding * 2 - v23.Footer.Spacing else v28 - v23.Footer.Padding * 2 - v23.Footer.Spacing;
    if v41 < v37 then
        v28 = v28 + (v37 - v41);
    end;
    v23.Popup = {
        Size = Vector2.new(v28, v34)
    };
    v23.Footer.IconButton.MaterialManagerButton.Size = UDim2.new(0, v37, 1, 0);
    v23.MaterialGrid.ContainerXBounds = NumberRange.new(0, v23.Popup.Size.X - v23.MainView.ScrollBarThickness);
    v23.MaterialGrid.ContainerYBounds = NumberRange.new(v23.PrimaryTools.Size.Y.Offset + v23.Filters.Size.Y.Offset, v23.Popup.Size.Y - v23.Footer.Size.Y.Offset);
    v23.MaterialGrid.Size = UDim2.new(1, 0, 0, v30);
    return {
        createTheme = function() --[[ Line: 233 ]]
            -- upvalues: v22 (copy), l_Theme_0 (ref), v20 (ref), v21 (ref), v23 (copy)
            local _ = nil;
            return (if v22 then l_Theme_0.mock(v20) else l_Theme_0.new(v20, v21)):extend(v23);
        end, 
        Popup = v23.Popup
    };
end;