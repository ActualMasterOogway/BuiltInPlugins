local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Style_0 = v1.Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local v6 = {};
l_ComponentSymbols_0:add("Toolbar");
v6[l_ComponentSymbols_0.Toolbar] = {
    CellSize = UDim2.fromOffset(84, 60), 
    CellPadding = UDim2.fromOffset(2, 2), 
    IconSize = UDim2.fromOffset(30, 30), 
    OverflowTextSize = 15, 
    OverflowThreshold = 75, 
    StudioTheme = l_StyleKey_0.StudioTheme, 
    TabBackgroundColor = l_StyleKey_0.SubBackground, 
    TextSize = 18
};
l_ComponentSymbols_0:add("ToolSettings");
v6[l_ComponentSymbols_0.ToolSettings] = {
    BackgroundColor = l_StyleKey_0.MainBackground
};
l_ComponentSymbols_0:add("ImageRenderer");
v6[l_ComponentSymbols_0.ImageRenderer] = {
    ClearIcon = "rbxasset://textures/StudioSharedUI/preview_clear.png", 
    ExpandIcon = "rbxasset://textures/StudioSharedUI/preview_expand.png", 
    IconPadding = 3, 
    ImportIcon = "rbxasset://textures/StudioSharedUI/import@2x.png", 
    PreviewSize = UDim2.fromOffset(100, 100), 
    ToolbarTransparency = 0.4, 
    ToolbarBackgroundColor = l_StyleKey_0.ToolbarBackgroundColor, 
    ToolbarButtonBackgroundColor = l_StyleKey_0.ToolbarButtonBackgroundColor, 
    ToolbarHeight = 32
};
l_ComponentSymbols_0:add("MetadataDialog");
v6[l_ComponentSymbols_0.MetadataDialog] = {
    ImageBackgroundColor = Color3.new(0, 0, 0), 
    MetadataLineHeight = 16, 
    MinSize = Vector2.new(100, 100), 
    Padding = 4, 
    Size = Vector2.new(400, 400), 
    Spacing = 4
};
l_ComponentSymbols_0:add("MaterialRenderer");
v6[l_ComponentSymbols_0.MaterialRenderer] = {
    CornerRadius = UDim.new(0, 4), 
    DropdownItemHeight = 40, 
    DropdownPadding = 10, 
    Font = Enum.Font.BuilderSans, 
    FontSize = 18, 
    GridItemSize = 48, 
    InitialDistance = 6.2, 
    MaterialPreviewBackground = l_StyleKey_0.InputFieldBackground, 
    PreviewSize = 24, 
    SelectInputArrowSize = 16, 
    Spacing = 6
};
l_ComponentSymbols_0:add("ProgressDialog");
v6[l_ComponentSymbols_0.ProgressDialog] = {
    DescriptionHeight = 20, 
    MinContentSize = Vector2.new(320, 60), 
    Padding = 5, 
    ProgressHeight = 20, 
    Spacing = 5
};
l_ComponentSymbols_0:add("PlaneLockRenderer");
v6[l_ComponentSymbols_0.PlaneLockRenderer] = {
    Height = 32, 
    Icon = l_StyleKey_0.Reset, 
    Spacing = 6
};
l_ComponentSymbols_0:add("UpgradeRenderer");
v6[l_ComponentSymbols_0.UpgradeRenderer] = {
    Font = Enum.Font.SourceSans, 
    MaxWidth = 300, 
    Spacing = 12, 
    TextSize = 16
};
l_ComponentSymbols_0:add("Line");
v6[l_ComponentSymbols_0.Line] = {
    Color = BrickColor.White(), 
    TransparencyActive = 0.8, 
    Transparency = 0.3
};
l_ComponentSymbols_0:add("Brush");
v6[l_ComponentSymbols_0.Brush] = {
    CenterRadiusMultiplier = 0.015, 
    CenterTransparency = 0.25, 
    Color = BrickColor.White(), 
    MainTransparency = 0.95
};
v6[l_ComponentSymbols_0.SimpleTab] = {
    BorderSize = 1, 
    Spacing = 5, 
    Padding = {
        Left = 20, 
        Top = 4, 
        Bottom = 0, 
        Right = 20
    }, 
    TopLineHeight = 3, 
    Color = l_StyleKey_0.ButtonText, 
    BackgroundColor = l_StyleKey_0.SubBackground, 
    BorderColor = l_StyleKey_0.SubBackground, 
    TopLineColor = l_StyleKey_0.DialogMainButton, 
    BottomLineColor = l_StyleKey_0.SubBackground, 
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
};
local v7 = UDim.new(0, 6);
l_ComponentSymbols_0:add("MaterialGrid");
v6[l_ComponentSymbols_0.MaterialGrid] = {
    BackgroundColor = l_StyleKey_0.MainBackground, 
    GridItemBackgroundColor = l_StyleKey_0.Button, 
    GridItemBackgroundColorHovered = l_StyleKey_0.ButtonHover, 
    GridItemBorderColor = l_StyleKey_0.Border, 
    GridItemBorderColorSelected = l_StyleKey_0.InputFieldBorderSelected, 
    GridItemCornerRadius = UDim.new(0, 6), 
    GridItemPadding = 2, 
    GridItemSize = 128, 
    GridItemLabelPadding = {
        PaddingBottom = v7, 
        PaddingLeft = v7, 
        PaddingRight = v7
    }, 
    ListItemHeight = 40, 
    ListItemPadding = 0, 
    ListItemSpacing = 4, 
    MaterialPreviewStyle = "CornerBox", 
    Padding = 0, 
    ShimmerSizeOffset = 2, 
    TextSize = 20
};
l_ComponentSymbols_0:add("Note");
v6[l_ComponentSymbols_0.Note] = {
    Background = l_StyleKey_0.MainBackground, 
    KeyBackground = l_StyleKey_0.DimmedText, 
    EdgePadding = 2, 
    FramePadding = 3, 
    TextMargin = 2
};
l_ComponentSymbols_0:add("BrushSizeRenderer");
v6[l_ComponentSymbols_0.BrushSizeRenderer] = {
    LabelWidth = 20, 
    LockButtonWidth = 26, 
    RowHeight = 24, 
    Locked = l_StyleKey_0.Locked, 
    Unlocked = l_StyleKey_0.Unlocked
};
l_ComponentSymbols_0:add("MultiSelectionRenderer");
v6[l_ComponentSymbols_0.MultiSelectionRenderer] = {
    Spacing = 4
};
l_ComponentSymbols_0:add("ElevationRenderer");
v6[l_ComponentSymbols_0.ElevationRenderer] = {
    AddStyle = {
        Image = l_StyleKey_0.Add
    }, 
    ArrowSize = UDim2.fromOffset(10, 5), 
    ArrowStyle = {
        Image = "rbxasset://textures/TerrainEditor/trianglesmallinverted.png"
    }, 
    ButtonSize = UDim2.fromOffset(16, 16), 
    Corner = UDim.new(0, 4), 
    ImageColor = l_StyleKey_0.TextPrimary, 
    ImageColorSelected = l_StyleKey_0.DialogMainButton, 
    MaterialPreviewSize = UDim2.fromOffset(20, 20), 
    PreviewBorder = {
        Color = l_StyleKey_0.DialogMainButton, 
        Image = "rbxasset://textures/StudioToolbox/RoundedBorder.png", 
        SliceCenter = Rect.new(3, 3, 13, 13)
    }, 
    RemoveStyle = {
        Image = l_StyleKey_0.Remove
    }, 
    SliderAreaSize = UDim2.fromOffset(20, 182), 
    SliderSize = UDim2.fromOffset(20, 200), 
    TextBoxSize = UDim2.fromOffset(50, 20), 
    Spacing = 10
};
l_ComponentSymbols_0:add("SlopeRenderer");
v6[l_ComponentSymbols_0.SlopeRenderer] = {
    Height = 24, 
    Spacing = 6, 
    TextInputWidth = 50
};
l_ComponentSymbols_0:add("MaterialRangesRenderer");
v6[l_ComponentSymbols_0.MaterialRangesRenderer] = {
    BackgroundColor = BrickColor.new(0, 0, 0), 
    CloseButton = {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = "rbxasset://textures/DeveloperFramework/AssetPreview/close_button.png", 
        ImageColor3 = Color3.fromRGB(255, 255, 255), 
        Position = UDim2.fromScale(1, 0), 
        Size = UDim2.fromOffset(28, 28), 
        ZIndex = 2
    }, 
    Dialog = {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor = l_StyleKey_0.MainBackground, 
        Position = UDim2.fromScale(0.5, 0.5), 
        FillSize = UDim2.new(0, 250, 1, -60), 
        Size = UDim2.fromOffset(250, 0)
    }, 
    MinHeight = 639, 
    Padding = 6, 
    Reset = {
        Icon = l_StyleKey_0.Reset, 
        Size = UDim2.fromOffset(90, 32)
    }
};
l_ComponentSymbols_0:add("TerrainTypeRenderer");
v6[l_ComponentSymbols_0.TerrainTypeRenderer] = {
    BorderColor = l_StyleKey_0.DialogMainButton, 
    Height = 32, 
    IconSize = 24, 
    ItemsPerRow = 3, 
    ItemMinWidth = 130, 
    Spacing = 6
};
l_ComponentSymbols_0:add("SeedRenderer");
v6[l_ComponentSymbols_0.SeedRenderer] = {
    Height = 24, 
    Icon = l_StyleKey_0.Randomize, 
    Spacing = 6
};
return v6;