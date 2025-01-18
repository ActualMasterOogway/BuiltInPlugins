local l_DevFrameworkPaneActiveProp_0 = game:GetFastFlag("DevFrameworkPaneActiveProp");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local _ = require(l_Parent_0.Src.Types);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_prioritize_0 = v2.Util.prioritize;
local v16 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local l_Components_0 = l_Parent_0.Src.Components;
local v18 = require(l_Components_0.ModalView);
local v19 = require(l_Components_0.Settings.SelectInputSetting);
local v20 = require(l_Components_0.Settings.SliderSetting);
local v21 = require(l_Components_0.Settings.TextSetting);
local v22 = require(l_Components_0.Settings.ToggleButtonSetting);
local v23 = require(l_Parent_0.Src.Controllers.MaterialPreviewController);
local v24 = require(l_Parent_0.Src.Util.SupportedMaterials);
local v25 = v3.PureComponent:extend("MaterialView");
v25.init = function(v26) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy)
    assert(not v16(), "Expected FFlagMaterialGeneratorNewUI to be false");
    v26:setState({
        counter = 0, 
        errorMustSetBaseMaterial = false
    });
    v26.organicToggled = function() --[[ Line: 88 ]]
        -- upvalues: v26 (copy)
        local l_MaterialVariant_0 = v26.props.Material.MaterialVariant;
        if l_MaterialVariant_0.MaterialPattern == Enum.MaterialPattern.Regular then
            l_MaterialVariant_0.MaterialPattern = Enum.MaterialPattern.Organic;
            return;
        else
            l_MaterialVariant_0.MaterialPattern = Enum.MaterialPattern.Regular;
            return;
        end;
    end;
    v26.studsPerTileChanged = function(v28) --[[ Line: 97 ]]
        -- upvalues: v26 (copy)
        v26.props.Material.MaterialVariant.StudsPerTile = v28 / 10;
    end;
    v26.baseMaterialChanged = function(v29) --[[ Line: 102 ]]
        -- upvalues: v26 (copy)
        local v30 = Enum.Material[v29];
        v26:setState({
            errorMustSetBaseMaterial = false
        });
        v26.props.OnBaseMaterialChanged(v30);
    end;
    v26.nameChanged = function(v31) --[[ Line: 108 ]]
        -- upvalues: v26 (copy)
        v26.props.Material.MaterialVariant.Name = v31;
    end;
    v26.formatStudsPerTile = function(v32) --[[ Line: 113 ]]
        return ("%.1f"):format(v32 / 10);
    end;
    v26.saveAndApplyClicked = function() --[[ Line: 117 ]]
        -- upvalues: v26 (copy)
        local l_props_0 = v26.props;
        if l_props_0.IsSavingMaterial then
            return;
        elseif l_props_0.Material.BaseMaterial then
            l_props_0.OnSaveAndApply();
            return;
        else
            v26:setState({
                errorMustSetBaseMaterial = true
            });
            return;
        end;
    end;
end;
v25.didMount = function(v34) --[[ Line: 134 ]] --[[ Name: didMount ]]
    local l_props_1 = v34.props;
    local l_Material_0 = l_props_1.Material;
    l_props_1.MaterialPreviewController:setMaterial(l_Material_0);
    v34.materialVariantChangedConnection = l_Material_0.MaterialVariant.Changed:Connect(function() --[[ Line: 140 ]]
        -- upvalues: v34 (copy)
        v34:setState(function(v37) --[[ Line: 141 ]]
            return {
                counter = v37.counter + 1
            };
        end);
    end);
end;
v25.willUnmount = function(v38) --[[ Line: 147 ]] --[[ Name: willUnmount ]]
    v38.props.MaterialPreviewController:clear();
    if v38.materialVariantChangedConnection then
        v38.materialVariantChangedConnection:Disconnect();
        v38.materialVariantChangedConnection = nil;
    end;
end;
v25.renderContent = function(v39) --[[ Line: 158 ]] --[[ Name: renderContent ]]
    -- upvalues: l_prioritize_0 (copy), v24 (copy), v3 (copy), l_Pane_0 (copy), l_DevFrameworkPaneActiveProp_0 (copy), l_ScrollingFrame_0 (copy), v20 (copy), v22 (copy), v21 (copy), v19 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy)
    local l_props_2 = v39.props;
    local l_MaterialView_0 = l_props_2.Stylizer.MaterialView;
    local l_Localization_1 = l_props_2.Localization;
    local l_Material_1 = l_props_2.Material;
    local l_ColorMap_0 = l_Material_1.Textures.ColorMap;
    local l_MaterialVariant_1 = l_Material_1.MaterialVariant;
    local l_BaseMaterial_0 = l_Material_1.BaseMaterial;
    local l_Name_0 = l_MaterialVariant_1.Name;
    local v48 = l_MaterialVariant_1.StudsPerTile * 10;
    local v49 = l_MaterialVariant_1.MaterialPattern == Enum.MaterialPattern.Organic;
    local l_IsTemporary_0 = l_Material_1.IsTemporary;
    local v51 = l_prioritize_0(l_props_2.LabelWidth, l_MaterialView_0.LabelWidth);
    local v52 = l_prioritize_0(l_props_2.Padding, l_MaterialView_0.Padding);
    local v53 = v24.getNames();
    local v54 = v24.getIcons();
    return v3.createElement(l_Pane_0, {
        Active = l_DevFrameworkPaneActiveProp_0 and true or nil, 
        Padding = v52, 
        Spacing = l_MaterialView_0.VerticalSpacing, 
        Style = "CornerBox", 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Scroller = v3.createElement(l_ScrollingFrame_0, {
            AutoSizeCanvas = true, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = UDim2.fromScale(1, 1)
        }, {
            Settings = v3.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                Spacing = l_MaterialView_0.SettingsGroupSpacing, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                Image = v3.createElement("ImageLabel", {
                    BorderSizePixel = 0, 
                    Image = l_ColorMap_0, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, l_MaterialView_0.PreviewHeight), 
                    ScaleType = Enum.ScaleType.Tile, 
                    TileSize = l_MaterialView_0.PreviewTileSize
                }), 
                PrimarySettingsGroup = v3.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundColor = l_MaterialView_0.PrimarySettingsGroupBackgroundColor, 
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = 2, 
                    Padding = l_MaterialView_0.SettingsGroupPadding, 
                    Spacing = l_MaterialView_0.SettingSpacing, 
                    Style = "CornerBox", 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }, {
                    StudsPerTileSetting = v3.createElement(v20, {
                        LabelWidth = v51, 
                        LayoutOrder = 1, 
                        Min = 1, 
                        Max = 200, 
                        OnFormatValue = v39.formatStudsPerTile, 
                        OnValueChanged = v39.studsPerTileChanged, 
                        ShowValueLabel = false, 
                        Size = l_MaterialView_0.StudsPerTileSettingSize, 
                        SnapIncrement = 1, 
                        Text = l_Localization_1:getText("MaterialView", "StudsPerTile"), 
                        Value = v48
                    }), 
                    MaterialPatternSetting = v3.createElement(v22, {
                        LayoutOrder = 2, 
                        LabelWidth = v51, 
                        OnValueChanged = v39.organicToggled, 
                        Text = l_Localization_1:getText("MaterialView", "MaterialPattern"), 
                        UseCheckbox = true, 
                        CheckboxLabel = l_Localization_1:getText("MaterialView", "MaterialPatternOrganic"), 
                        Value = v49
                    })
                }), 
                SettingsGroup = v3.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = 3, 
                    Padding = l_MaterialView_0.SettingsGroupPadding, 
                    Spacing = l_MaterialView_0.SettingSpacing, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }, {
                    NameSetting = v3.createElement(v21, {
                        LayoutOrder = 1, 
                        LabelWidth = v51, 
                        OnValueChanged = v39.nameChanged, 
                        Text = l_Localization_1:getText("MaterialView", "Name"), 
                        Value = l_Name_0
                    }), 
                    BaseMaterial = v3.createElement(v19, {
                        Icons = v54, 
                        Items = v53, 
                        LayoutOrder = 2, 
                        LabelWidth = v51, 
                        OnValueChanged = v39.baseMaterialChanged, 
                        PlaceholderText = l_Localization_1:getText("MaterialView", "BaseMaterialPlaceholderText"), 
                        Text = l_Localization_1:getText("MaterialView", "BaseMaterial"), 
                        ErrorText = if v39.state.errorMustSetBaseMaterial then l_Localization_1:getText("MaterialView", "BaseMaterialNotGivenError") else nil, 
                        Value = if l_BaseMaterial_0 then l_BaseMaterial_0.Name else nil
                    })
                }), 
                SaveAndApplyButton = if l_IsTemporary_0 then v3.createElement(l_Button_0, {
                    Disabled = l_props_2.IsSavingMaterial, 
                    LayoutOrder = 4, 
                    OnClick = v39.saveAndApplyClicked, 
                    Size = l_MaterialView_0.SaveAndApplyButtonSize, 
                    Style = "RoundPrimary", 
                    StyleModifier = if l_props_2.IsSavingMaterial then l_StyleModifier_0.Disabled else nil, 
                    Text = l_Localization_1:getText("MaterialView", "SaveAndApplyVariant")
                }) else nil, 
                ApplyButton = if not l_IsTemporary_0 then v3.createElement(l_Button_0, {
                    LayoutOrder = 4, 
                    OnClick = v39.saveAndApplyClicked, 
                    Size = l_MaterialView_0.ApplyButtonSize, 
                    Style = "Round", 
                    StyleModifier = if l_props_2.IsSavingMaterial then l_StyleModifier_0.Disabled else nil, 
                    Text = l_Localization_1:getText("MaterialView", "ApplyVariant")
                }) else nil
            })
        })
    });
end;
v25.render = function(v55) --[[ Line: 303 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v18 (copy)
    local l_props_3 = v55.props;
    return v3.createElement(v18, {
        Content = v55:renderContent(), 
        OnClose = l_props_3.OnClose
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    MaterialPreviewController = v23, 
    Stylizer = l_Stylizer_0
})(v25));