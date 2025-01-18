local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Style_0 = v2.Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_UIData_0 = v2.UIData;
local v8 = require(l_UIData_0.Alert.style);
local v9 = require(l_UIData_0.Button.style);
local v10 = require(l_UIData_0.DropdownMenu.style);
local v11 = require(l_UIData_0.Image.style);
local v12 = require(l_UIData_0.Pane.style);
local v13 = require(l_UIData_0.ScrollingFrame.style);
local v14 = require(l_UIData_0.SelectInput.style);
local v15 = require(l_UIData_0.Separator.style);
local v16 = require(l_UIData_0.SimpleTab.style);
local v17 = require(l_UIData_0.Tooltip.style);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerPickTabsMenu);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerRerunValidation);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioAvatarAutosetupReportsProgress);
local v23 = game:DefineFastFlag("AvatarPreviewerTabBarTopLine", false);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUI);
local v25 = game:DefineFastFlag("DebugAvatarPreviewerDropdownMenuInfiniteMaxHeight", false);
local v26 = {};
local v27 = v24() and 50 or 42;
local v28 = v24() and 45 or 32;
l_ComponentSymbols_0:add("AddItemButton");
v26[l_ComponentSymbols_0.AddItemButton] = {
    Height = v27, 
    Image = "rbxasset://textures/AvatarCompatibilityPreviewer/add.png", 
    ImageColor = l_StyleKey_0.TextSecondary, 
    ImageColorDisabled = l_StyleKey_0.TextDisabled, 
    ImageSize = 20, 
    PaddingTop = v24() and 5 or 3, 
    PaddingLeft = v24() and 5 or nil, 
    PaddingRight = v24() and 9 or nil, 
    PaddingBottom = v24() and 5 or 3, 
    FailureDialogSpacing = UDim.new(0, 4)
};
l_ComponentSymbols_0:add("AnimationControllerDisplay");
v26[l_ComponentSymbols_0.AnimationControllerDisplay] = {
    Padding = 30, 
    Position = UDim2.new(0, 0, 1, -12), 
    Size = UDim2.new(1, 0, 0, 32)
};
l_ComponentSymbols_0:add("AnimationPlaybackSlider");
v26[l_ComponentSymbols_0.AnimationPlaybackSlider] = {
    PlayImage = l_StyleKey_0.PlayImage, 
    PauseImage = "rbxasset://textures/LayeredClothingEditor/Icon_Pause.png", 
    PlayButtonWidth = 20, 
    PlayTimeLabelWidth = 60, 
    Padding = 12
};
l_ComponentSymbols_0:add("AnimationPreview");
v26[l_ComponentSymbols_0.AnimationPreview] = {
    PausedAnimationAlpha = 0.5, 
    ["&BodyPreview"] = {
        FrontRightAngleLerp = 0.4
    }, 
    ["&FacePreview"] = {
        FieldOfView = 30, 
        FrontRightAngleLerp = 0.08, 
        InitialDistance = 2.8
    }
};
l_ComponentSymbols_0:add("AssetPalettes");
v26[l_ComponentSymbols_0.AssetPalettes] = {
    BackgroundColor = l_StyleKey_0.SubBackground2, 
    BackgroundColorHover = l_StyleKey_0.ActionHover, 
    ScrollingFrame = v1.Dictionary.join(v13, {
        BackgroundColor3 = l_StyleKey_0.SubBackground2, 
        BackgroundTransparency = 0, 
        Padding = 0, 
        ScrollBarThickness = 0, 
        Spacing = UDim.new(0, 5)
    }), 
    Size = UDim2.new(1, 0, 0, 24)
};
l_ComponentSymbols_0:add("AutoSetupScreen");
v26[l_ComponentSymbols_0.AutoSetupScreen] = {
    AlertPaddingHorizontal = UDim.new(0, 20), 
    AlertPaddingVertical = UDim.new(0, 8), 
    ControlsPosition = UDim2.new(1, -16, 1, -16), 
    SpinRate = -0.25
};
l_ComponentSymbols_0:add("AvatarScreen");
v26[l_ComponentSymbols_0.AvatarScreen] = {
    AssetPalettes = {
        BackgroundColor = l_StyleKey_0.SubBackground2, 
        SeparatorColor = l_StyleKey_0.SubBackground, 
        SeparatorWidth = v24() and 0 or 4, 
        Width = v24() and 104 or 122
    }, 
    Tabs = {
        Height = 64, 
        VerticalOffset = -4
    }
};
l_ComponentSymbols_0:add("Background");
v26[l_ComponentSymbols_0.Background] = {
    Image = l_StyleKey_0.PreviewerBackgroundImage
};
if v19() then
    l_ComponentSymbols_0:add("BodyPointsTool");
    v26[l_ComponentSymbols_0.BodyPointsTool] = {
        ProjectionImage = l_StyleKey_0.Projection, 
        SymmetricalImage = l_StyleKey_0.Symmetry
    };
end;
if v19() then
    l_ComponentSymbols_0:add("CageEditingTool");
    v26[l_ComponentSymbols_0.CageEditingTool] = {
        FalloffImage = l_StyleKey_0.Falloff, 
        MirrorToLeftImage = l_StyleKey_0.MirrorToLeft, 
        MirrorToRightImage = l_StyleKey_0.MirrorToRight, 
        RadiusImage = l_StyleKey_0.Radius, 
        ResetChangesImage = l_StyleKey_0.ResetChanges, 
        SymmetryImage = l_StyleKey_0.Symmetry
    };
end;
l_ComponentSymbols_0:add("Catalog");
v26[l_ComponentSymbols_0.Catalog] = {
    ScrollingFrame = v1.Dictionary.join(v13, {
        BorderColor3 = l_StyleKey_0.Border, 
        Padding = v24() and 0 or 10, 
        ScrollBarThickness = v24() and 4 or nil, 
        VerticalScrollBarInset = if v24() then Enum.ScrollBarInset.Always else Enum.ScrollBarInset.ScrollBar
    }), 
    ScrollingFrameHeight = UDim.new(1, -v27), 
    CellSize = UDim2.fromOffset(90, 90)
};
l_ComponentSymbols_0:add("CatalogItemButton");
v26[l_ComponentSymbols_0.CatalogItemButton] = {
    HoverX = {
        Color = l_StyleKey_0.TextSecondary, 
        Image = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/x_dark.png", 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -4, 0, 4), 
        Size = UDim2.fromOffset(13, 13)
    }, 
    AccessoryTypeImage = {
        Color = l_StyleKey_0.TextSecondary, 
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.fromOffset(4, 4), 
        Size = UDim2.fromOffset(13, 13), 
        LayeredImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/layered@2x.png", 
        RigidImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/rigid@2x.png"
    }, 
    UserImage = {
        Color = l_StyleKey_0.TextSecondary, 
        Image = "rbxasset://textures/AvatarCompatibilityPreviewer/user.png", 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -4, 1, -20), 
        Size = UDim2.fromOffset(13, 16)
    }, 
    Padding = 4, 
    TextLabelPadding = UDim.new(0, 8), 
    DEPRECATED_ItemNamePaddingBottom = if v24() then nil else UDim.new(0, 12)
};
l_ComponentSymbols_0:add("ContextualSurveyDialogButton");
v26[l_ComponentSymbols_0.ContextualSurveyDialogButton] = {
    Image = l_StyleKey_0.SendFeedback, 
    Position = UDim2.new(0, 28, 1, -60), 
    Size = UDim2.fromOffset(24, 24)
};
if v22() then
    l_ComponentSymbols_0:add("GenerationCard");
    v26[l_ComponentSymbols_0.GenerationCard] = {
        TitleFont = Enum.Font.SourceSansBold, 
        PrimaryActionFont = Enum.Font.SourceSans, 
        BackgroundColor = l_StyleKey_0.AlertBackgroundDefault, 
        BackgroundColorHoverDarkerMultiplier = 0.15, 
        TextColor = l_StyleKey_0.TextPrimary, 
        TextSize = 18, 
        CornerRadius = UDim.new(0, 8), 
        InnerPadding = 12, 
        MaxWidth = 500, 
        StrokeColor = l_StyleKey_0.OtherDivider, 
        StrokeThickness = 1
    };
end;
if not v18() then
    l_ComponentSymbols_0:add("DummyPreview");
    v26[l_ComponentSymbols_0.DummyPreview] = {
        Ambient = Color3.fromRGB(170, 185, 200), 
        LightColor = Color3.fromRGB(242, 236, 227), 
        LightDirection = Vector3.new(0.5, -1, 0.10000000149011612, 0), 
        PanSpeedMultiplier = 0.25, 
        PlatformHeight = 0.2, 
        PlatformSize = 5
    };
end;
if v19() then
    l_ComponentSymbols_0:add("EditingTools");
    v26[l_ComponentSymbols_0.EditingTools] = {
        AttachmentToolImage = l_StyleKey_0.AttachmentTool, 
        CageEditingToolImage = l_StyleKey_0.CageTool, 
        ShowClothingImage = l_StyleKey_0.ShowClothing
    };
end;
l_ComponentSymbols_0:add("EquippedItemsSidebar");
v26[l_ComponentSymbols_0.EquippedItemsSidebar] = {
    CellSize = if v24() then UDim2.fromOffset(v28, v28) else UDim2.fromOffset(50, 50), 
    FrameSizeOffset = 50, 
    ItemSpacing = if v24() then UDim.new(0, 5) else UDim.new(0, 2), 
    DEPRECATED_PositionOffset = if v24() then UDim2.fromOffset(0, 0) else UDim2.fromOffset(5, 10), 
    ScrollingFrameSizeOffset = if v24() then 2 * v28 else 83, 
    ScrollBarThickness = 4, 
    SidebarSpacing = v24() and 15 or 10, 
    Size = if v24() then UDim2.fromOffset(0, 0) else UDim2.new(0, 50, 1, -20), 
    SidebarPadding = 10
};
l_ComponentSymbols_0:add("EquippedItemPreview");
v26[l_ComponentSymbols_0.EquippedItemPreview] = {
    HoverX = {
        Image = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/x_dark.png", 
        AnchorPoint = Vector2.new(1, 0), 
        Position = if v24() then UDim2.new(1, -2, 0, 2) else UDim2.new(1, -4, 0, 4), 
        Size = UDim2.fromOffset(13, 13)
    }, 
    CornerRadius = UDim.new(0, 4), 
    StrokeColor = l_StyleKey_0.Border, 
    StrokeThickness = 1, 
    ItemHiddenTransparency = 0.7, 
    ItemWornTransparency = 0
};
l_ComponentSymbols_0:add("EquippedItemSideMenu");
v26[l_ComponentSymbols_0.EquippedItemSideMenu] = {
    DotsBackground = l_StyleKey_0.TextSecondary, 
    DotsBackgroundHover = l_StyleKey_0.TextContrast, 
    IconSize = 16, 
    Margin = 1
};
l_ComponentSymbols_0:add("ImportPage");
v26[l_ComponentSymbols_0.ImportPage] = {
    ArrowImage = "rbxasset://textures/AvatarCompatibilityPreviewer/img_triangle.png", 
    ArrowColor = l_StyleKey_0.TextPrimary, 
    Avatar = {
        IconSize = 75, 
        InnerPadding = 2, 
        NameFontSize = 16, 
        NameLines = 2, 
        Padding = 4, 
        TitleColor = l_StyleKey_0.TextLink, 
        PreviewAmbient = Color3.new(0.4, 0.4, 0.4)
    }, 
    BackButton = {
        Size = UDim2.fromOffset(24, 24), 
        IconSize = 12
    }, 
    HeaderHeight = 35, 
    GridPadding = UDim2.fromOffset(5, 15), 
    SearchBarHeight = UDim.new(0.8, 0)
};
l_ComponentSymbols_0:add("ItemDataPreviewModel");
v26[l_ComponentSymbols_0.ItemDataPreviewModel] = {
    InstanceAmbient = Color3.new(0.4, 0.4, 0.4)
};
l_ComponentSymbols_0:add("ModelPreview");
v26[l_ComponentSymbols_0.ModelPreview] = {
    Ambient = Color3.fromRGB(170, 185, 200), 
    EnableSky = true, 
    LightColor = Color3.fromRGB(221, 242, 242), 
    LightDirection = Vector3.new(0.4000000059604645, -0.5, 0.6000000238418579, 0), 
    PanSpeedMultiplier = 0.25, 
    PlatformHeight = 0.2, 
    PlatformSize = 5
};
l_ComponentSymbols_0:add("Notice");
v26[l_ComponentSymbols_0.Notice] = {
    BackgroundColor = l_StyleKey_0.SubBackground, 
    CornerRadius = UDim.new(0, 6), 
    TextColor = l_StyleKey_0.TextPrimary, 
    TextSize = 20, 
    Padding = {
        Left = 8, 
        Right = 8, 
        Top = 4, 
        Bottom = 4
    }
};
l_ComponentSymbols_0:add("PickTabMenu");
if v20() then
    v26[l_ComponentSymbols_0.PickTabMenu] = {
        CornerRadius = UDim.new(0, 6), 
        ImageColor = l_StyleKey_0.TextPrimary, 
        Padding = 6, 
        Position = UDim2.new(1, -32, 0, 0), 
        Size = UDim2.fromOffset(32, 32)
    };
end;
if not v18() then
    l_ComponentSymbols_0:add("PrimaryDummyPreview");
    v26[l_ComponentSymbols_0.PrimaryDummyPreview] = {
        BackgroundImage = l_StyleKey_0.PreviewerBackgroundImage
    };
end;
l_ComponentSymbols_0:add("ResetCameraButton");
v26[l_ComponentSymbols_0.ResetCameraButton] = {
    Size = UDim2.fromOffset(v28, v28), 
    Spacing = 5, 
    Image = l_StyleKey_0.ResetCameraImage
};
l_ComponentSymbols_0:add("SelectScreen");
v26[l_ComponentSymbols_0.SelectScreen] = {
    ButtonHeight = 24, 
    Spacing = UDim.new(0, 18)
};
l_ComponentSymbols_0:add("SimpleSelectScreen");
v26[l_ComponentSymbols_0.SimpleSelectScreen] = {
    BackgroundColor = l_StyleKey_0.IconBackgroundColor, 
    ImageBackgroundColor = l_StyleKey_0.SubBackground, 
    IconColor = Color3.fromRGB(248, 121, 43), 
    LineColor = v2.Style.Colors.Gray_Mid, 
    FontFace = Font.new(Font.fromEnum(Enum.Font.SourceSans).Family, Enum.FontWeight.SemiBold), 
    ImageSize = UDim2.fromOffset(50, 50), 
    Spacing = UDim.new(0, 10), 
    LineSize = UDim2.new(0, 15, 0, 1), 
    ButtonHeight = 32
};
l_ComponentSymbols_0:add("SkinPreview");
v26[l_ComponentSymbols_0.SkinPreview] = {
    HoveredBorderColor = l_StyleKey_0.SecondaryStatesHoverOutlineBorder, 
    HoveredBorderThickness = 1, 
    SelectedBorderColor = l_StyleKey_0.PrimaryMain, 
    SelectedBorderThickness = 2, 
    DisabledColorToBlend = Color3.fromRGB(76, 76, 76)
};
l_ComponentSymbols_0:add("StageSelector");
v26[l_ComponentSymbols_0.StageSelector] = {
    BackgroundColor = l_StyleKey_0.MainBackground, 
    ButtonSelectedBackgroundColor = l_StyleKey_0.ButtonHover, 
    ButtonHeight = 32, 
    IconColor = l_StyleKey_0.MainText, 
    IconColorDisabled = l_StyleKey_0.MainTextDisabled, 
    IconSize = 18, 
    Width = 64
};
l_ComponentSymbols_0:add("Stars");
v26[l_ComponentSymbols_0.Stars] = {
    StarColor = l_StyleKey_0.MainText, 
    StarSize = UDim2.fromOffset(16, 16), 
    StarFilled = l_StyleKey_0.Star, 
    StarUnfilled = l_StyleKey_0.StarUnfilled, 
    StarSpacing = 4, 
    RatingSpacing = 10
};
l_ComponentSymbols_0:add("SubmitDialog");
v26[l_ComponentSymbols_0.SubmitDialog] = {
    Width = 500
};
l_ComponentSymbols_0:add("SubmitInner");
v26[l_ComponentSymbols_0.SubmitInner] = {
    CallToActionSpacing = UDim.new(0, 18), 
    CheckboxSpacing = UDim.new(0, 4), 
    ContentPadding = 40
};
l_ComponentSymbols_0:add("Survey");
v26[l_ComponentSymbols_0.Survey] = {
    HeadIndent = 22, 
    Spacing = 10, 
    MessageHeight = 96
};
l_ComponentSymbols_0:add("SurveyDialog");
v26[l_ComponentSymbols_0.SurveyDialog] = {
    Width = 440, 
    FinishDialogSize = Vector2.new(250, 30)
};
l_ComponentSymbols_0:add("TabBar");
if v20() then
    v26[l_ComponentSymbols_0.TabBar] = {
        BackgroundColor = l_StyleKey_0.SubBackground, 
        BackgroundColorHover = l_StyleKey_0.ActionHover
    };
end;
l_ComponentSymbols_0:add("TestingScreen");
v26[l_ComponentSymbols_0.TestingScreen] = {
    ButtonHeight = 24, 
    Spacing = UDim.new(0, 18)
};
l_ComponentSymbols_0:add("ResizeNotice");
v26[l_ComponentSymbols_0.ResizeNotice] = {
    BackgroundColor = l_StyleKey_0.SubBackground, 
    Position = UDim2.new(0, 10, 0, 60), 
    AnchorPoint = Vector2.new(0, 0), 
    Size = UDim2.new(1, -v28 - 50, 0, 0)
};
l_ComponentSymbols_0:add("UGCValidationErrorDialog");
v26[l_ComponentSymbols_0.UGCValidationErrorDialog] = {
    DetailsSpacing = 12, 
    IconTextSpacing = 4, 
    TitleDetailsSpacing = 26, 
    AlertMinContentSize = Vector2.new(500, 300), 
    TextSize = 18, 
    WarningColor = l_StyleKey_0.WarningText, 
    WarningFont = Enum.Font.SourceSansSemibold, 
    WarningImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "warning.png"
};
l_ComponentSymbols_0:add("UGCValidationNotice");
v26[l_ComponentSymbols_0.UGCValidationNotice] = {
    Position = if v24() then UDim2.fromOffset(10, 10) else UDim2.fromOffset(8, -4), 
    Size = if v24() then UDim2.new(1, -v28 - 50, 0, 48) else UDim2.new(1, -v28 - 32, 0, 48), 
    ValidationIconSize = UDim2.fromOffset(24, 24), 
    WarningColor = l_StyleKey_0.WarningText, 
    WarningImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "warning.png"
};
l_ComponentSymbols_0:add("UGCValidationStatusIcon");
local v29 = {
    Color = Color3.new(1, 1, 1), 
    Position = UDim2.fromOffset(4, 14), 
    Size = UDim2.fromOffset(24, 24)
};
v26[l_ComponentSymbols_0.UGCValidationStatusIcon] = {
    ["&Failure"] = v1.Dictionary.join(v29, {
        Color = l_StyleKey_0.WarningText, 
        Image = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "warning.png"
    }), 
    ["&Success"] = v1.Dictionary.join(v29, {
        Image = l_StyleKey_0.UGCValidationSuccessImage
    }), 
    ["&InProgress"] = v21() and {
        Color = l_StyleKey_0.DimmedText, 
        Position = UDim2.fromOffset(4, 14), 
        Size = UDim2.fromOffset(20, 20), 
        Image = "rbxasset://textures/StudioToolbox/AssetConfig/recent.png"
    }
};
l_ComponentSymbols_0:add("DisambiguationMenu");
v26[l_ComponentSymbols_0.DisambiguationMenu] = {
    MinContentSize = Vector2.new(500, 300), 
    ConfirmCancelContentSize = Vector2.new(200, 150), 
    HorizontalSpacing = 8, 
    VerticalSpacing = 8, 
    TitleContentsSpacing = 24, 
    TextSpacing = 8, 
    DropdownWidth = 150, 
    AttachmentDropdownWidth = 120, 
    IconBackground = l_StyleKey_0.SubBackground, 
    IconSize = UDim2.fromOffset(72, 72)
};
l_ComponentSymbols_0:add("AvatarSizeRuler");
v26[l_ComponentSymbols_0.AvatarSizeRuler] = {
    GridSize = 0.1, 
    DimTransparency = 0.75, 
    MainTransparency = 0.5, 
    Padding = 30, 
    TextSize = 60, 
    PixelsPerStud = 200, 
    MajorStep = 10, 
    RulerColor = Color3.new(1, 1, 1)
};
l_ComponentSymbols_0:add("AvatarSizingBoundingBox");
v26[l_ComponentSymbols_0.AvatarSizingBoundingBox] = {
    NeutralColor = Color3.new(0.5, 0.5, 0.5), 
    ValidColor = Color3.new(0.5, 1, 0.5), 
    InvalidColor = Color3.new(1, 0.5, 0.5), 
    ValidTransparency = 0.8, 
    NeutralTransparency = 0.5
};
v26[l_ComponentSymbols_0.Alert] = v1.Dictionary.join(v8, {
    ["&Warning"] = v1.Dictionary.join(v8["&Warning"], {
        HorizontalPadding = if v24() then UDim.new(0, 0) else nil, 
        TopPadding = if v24() then UDim.new(0, 0) else nil
    }), 
    ["&Error"] = v1.Dictionary.join(v8["&Error"], {
        HorizontalPadding = if v24() then UDim.new(0, 0) else nil, 
        TopPadding = if v24() then UDim.new(0, 0) else nil
    }), 
    ["&Success"] = v1.Dictionary.join(v8["&Success"], {
        HorizontalPadding = if v24() then UDim.new(0, 0) else nil, 
        TopPadding = if v24() then UDim.new(0, 0) else nil
    }), 
    ["&Info"] = v1.Dictionary.join(v8["&Info"], {
        HorizontalPadding = if v24() then UDim.new(0, 0) else nil, 
        TopPadding = if v24() then UDim.new(0, 0) else nil
    }), 
    ["&WarningLong"] = v1.Dictionary.join(v8["&Warning"], {
        HorizontalPadding = if v24() then UDim.new(0, 0) else nil, 
        TopPadding = if v24() then UDim.new(0, 0) else nil, 
        MaxWidth = 900
    })
});
if v19() or v24() then
    v26[l_ComponentSymbols_0.Button] = v1.Dictionary.join(v9, {
        ["&RoundHighlighted"] = v1.Dictionary.join(v9["&Round"], {
            BackgroundStyle = v1.Dictionary.join(v9.BackgroundStyle, {
                BorderColor = l_StyleKey_0.SubText
            }), 
            [l_StyleModifier_0.Hover] = v1.Dictionary.join(v9[l_StyleModifier_0.Hover], {
                BackgroundStyle = v1.Dictionary.join(v9[l_StyleModifier_0.Hover].BackgroundStyle, {
                    BorderColor = l_StyleKey_0.SubText
                })
            })
        })
    });
end;
if v25 then
    v26[l_ComponentSymbols_0.DropdownMenu] = v1.Dictionary.join(v10, {
        MaxHeight = 1e999
    });
    v26[l_ComponentSymbols_0.SelectInput] = v1.Dictionary.join(v14, {
        DropdownMenu = v1.Dictionary.join(v14.DropdownMenu, {
            MaxHeight = 1e999
        })
    });
end;
v26[l_ComponentSymbols_0.Image] = v1.Dictionary.join(v11, {
    ["&EquippedItemHideIcon"] = {
        Image = l_StyleKey_0.Hide
    }, 
    ["&EquippedItemHideHoverIcon"] = {
        Image = l_StyleKey_0.HideHover
    }, 
    ["&EquippedItemHoverMenuBackground"] = {
        Image = l_StyleKey_0.HoverMenu
    }, 
    ["&EquippedItemUnhideIcon"] = {
        Image = l_StyleKey_0.Unhide
    }, 
    ["&EquippedItemUnhideHoverIcon"] = {
        Image = l_StyleKey_0.UnhideHover
    }, 
    ["&EquippedItemDisabledBackground"] = {
        Image = l_StyleKey_0.HoverMenuDisabled
    }, 
    ["&EquippedItemDotsIcon"] = {
        Image = l_StyleKey_0.Dots, 
        ImageColor3 = l_StyleKey_0.Button, 
        [l_StyleModifier_0.Hover] = {
            ImageColor3 = l_StyleKey_0.ImageButtonHover
        }
    }, 
    ["&PickTabMenu"] = {
        Image = l_StyleKey_0.DotsVertical, 
        Size = UDim2.fromOffset(20, 20)
    }
});
v26[l_ComponentSymbols_0.Separator] = v1.Dictionary.join(v15, {
    ["&SelectScreenSeparator"] = {
        StretchMargin = 5
    }
});
v26[l_ComponentSymbols_0.Pane] = v1.Dictionary.join(v12, {
    ["&EquippedItemPreview"] = {
        Background = l_StyleKey_0.Button, 
        CornerRadius = UDim.new(0, 4), 
        [l_StyleModifier_0.Hover] = {
            Background = l_StyleKey_0.ButtonHover
        }, 
        [l_StyleModifier_0.Disabled] = {
            Background = l_StyleKey_0.ButtonPressed
        }
    }, 
    ["&EquippedItemPreviewInner"] = {
        CornerRadius = UDim.new(0, 4)
    }, 
    ["&EquippedItemHoverMenu"] = {
        Background = l_StyleKey_0.ForegroundMuted
    }, 
    ["&SkinPreview"] = {
        CornerRadius = UDim.new(0, 4)
    }
});
v26[l_ComponentSymbols_0.SimpleTab] = v1.Dictionary.join(v16, {
    ["&AssetPaletteTab"] = {
        BackgroundColor = l_StyleKey_0.SubBackground2, 
        BackgroundTransparency = 1, 
        BorderSize = 0, 
        Padding = {
            Left = 12, 
            Top = 2, 
            Bottom = 0, 
            Right = 12
        }, 
        TopLineHeight = 0, 
        [l_StyleModifier_0.Selected] = {
            BackgroundColor = l_StyleKey_0.SubBackground2, 
            Font = Enum.Font.SourceSansBold
        }
    }, 
    ["&CategoryTab"] = {
        BorderSize = 0, 
        TopLineHeight = v23 and 3 or nil
    }
});
v26[l_ComponentSymbols_0.Tooltip] = v1.Dictionary.join(v17, {
    ["&NoDelay"] = {
        ShowDelay = 0
    }
});
return v26;