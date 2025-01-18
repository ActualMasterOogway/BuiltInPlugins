local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local l_MaterialService_0 = game:GetService("MaterialService");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_LUAU_ANALYZE_ERROR_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).LUAU_ANALYZE_ERROR;
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_IconButton_0 = l_UI_0.IconButton;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_MaterialPreview_0 = v3.Components.MaterialPreview;
local l_MaterialPreviewGeometryType_0 = v3.Enums.MaterialPreviewGeometryType;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v20 = require(l_Components_0.LoadingButton);
local v21 = require(l_Components_0.Settings.SelectInputSetting);
local v22 = require(l_Components_0.Settings.SliderSetting);
local v23 = require(l_Components_0.Settings.TextSetting);
local v24 = require(l_Components_0.Settings.ToggleButtonSetting);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v26 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorTempMaterialVariantsFix);
local v27 = game:DefineFastFlag("MaterialGeneratorEditorSinkInput", false);
local v28 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedParts);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v31 = require(l_Util_0.Constants);
local v32 = require(l_Util_0.GeneratedMaterialsContext);
local v33 = require(l_Util_0.GenerationContext);
local v34 = require(l_Util_0.PluginSettingsContext);
local v35 = require(l_Util_0.PreviewContext);
local v36 = require(l_Util_0.SupportedMaterials);
local l_SETTING_GEOMETRY_TYPE_0 = v31.SETTING_GEOMETRY_TYPE;
local function v39(v38) --[[ Line: 61 ]] --[[ Name: formatStudsPerTile ]]
    return ("%.1f"):format(v38);
end;
local v40 = v36.getNames();
return function(v41) --[[ Line: 67 ]] --[[ Name: Editor ]]
    -- upvalues: v25 (copy), v4 (copy), v35 (copy), l_LUAU_ANALYZE_ERROR_0 (copy), v32 (copy), v33 (copy), l_Localization_0 (copy), v28 (copy), v26 (copy), l_MaterialService_0 (copy), l_Stylizer_0 (copy), v34 (copy), l_SETTING_GEOMETRY_TYPE_0 (copy), l_MaterialPreviewGeometryType_0 (copy), l_ContextServices_0 (copy), l_showContextMenu_0 (copy), l_LayoutOrderIterator_0 (copy), l_Pane_0 (copy), v27 (copy), l_ScrollingFrame_0 (copy), l_Button_0 (copy), l_KeyboardListener_0 (copy), l_MaterialPreview_0 (copy), v22 (copy), v31 (copy), v39 (copy), v24 (copy), v23 (copy), v21 (copy), v40 (copy), v20 (copy), l_IconButton_0 (copy)
    assert(v25(), "Expected FFlagMaterialGeneratorNewUI to be true");
    local v42 = v4.useContext(v35);
    local l_selectedMaterial_0 = v42.selectedMaterial;
    if not l_selectedMaterial_0 then
        return nil;
    else
        assert(l_selectedMaterial_0 ~= nil, l_LUAU_ANALYZE_ERROR_0);
        local l_setSelectedMaterial_0 = v42.setSelectedMaterial;
        local _, v46 = v4.useState(0);
        local v47, v48 = v4.useState(false);
        local v49 = v4.useContext(v32);
        local l_hasBaseMaterial_0 = v49.hasBaseMaterial;
        local l_markHasBaseMaterial_0 = v49.markHasBaseMaterial;
        local v52 = v49.getMaterialStatus(l_selectedMaterial_0);
        local l_uploadMaterialVariant_0 = v4.useContext(v33).uploadMaterialVariant;
        local v54 = if l_hasBaseMaterial_0(l_selectedMaterial_0) then l_selectedMaterial_0.BaseMaterial.Name else nil;
        local v55 = l_Localization_0:use();
        local v56 = nil;
        if v47 then
            v56 = v55:getText("Editor", "BaseMaterialNotSetError");
        end;
        v4.useEffect(function() --[[ Line: 102 ]]
            -- upvalues: l_selectedMaterial_0 (copy), v46 (copy)
            local v58 = l_selectedMaterial_0.Changed:Connect(function() --[[ Line: 103 ]]
                -- upvalues: v46 (ref)
                v46(function(v57) --[[ Line: 104 ]]
                    return v57 + 1;
                end);
            end);
            return function() --[[ Line: 109 ]]
                -- upvalues: v58 (copy)
                v58:Disconnect();
            end;
        end, {
            l_selectedMaterial_0
        });
        local v60 = v4.useCallback(function(v59) --[[ Line: 114 ]]
            -- upvalues: l_selectedMaterial_0 (copy)
            l_selectedMaterial_0.StudsPerTile = v59;
        end, {
            l_selectedMaterial_0
        });
        local v62 = v4.useCallback(function(v61) --[[ Line: 118 ]]
            -- upvalues: l_selectedMaterial_0 (copy)
            l_selectedMaterial_0.Name = v61;
        end, {
            l_selectedMaterial_0
        });
        local v63 = v4.useCallback(function() --[[ Line: 122 ]]
            -- upvalues: l_selectedMaterial_0 (copy)
            if l_selectedMaterial_0.MaterialPattern == Enum.MaterialPattern.Regular then
                l_selectedMaterial_0.MaterialPattern = Enum.MaterialPattern.Organic;
                return;
            else
                l_selectedMaterial_0.MaterialPattern = Enum.MaterialPattern.Regular;
                return;
            end;
        end, {
            l_selectedMaterial_0
        });
        local v65 = v4.useCallback(function(v64) --[[ Line: 130 ]]
            -- upvalues: l_selectedMaterial_0 (copy), l_markHasBaseMaterial_0 (copy), v48 (copy)
            l_selectedMaterial_0.BaseMaterial = Enum.Material[v64];
            l_markHasBaseMaterial_0(l_selectedMaterial_0);
            v48(false);
        end, {
            l_selectedMaterial_0, 
            l_markHasBaseMaterial_0
        });
        local v66 = v28();
        local l_applySelectedMaterial_0 = v42.applySelectedMaterial;
        local v68 = v4.useCallback(function() --[[ Line: 140 ]]
            -- upvalues: l_hasBaseMaterial_0 (copy), l_selectedMaterial_0 (copy), v48 (copy), l_uploadMaterialVariant_0 (copy), l_applySelectedMaterial_0 (copy)
            if not l_hasBaseMaterial_0(l_selectedMaterial_0) then
                v48(true);
                return;
            else
                l_uploadMaterialVariant_0(l_selectedMaterial_0);
                l_applySelectedMaterial_0();
                return;
            end;
        end, {
            l_selectedMaterial_0, 
            l_hasBaseMaterial_0, 
            l_uploadMaterialVariant_0, 
            l_applySelectedMaterial_0
        });
        local _ = v4.useCallback(function() --[[ Line: 150 ]]
            -- upvalues: l_selectedMaterial_0 (copy)
            if l_selectedMaterial_0 then

            end;
        end, {
            l_selectedMaterial_0
        });
        local v70 = v52 == "Uploaded";
        local v71 = v52 == "Uploading";
        if v26() and not v70 then
            l_selectedMaterial_0.Parent = l_MaterialService_0;
        end;
        local v72 = v4.useMemo(function() --[[ Line: 165 ]]
            -- upvalues: v66 (copy), v55 (copy)
            if v66 and #v66 > 0 then
                return v55:getText("Editor", "SaveAndApplyVariant");
            else
                return v55:getText("Editor", "Upload");
            end;
        end, {
            v66
        });
        local v73 = l_Stylizer_0:use("Editor");
        local l_LabelWidth_0 = v73.LabelWidth;
        local v75 = v4.useContext(v34);
        local v76 = v75.getSetting(l_SETTING_GEOMETRY_TYPE_0);
        local v77 = nil;
        if v76 then
            v77 = l_MaterialPreviewGeometryType_0.fromRawValue(v76);
        end;
        local v78 = l_ContextServices_0.Plugin.use():get();
        local v82 = v4.useCallback(function() --[[ Line: 186 ]]
            -- upvalues: v77 (ref), l_MaterialPreviewGeometryType_0 (ref), v55 (copy), v75 (copy), l_SETTING_GEOMETRY_TYPE_0 (ref), l_showContextMenu_0 (ref), v78 (copy)
            local v81 = {
                {
                    Checked = v77 == l_MaterialPreviewGeometryType_0.Plane, 
                    Text = v55:getText("Browser", "PlanePreview"), 
                    Enabled = true, 
                    OnItemClicked = function() --[[ Line: 192 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: l_MaterialPreviewGeometryType_0 (ref), v75 (ref), l_SETTING_GEOMETRY_TYPE_0 (ref)
                        local v79 = l_MaterialPreviewGeometryType_0.Plane.rawValue();
                        v75.setSetting(l_SETTING_GEOMETRY_TYPE_0, v79);
                    end
                }, 
                {
                    Checked = v77 == l_MaterialPreviewGeometryType_0.Sphere, 
                    Text = v55:getText("Browser", "SpherePreview"), 
                    Enabled = true, 
                    OnItemClicked = function() --[[ Line: 201 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: l_MaterialPreviewGeometryType_0 (ref), v75 (ref), l_SETTING_GEOMETRY_TYPE_0 (ref)
                        local v80 = l_MaterialPreviewGeometryType_0.Sphere.rawValue();
                        v75.setSetting(l_SETTING_GEOMETRY_TYPE_0, v80);
                    end
                }
            };
            task.spawn(function() --[[ Line: 208 ]]
                -- upvalues: l_showContextMenu_0 (ref), v78 (ref), v81 (copy)
                l_showContextMenu_0(v78, v81);
            end);
        end, {
            v77
        });
        local v83 = l_LayoutOrderIterator_0.new();
        return v4.createElement(l_Pane_0, {
            LayoutOrder = v41.LayoutOrder, 
            Size = v41.Size, 
            Style = "Box"
        }, {
            SinkInput = if v27 then v4.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Interactable = false, 
                Size = UDim2.fromScale(1, 1), 
                Text = ""
            }) else nil, 
            ScrollingFrame = v4.createElement(l_ScrollingFrame_0, {
                AutomaticCanvasSize = Enum.AutomaticSize.Y
            }, {
                CloseButton = v4.createElement(l_Button_0, {
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.new(1, -2, 0, 2), 
                    Size = v73.CloseButtonSize, 
                    Style = "Close", 
                    OnClick = function() --[[ Line: 237 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_setSelectedMaterial_0 (copy)
                        l_setSelectedMaterial_0(nil);
                    end, 
                    ZIndex = 1000
                }), 
                KeyboardListener = v4.createElement(l_KeyboardListener_0, {
                    OnKeyPressed = function(_, v85) --[[ Line: 244 ]] --[[ Name: OnKeyPressed ]]
                        -- upvalues: l_setSelectedMaterial_0 (copy)
                        if v85[Enum.KeyCode.Escape] then
                            l_setSelectedMaterial_0(nil);
                        end;
                    end
                }), 
                Content = v4.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Layout = Enum.FillDirection.Vertical
                }, {
                    PreviewPane = v4.createElement(l_Pane_0, {
                        BackgroundColor = v73.PreviewBackgroundColor, 
                        LayoutOrder = v83:getNextOrder(), 
                        Size = UDim2.new(1, 0, 0, v73.PreviewHeight)
                    }, {
                        Preview = v4.createElement(l_MaterialPreview_0, {
                            AnchorPoint = Vector2.new(0.5, 0), 
                            BackgroundColor = v73.PreviewBackgroundColor, 
                            DisableHover = true, 
                            DisableZoom = true, 
                            Material = l_selectedMaterial_0, 
                            MaterialPreviewGeometryType = v77, 
                            OnRightClick = v82, 
                            Position = UDim2.fromScale(0.5, 0), 
                            Size = UDim2.fromOffset(v73.PreviewHeight, v73.PreviewHeight)
                        })
                    }), 
                    SettingsPane = v4.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = v83:getNextOrder()
                    }, {
                        Settings = v4.createElement(l_Pane_0, {
                            AnchorPoint = Vector2.new(0.5, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Layout = Enum.FillDirection.Vertical, 
                            LayoutOrder = v83:getNextOrder(), 
                            Padding = v73.SettingsPadding, 
                            Position = UDim2.fromScale(0.5, 0), 
                            Size = UDim2.fromOffset(300, 0), 
                            Spacing = v73.SettingSpacing
                        }, {
                            StudsPerTileSetting = v4.createElement(v22, {
                                LabelWidth = l_LabelWidth_0, 
                                LayoutOrder = v83:getNextOrder(), 
                                Min = v31.STUDS_PER_TILE_MIN, 
                                Max = v31.STUDS_PER_TILE_MAX, 
                                OnFormatValue = v39, 
                                OnValueChanged = v60, 
                                ShowValueLabel = false, 
                                Size = v73.StudsPerTileSettingSize, 
                                SnapIncrement = v31.STUDS_PER_TILE_SNAP_INCREMENT, 
                                Text = v55:getText("Editor", "StudsPerTile"), 
                                Value = l_selectedMaterial_0.StudsPerTile
                            }), 
                            MaterialPatternSetting = v4.createElement(v24, {
                                LayoutOrder = v83:getNextOrder(), 
                                LabelWidth = l_LabelWidth_0, 
                                OnValueChanged = v63, 
                                Text = v55:getText("Editor", "MaterialPattern"), 
                                UseCheckbox = true, 
                                CheckboxLabel = v55:getText("Editor", "MaterialPatternOrganic"), 
                                Value = l_selectedMaterial_0.MaterialPattern == Enum.MaterialPattern.Organic
                            }), 
                            NameSetting = v4.createElement(v23, {
                                LayoutOrder = v83:getNextOrder(), 
                                LabelWidth = l_LabelWidth_0, 
                                MaxLength = v31.INSTANCE_NAME_MAX_LENGTH, 
                                OnValueChanged = v62, 
                                Text = v55:getText("Editor", "Name"), 
                                Value = l_selectedMaterial_0.Name
                            }), 
                            BaseMaterial = v4.createElement(v21, {
                                Items = v40, 
                                LayoutOrder = v83:getNextOrder(), 
                                LabelWidth = l_LabelWidth_0, 
                                OnValueChanged = v65, 
                                PlaceholderText = v55:getText("Editor", "BaseMaterialPlaceholderText"), 
                                Text = v55:getText("Editor", "BaseMaterial"), 
                                ErrorText = v56, 
                                Value = v54
                            })
                        })
                    }), 
                    UploadAndApplyButton = if not v70 then v4.createElement(v20, {
                        LayoutOrder = v83:getNextOrder(), 
                        Size = v73.UploadAndApplyButtonSize, 
                        Text = v72, 
                        isLoading = v71, 
                        onClick = v68
                    }) else nil, 
                    ApplyButton = if v70 then v4.createElement(l_IconButton_0, {
                        AutomaticSize = Enum.AutomaticSize.X, 
                        BackgroundColor = v73.ApplyButtonBackgroundColor, 
                        LayoutOrder = v83:getNextOrder(), 
                        LeftIcon = v73.ApplyButtonIcon, 
                        OnClick = l_applySelectedMaterial_0, 
                        Size = v73.ApplyButtonSize, 
                        Text = v55:getText("Editor", "ApplyVariant")
                    }) else nil
                })
            })
        });
    end;
end;