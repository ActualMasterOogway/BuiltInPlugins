local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_useCallback_0 = v4.useCallback;
local l_useMemo_0 = v4.useMemo;
local _ = v4.useState;
local l_Button_0 = v2.UI.Button;
local l_Image_0 = v2.UI.Image;
local l_Pane_0 = v2.UI.Pane;
local l_SelectInput_0 = v2.UI.SelectInput;
local l_TextLabel_0 = v2.UI.TextLabel;
local l_MaterialPreview_0 = v3.Components.MaterialPreview;
local l_MaterialGrid_0 = v3.Components.MaterialGrid;
local l_ViewType_0 = v3.Enums.ViewType;
local l_getSerializedMaterialIdentifier_0 = v3.Util.getSerializedMaterialIdentifier;
local v19 = require(l_script_FirstAncestor_0.Src.Util.getMaterials);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local v22 = v21();
local function v24(v23) --[[ Line: 46 ]] --[[ Name: AirElement ]]
    -- upvalues: v4 (copy), l_Pane_0 (copy), l_Image_0 (copy)
    return v4.createElement(l_Pane_0, {
        Padding = 2, 
        Size = v23.Size
    }, {
        Image = v4.createElement(l_Image_0, {
            Style = {
                Image = "rbxasset://studio_svg_textures/Lua/TerrainEditor/Dark/Large/Air.png"
            }
        })
    });
end;
local function v26(v25) --[[ Line: 59 ]] --[[ Name: WaterElement ]]
    -- upvalues: v4 (copy), l_Pane_0 (copy), l_Image_0 (copy)
    return v4.createElement(l_Pane_0, {
        Padding = 2, 
        Size = v25.Size
    }, {
        Image = v4.createElement(l_Image_0, {
            Style = {
                Image = "rbxasset://studio_svg_textures/Lua/TerrainEditor/Dark/Large/Water.png"
            }
        })
    });
end;
return function(v27) --[[ Line: 72 ]] --[[ Name: MaterialRenderer ]]
    -- upvalues: l_Stylizer_0 (copy), l_useMemo_0 (copy), v19 (copy), v21 (copy), l_Localization_0 (copy), l_getSerializedMaterialIdentifier_0 (copy), l_useCallback_0 (copy), v4 (copy), l_Button_0 (copy), l_Pane_0 (copy), l_MaterialPreview_0 (copy), l_TextLabel_0 (copy), v22 (copy), l_SelectInput_0 (copy), l_MaterialGrid_0 (copy), v24 (copy), v26 (copy), l_ViewType_0 (copy)
    local v28 = l_Stylizer_0:use("MaterialRenderer");
    local l_Schema_0 = v27.Schema;
    local v30 = l_useMemo_0(function() --[[ Line: 76 ]]
        -- upvalues: v19 (ref), l_Schema_0 (copy)
        return v19(l_Schema_0.AllowAir, l_Schema_0.AllowWater);
    end, {
        l_Schema_0.AllowAir, 
        l_Schema_0.AllowWater
    });
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    if v21() then
        v31 = l_Localization_0:use();
        v32 = l_useMemo_0(function() --[[ Line: 85 ]]
            -- upvalues: v30 (copy), l_getSerializedMaterialIdentifier_0 (ref), v31 (ref)
            local v34 = {};
            for _, v36 in v30 do
                table.insert(v34, {
                    Id = l_getSerializedMaterialIdentifier_0(v36), 
                    Label = v31:getText("Materials", v36.Name), 
                    Material = v36
                });
            end;
            return v34;
        end, {
            v30
        });
        v33 = l_useCallback_0(function(v37, v38, v39, _) --[[ Line: 99 ]]
            -- upvalues: v4 (ref), l_Button_0 (ref), v28 (copy), l_Pane_0 (ref), l_MaterialPreview_0 (ref), l_TextLabel_0 (ref)
            return v4.createElement(l_Button_0, {
                LayoutOrder = v38, 
                OnClick = v39, 
                Size = UDim2.new(1, 0, 0, v28.DropdownItemHeight)
            }, {
                Contents = v4.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Horizontal, 
                    Size = UDim2.fromScale(1, 1), 
                    Spacing = v28.Spacing
                }, {
                    PreviewContainer = v4.createElement(l_Pane_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(v28.DropdownItemHeight, v28.DropdownItemHeight)
                    }, {
                        PreviewCenter = v4.createElement(l_Pane_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            Size = UDim2.fromOffset(v28.PreviewSize, v28.PreviewSize)
                        }, {
                            Preview = v4.createElement(l_MaterialPreview_0, {
                                CornerRadius = UDim.new(0, 4), 
                                InitialDistance = 4, 
                                LayoutOrder = 1, 
                                Material = v37.Material, 
                                Size = UDim2.fromScale(1, 1)
                            })
                        })
                    }), 
                    Label = v4.createElement(l_TextLabel_0, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, -v28.DropdownItemHeight, 1, 0), 
                        Text = v37.Label, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                })
            });
        end, {
            v28
        });
    end;
    local function v42(v41) --[[ Line: 140 ]] --[[ Name: onChanged ]]
        -- upvalues: v27 (copy)
        v27.OnChanged(v41.Material);
    end;
    if v22 and l_Schema_0.Dropdown then
        return v4.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            Size = UDim2.fromScale(1, 1), 
            Spacing = v28.Spacing
        }, {
            v4.createElement(l_MaterialPreview_0, {
                CornerRadius = UDim.new(0, 4), 
                InitialDistance = 4, 
                Material = v27.Value, 
                Size = UDim2.fromOffset(v28.PreviewSize, v28.PreviewSize)
            }), 
            v4.createElement(l_SelectInput_0, {
                Items = v32, 
                OnItemActivated = function(v43) --[[ Line: 158 ]] --[[ Name: OnItemActivated ]]
                    -- upvalues: v27 (copy)
                    v27.OnChanged(v43.Material);
                end, 
                OnRenderItem = v33, 
                SelectedId = v27.Value.Name, 
                Size = UDim2.new(1, -v28.PreviewSize - v28.Spacing, 0, v28.PreviewSize)
            })
        });
    else
        return v4.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            Size = UDim2.fromScale(1, 0), 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Grid = v4.createElement(l_MaterialGrid_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                CustomPreviews = {
                    [Enum.Material.Air] = v24, 
                    [Enum.Material.Water] = v26
                }, 
                GridItemSize = v28.GridItemSize, 
                InitialDistance = v28.InitialDistance, 
                OnClick = v42, 
                Items = v30, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                SelectedItemId = l_getSerializedMaterialIdentifier_0(v27.Value), 
                ShowGridLabels = false, 
                Size = UDim2.fromScale(1, 0), 
                ViewType = l_ViewType_0.Grid
            })
        });
    end;
end;