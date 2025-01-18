local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_PreviewConstants_0 = v2.Util.AccessoryAndBodyToolShared.PreviewConstants;
local v4 = require(l_Parent_0.Packages.Framework);
local l_Util_0 = v4.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_deepCopy_0 = l_Util_0.deepCopy;
local l_UI_0 = v4.UI;
local l_Spritesheet_0 = v4.Util.Spritesheet;
local l_Style_0 = v4.Style;
local l_makeTheme_0 = l_Style_0.makeTheme;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_getRawComponentStyle_0 = l_Style_0.getRawComponentStyle;
local l_Box_0 = l_UI_0.Box;
local l_RoundBox_0 = l_UI_0.RoundBox;
local v18 = l_deepCopy_0((l_getRawComponentStyle_0("RoundBox")));
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local v21 = v1.Dictionary.join(l_DarkTheme_0, {
    [l_StyleKey_0.PlayImage] = "rbxasset://textures/LayeredClothingEditor/Icon_Play_Light.png", 
    [l_StyleKey_0.AddMoreImage] = "rbxasset://textures/LayeredClothingEditor/Icon_AddMore_Light.png", 
    [l_StyleKey_0.MoreActionsImage] = "rbxasset://textures/LayeredClothingEditor/Icon_MoreAction_Light.png", 
    [l_StyleKey_0.AddMoreBigImage] = "rbxasset://textures/LayeredClothingEditor/AddMore_Big_50X50_Light.png"
});
local v22 = v1.Dictionary.join(l_LightTheme_0, {
    [l_StyleKey_0.PlayImage] = "rbxasset://textures/LayeredClothingEditor/Icon_Play_Dark.png", 
    [l_StyleKey_0.AddMoreImage] = "rbxasset://textures/LayeredClothingEditor/Icon_AddMore_Dark.png", 
    [l_StyleKey_0.MoreActionsImage] = "rbxasset://textures/LayeredClothingEditor/Icon_MoreAction_Dark.png", 
    [l_StyleKey_0.AddMoreBigImage] = "rbxasset://textures/LayeredClothingEditor/AddMore_Big_50X50_Dark.png"
});
local function _() --[[ Line: 47 ]] --[[ Name: mockStyleKeyImages ]]
    -- upvalues: l_StyleKey_0 (copy)
    l_StyleKey_0.PlayImage = "rbxasset://textures/LayeredClothingEditor/Icon_Play_Dark.png";
    l_StyleKey_0.AddMoreImage = "rbxasset://textures/LayeredClothingEditor/Icon_AddMore_Dark.png";
    l_StyleKey_0.MoreActionsImage = "rbxasset://textures/LayeredClothingEditor/Icon_MoreAction_Dark.png";
    l_StyleKey_0.AddMoreBigImage = "rbxasset://textures/LayeredClothingEditor/AddMore_Big_50X50_Dark.png";
end;
local function v60(v24) --[[ Line: 54 ]] --[[ Name: createValuesInternal ]]
    -- upvalues: l_StyleKey_0 (copy), l_Spritesheet_0 (copy), l_getRawComponentStyle_0 (copy), v1 (copy), l_RoundBox_0 (copy), v18 (copy), l_StyleModifier_0 (copy), l_Box_0 (copy), l_PreviewConstants_0 (copy)
    if v24 then
        l_StyleKey_0.PlayImage = "rbxasset://textures/LayeredClothingEditor/Icon_Play_Dark.png";
        l_StyleKey_0.AddMoreImage = "rbxasset://textures/LayeredClothingEditor/Icon_AddMore_Dark.png";
        l_StyleKey_0.MoreActionsImage = "rbxasset://textures/LayeredClothingEditor/Icon_MoreAction_Dark.png";
        l_StyleKey_0.AddMoreBigImage = "rbxasset://textures/LayeredClothingEditor/AddMore_Big_50X50_Dark.png";
    end;
    local v25 = l_Spritesheet_0("rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", {
        SpriteSize = 12, 
        NumSprites = 4
    })[3];
    local v26 = l_getRawComponentStyle_0("TextInput");
    local v27 = v1.Dictionary.join(v26, {
        PlaceholderTextColor = l_StyleKey_0.DimmedText, 
        TextColor = l_StyleKey_0.MainText, 
        ["&RoundedBorder"] = {
            Padding = {
                Left = 10, 
                Top = 5, 
                Right = 10, 
                Bottom = 5
            }, 
            BackgroundStyle = {
                Color = l_StyleKey_0.RibbonTab, 
                BorderColor = l_StyleKey_0.RibbonTab, 
                Transparency = 0, 
                BorderTransparency = 0, 
                BackgroundImage = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
                BorderImage = "rbxasset://textures/StudioToolbox/RoundedBorder.png", 
                SliceCenter = Rect.new(3, 3, 13, 13)
            }
        }
    });
    local v28 = {
        Size = UDim2.fromOffset(240, 80)
    };
    local v29 = {
        Padding = 6, 
        ButtonSize = 32, 
        CageModeIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Cage Mode.png", 
        InnerCageIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Inner Cage.png", 
        OuterCageIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Outer Cage.png", 
        AutoWeightIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Auto-Weight.png", 
        OptionsIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Option Dots.png", 
        ButtonStyle = {
            Padding = 0, 
            Background = l_RoundBox_0, 
            BackgroundStyle = v1.Dictionary.join(v18, {
                Color = l_StyleKey_0.Button
            }), 
            [l_StyleModifier_0.Hover] = {
                BackgroundStyle = v1.Dictionary.join(v18, {
                    Color = l_StyleKey_0.ButtonHover
                })
            }, 
            [l_StyleModifier_0.Disabled] = {
                BackgroundStyle = v1.Dictionary.join(v18, {
                    Color = l_StyleKey_0.ButtonDisabled
                }), 
                TextColor = l_StyleKey_0.ButtonTextDisabled
            }, 
            [l_StyleModifier_0.Pressed] = {
                BackgroundStyle = v1.Dictionary.join(v18, {
                    Color = l_StyleKey_0.DialogMainButton
                })
            }
        }
    };
    local v30 = {
        Padding = 6, 
        PaddingSmall = 2, 
        ButtonSize = 32, 
        CageVisibilityIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Cage Visibility.png", 
        MeshPartVisibilityIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Mesh Visibility Icon.png", 
        OptionsIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Option Dots.png", 
        FocusMannequinIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Center Camera to Mannequin.png"
    };
    local v31 = {
        ButtonSize = 32, 
        VisibilityControlsOffset = 128, 
        PaneOffsetY = 20
    };
    local v32 = v1.Dictionary.join(v25, {
        Size = UDim2.new(0, 10, 0, 10), 
        Color = l_StyleKey_0.MainText, 
        AnchorPoint = Vector2.new(1, 0.5), 
        Position = UDim2.new(1, -6, 0.5, 0), 
        Padding = 96, 
        DropdownFramePadding = 12, 
        ArrowSize = 24, 
        DropdownFrameWidth = 216, 
        Font = Enum.Font.SourceSans, 
        TextSize = 18
    });
    local v33 = {
        ContentHeight = 120, 
        ContentSpacing = 16
    };
    local v34 = {
        PreviewHeight = 350, 
        GenerateHeight = 56
    };
    local v35 = {
        GenerateDropdownButtonWidth = 228, 
        GenerateButtonWidth = 150, 
        BackButtonWidth = 96, 
        GenerateDropdownButtonHeight = 36, 
        ButtonHeight = 48, 
        ArrowWidth = 24, 
        WarningIcon = "rbxasset://textures/StudioSharedUI/statusWarning.png", 
        IconSize = 16, 
        DropdownItemHeight = 22
    };
    local v36 = {
        TextBoxHeight = 24, 
        LabelWidth = 64
    };
    local v37 = {
        UIPadding = 24, 
        Height = 24, 
        ButtonWidth = 64, 
        LayoutPadding = 6
    };
    local v38 = {
        DefaultPointSize = 0.015, 
        DefaultColor = Color3.new(0, 1, 1), 
        HoveredColor = Color3.new(1, 1, 0), 
        SelectedColor = Color3.new(1, 1, 0), 
        SelectedColorNoWeight = Color3.new(1, 0, 0)
    };
    local v39 = {
        DefaultPointSize = 0.015
    };
    local v40 = {
        Transparency = 0.7, 
        PointSize = 0.1, 
        DefaultColor = Color3.new(0, 0, 1), 
        HoveredColor = Color3.new(1, 1, 0), 
        SelectedColor = Color3.new(1, 0, 0)
    };
    local v41 = {
        TitleHeight = 32
    };
    local v42 = {
        PlayImage = l_StyleKey_0.PlayImage, 
        PauseImage = "rbxasset://textures/LayeredClothingEditor/Icon_Pause.png", 
        PlayButtonWidth = 20, 
        PlayTimeLabelWidth = 60, 
        Padding = 24
    };
    local v43 = {
        HoverLineThickness = 0.02
    };
    local v44 = {
        AddFromExploreButtonFrameHeight = 25, 
        AddFromExploreButtonImage = l_StyleKey_0.AddMoreImage, 
        AddFromExploreButtonSize = UDim2.new(0, 20, 0, 20)
    };
    local v45 = {
        CageRowTextLabelSize = 0.3
    };
    local v46 = {
        AddFromExploreButtonFrameHeight = 25
    };
    local v47 = {
        SelectItemListScrollingFrameStyle = {
            BackgroundColor3 = l_StyleKey_0.CategoryItem, 
            ScrollBarThickness = 7, 
            BorderSizePixel = 0, 
            AutoSizeCanvas = true, 
            AutoSizeLayoutElement = "UIListLayout", 
            ScrollingDirection = Enum.ScrollingDirection.Y
        }
    };
    local v48 = {
        MoreButtonSize = 20, 
        SelectableRowStyle = {
            Background = l_Box_0, 
            BackgroundStyle = {
                BorderSize = 0, 
                Transparency = 1
            }, 
            [l_StyleModifier_0.Hover] = {
                BackgroundStyle = {
                    Color = l_StyleKey_0.ButtonHover, 
                    Transparency = 0
                }
            }, 
            [l_StyleModifier_0.Selected] = {
                BackgroundStyle = {
                    Color = l_StyleKey_0.DialogMainButtonSelected, 
                    Transparency = 0
                }
            }
        }
    };
    local v49 = {
        MoreButtonImage = l_StyleKey_0.MoreActionsImage, 
        MoreButtonSize = 20
    };
    local v50 = {
        TileSize = UDim2.new(0, 140, 0, 160), 
        TileInnerBorder = Vector2.new(10, 10), 
        ImageFrameSize = UDim2.new(0, 120, 0, 118), 
        ImageSize = UDim2.new(0, 100, 0, 98), 
        TextLabelSize = UDim2.new(0, 120, 0, 22), 
        ButtonBackgroundColor = l_StyleKey_0.ButtonPressed, 
        TextSize = 18, 
        ImageBackgroundColor = l_StyleKey_0.CategoryItem
    };
    local v51 = {
        Padding = 8
    };
    local v52 = {
        Padding = 6, 
        GridContainerSpacing = 4, 
        GridContainerPadding = 8, 
        Height = 350, 
        GridContainerBackgroundColor = l_StyleKey_0.SubBackground2
    };
    local v53 = {
        TileSize = UDim2.new(0, 120, 0, 120), 
        TilePadding = UDim2.new(0, 6, 0, 6), 
        TileInnerBorder = Vector2.new(10, 10), 
        ImageFrameSize = UDim2.new(0, 120, 0, 118), 
        ImageSize = UDim2.new(0, 100, 0, 98), 
        TextLabelSize = UDim2.new(0, 120, 0, 22), 
        ButtonBackgroundColor = l_StyleKey_0.ButtonPressed, 
        TextSize = 18, 
        DefaultTileImages = {
            [l_PreviewConstants_0.TABS_KEYS.Avatars] = "rbxasset://textures/LayeredClothingEditor/Default_Preview_Avatars.png", 
            [l_PreviewConstants_0.TABS_KEYS.Clothing] = "rbxasset://textures/LayeredClothingEditor/Default_Preview_Clothing.png", 
            [l_PreviewConstants_0.TABS_KEYS.Animations] = "rbxasset://textures/LayeredClothingEditor/Default_Preview_Animation.png"
        }, 
        AddNewImage = l_StyleKey_0.AddMoreBigImage, 
        SmallImageSize = UDim2.new(0, 46, 0, 42), 
        ImageBackgroundColor = l_StyleKey_0.CategoryItem
    };
    local v54 = {
        LinkColor = Color3.new(0, 0, 0)
    };
    local v55 = {
        WireColorInner = Color3.fromRGB(68, 103, 128), 
        WireColorOuter = Color3.fromRGB(140, 65, 168)
    };
    local v56 = {
        ButtonHeight = 36
    };
    local v57 = {
        ButtonHeight = 36
    };
    local v58 = {
        Transparency = 0.8, 
        InBoundsColor = Color3.new(0, 0, 1), 
        OutBoundsColor = Color3.new(1, 0, 0), 
        LineThickness = 5, 
        LineColor = Color3.new(0, 0, 0)
    };
    local v59 = {
        DropdownHeight = 24, 
        DropdownWidth = 160, 
        Spacing = 6
    };
    return {
        BackgroundColor = l_StyleKey_0.MainBackground, 
        ButtonColor = l_StyleKey_0.Button, 
        RibbonTab = l_StyleKey_0.RibbonTab, 
        ProgressBarColor = l_StyleKey_0.DialogMainButtonSelected, 
        ScrollBarColor = l_StyleKey_0.ScrollBar, 
        HoverColor = l_StyleKey_0.ButtonHover, 
        BorderColor = l_StyleKey_0.Border, 
        SubTextColor = l_StyleKey_0.SubText, 
        InfoTextColor = l_StyleKey_0.DimmedText, 
        TitleTextColor = l_StyleKey_0.TitlebarText, 
        TextColor = l_StyleKey_0.MainText, 
        TextDisabledColor = Color3.fromRGB(148, 148, 148), 
        ErrorColor = l_StyleKey_0.ErrorText, 
        LinkColor = l_StyleKey_0.LinkText, 
        Green = Color3.fromRGB(64, 166, 81), 
        White = Color3.fromRGB(255, 255, 255), 
        DisabledColor = l_StyleKey_0.MainTextDisabled, 
        ScrollbarTransparency = 0.7, 
        ScrollbarSize = 7, 
        TextSize = 18, 
        RowHeight = 32, 
        Font = Enum.Font.SourceSans, 
        FontBold = Enum.Font.SourceSansSemibold, 
        PopupMessageSize = Vector2.new(200, 100), 
        MainPadding = 20, 
        HeaderPadding = 8, 
        SliderHeight = 32, 
        ScrollBarThickness = 8, 
        TabHeight = 32, 
        BorderSize = 1, 
        PreviewViewportFrameHeight = 250
    }, {
        AssetTypeScreen = v33, 
        CageControls = v29, 
        VisibilityControls = v30, 
        WorkspaceEditorControls = v31, 
        EditorScreen = v34, 
        GenerateScreen = v35, 
        PreviewFrame = v52, 
        DeformerDropdownMenu = v32, 
        LatticeToolSettings = v37, 
        AddItemFromExplorerButton = v44, 
        EditingModeFrame = v45, 
        EditingModeRadioButtonList = v51, 
        InExperiencePreviewerFrame = v28, 
        SelectItemFrame = v46, 
        SelectItemList = v47, 
        SelectItemListRow = v48, 
        SelectItemMoreButton = v49, 
        PreviewGrid = v53, 
        EditTransparencyView = v41, 
        AnimPlaybackSlider = v42, 
        ScaleTypeDropdown = v59, 
        Tile = v50, 
        SelectFrame = v36, 
        PointTool = v39, 
        Point = v38, 
        ControlPoint = v40, 
        Lattice = v54, 
        Wireframe = v55, 
        ResetSettings = v56, 
        PreviewToStarterCharacterButton = v57, 
        TextInput = v27, 
        InstanceSelector = v43, 
        MeshPartTool = v58
    };
end;
local function v62(v61) --[[ Line: 429 ]] --[[ Name: customizeDevFrameworkComponents ]]
    -- upvalues: l_ComponentSymbols_0 (copy), v1 (copy), l_getRawComponentStyle_0 (copy), l_StyleKey_0 (copy), l_StyleModifier_0 (copy)
    v61[l_ComponentSymbols_0.SimpleTab] = v1.Dictionary.join(l_getRawComponentStyle_0("SimpleTab"), {
        Color = l_StyleKey_0.ButtonText, 
        BackgroundColor = l_StyleKey_0.MainBackground, 
        BorderColor = l_StyleKey_0.MainBackground, 
        TopLineColor = l_StyleKey_0.DialogMainButton, 
        BottomLineColor = l_StyleKey_0.Border, 
        [l_StyleModifier_0.Hover] = {
            Color = l_StyleKey_0.DialogMainButton
        }, 
        [l_StyleModifier_0.Selected] = {
            BottomLineColor = l_StyleKey_0.MainBackground, 
            BackgroundColor = l_StyleKey_0.MainBackground, 
            BorderColor = l_StyleKey_0.Border
        }, 
        [l_StyleModifier_0.Disabled] = {
            Color = l_StyleKey_0.ButtonTextDisabled
        }
    });
end;
local function v69(v63) --[[ Line: 450 ]] --[[ Name: createValues ]]
    -- upvalues: v60 (copy), l_ComponentSymbols_0 (copy), v62 (copy), v1 (copy)
    local v64, v65 = v60(v63);
    local v66 = {};
    for v67, v68 in pairs(v65) do
        v66[l_ComponentSymbols_0:add(v67)] = v68;
    end;
    v62(v66);
    return v1.Dictionary.join(v64, v66);
end;
local v72 = {
    makePluginTheme = function() --[[ Line: 465 ]] --[[ Name: makePluginTheme ]]
        -- upvalues: l_StudioTheme_0 (copy), v21 (copy), v22 (copy), l_makeTheme_0 (copy), v2 (copy), v69 (copy)
        local v70 = l_StudioTheme_0.new(v21, v22);
        return l_makeTheme_0(v2.StyleRoot, v69(), v70)();
    end, 
    mock = function() --[[ Line: 470 ]] --[[ Name: mock ]]
        -- upvalues: l_StudioTheme_0 (copy), v21 (copy), v22 (copy), l_makeTheme_0 (copy), v2 (copy), v69 (copy)
        local v71 = l_StudioTheme_0.mock(v21, v22);
        return l_makeTheme_0(v2.StyleRoot, v69(true), v71)();
    end
};
v72.getMockTheme = function(_) --[[ Line: 475 ]] --[[ Name: getMockTheme ]]
    -- upvalues: v72 (copy)
    return v72.mock();
end;
return v72;