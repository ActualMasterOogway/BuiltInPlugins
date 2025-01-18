local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_createStyleSheet_0 = v1.Styling.createStyleSheet;
local v4 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v5 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageStudioTestTemplates)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local l_StudioService_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StudioService;
local l_StudioUserService_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StudioUserService;
local v8 = {
    l_createStyleRule_0(".StartPage-Background", {
        BackgroundColor3 = "$Background", 
        BackgroundTransparency = 0
    }), 
    l_createStyleRule_0(".StartPage-PageBackground", {
        BackgroundColor3 = "$PageBackground", 
        BackgroundTransparency = 0
    }), 
    l_createStyleRule_0(".StartPage-MenuBackground", {
        BackgroundColor3 = "$MenuBackground", 
        BackgroundTransparency = 0
    }), 
    l_createStyleRule_0(".StartPage-ContextMenuBackground", {
        BackgroundColor3 = "$ContextMenuBackground", 
        BackgroundTransparency = 0
    }), 
    l_createStyleRule_0(".StartPage-AlertBackground", {
        BackgroundColor3 = "$AlertColor", 
        BackgroundTransparency = 0
    }), 
    l_createStyleRule_0(".StartPage-Selected", {
        BackgroundColor3 = "$Selected"
    }), 
    l_createStyleRule_0(".StartPage-Contrast", {
        BackgroundColor3 = "$Contrast", 
        BackgroundTransparency = 0
    }), 
    l_createStyleRule_0(".StartPage-NoTextStroke", {
        TextStrokeTransparency = 1
    }), 
    l_createStyleRule_0(".StartPage-TextColor", {
        TextColor3 = "$TextColor"
    }), 
    l_createStyleRule_0(".StartPage-WhiteTextColor", {
        TextColor3 = "$WhiteColor"
    }), 
    l_createStyleRule_0(".StartPage-ContrastTextColor", {
        TextColor3 = "$ContrastTextColor"
    }), 
    l_createStyleRule_0(".StartPage-DisabledTextColor", {
        TextColor3 = "$Disabled"
    }), 
    l_createStyleRule_0(".StartPage-ButtonBackgroundColor", {
        BackgroundColor3 = Color3.fromHex("#3C64FA"), 
        BackgroundTransparency = 0
    }), 
    l_createStyleRule_0(".StartPage-Font", {
        Font = Enum.Font.BuilderSans, 
        LineHeight = 1.142
    }), 
    l_createStyleRule_0(".StartPage-FontBold", {
        Font = Enum.Font.BuilderSansBold, 
        LineHeight = 1.6
    }), 
    l_createStyleRule_0(".StartPage-FontExtraBold", {
        Font = Enum.Font.BuilderSansExtraBold, 
        LineHeight = 1.6
    }), 
    l_createStyleRule_0(".StartPage-TextSizeXS", {
        TextSize = "$TextSizeXS"
    }), 
    l_createStyleRule_0(".StartPage-TextSize", {
        TextSize = "$TextSize"
    }), 
    l_createStyleRule_0(".StartPage-TextSizeM", {
        TextSize = "$TextSizeM"
    }), 
    l_createStyleRule_0(".StartPage-TextSizeL", {
        TextSize = "$TextSizeL"
    }), 
    l_createStyleRule_0(".StartPage-IconSize", {
        Size = "$IconSize"
    }), 
    l_createStyleRule_0(".StartPage-IconSizeM", {
        Size = "$IconSizeM"
    }), 
    l_createStyleRule_0(".StartPage-RoundedCorner8 ::UICorner", {
        CornerRadius = "$CornerSize8"
    }), 
    l_createStyleRule_0(".StartPage-RoundedCorner12 ::UICorner", {
        CornerRadius = "$CornerSize12"
    }), 
    l_createStyleRule_0(".StartPage-RoundedCorner16 ::UICorner", {
        CornerRadius = "$CornerSize16"
    }), 
    l_createStyleRule_0(".StartPage-RoundedCorner32 ::UICorner", {
        CornerRadius = "$CornerSize32"
    }), 
    l_createStyleRule_0(".StartPage-Circular ::UICorner", {
        CornerRadius = UDim.new(1, 0)
    }), 
    l_createStyleRule_0(".StartPage-SearchBar", {
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = Enum.Font.BuilderSans, 
        BorderSizePixel = 0, 
        BackgroundColor3 = "$PageBackground"
    }), 
    l_createStyleRule_0(".StartPage-Highlight", {
        BackgroundColor3 = Color3.fromHex("#BBBCBE"), 
        BackgroundTransparency = 0.92
    }), 
    l_createStyleRule_0(".StartPage-TileBorder ::UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = "$HoverBorder", 
        Thickness = 1
    }), 
    l_createStyleRule_0(".StartPage-PillPaddingS ::UIPadding", {
        PaddingLeft = UDim.new(0, 10), 
        PaddingRight = UDim.new(0, 10), 
        PaddingTop = UDim.new(0, 4), 
        PaddingBottom = UDim.new(0, 4)
    }), 
    l_createStyleRule_0(".StartPage-PillPadding ::UIPadding", {
        PaddingLeft = UDim.new(0, 12), 
        PaddingRight = UDim.new(0, 12), 
        PaddingTop = UDim.new(0, 8), 
        PaddingBottom = UDim.new(0, 8)
    }), 
    l_createStyleRule_0(".StartPage-ButtonPadding ::UIPadding", {
        PaddingLeft = UDim.new(0, 20), 
        PaddingRight = UDim.new(0, 20), 
        PaddingTop = UDim.new(0, 12), 
        PaddingBottom = UDim.new(0, 12)
    }), 
    l_createStyleRule_0(".StartPage-TilePadding ::UIPadding", {
        PaddingLeft = UDim.new(0, 12), 
        PaddingRight = UDim.new(0, 12), 
        PaddingTop = UDim.new(0, 12), 
        PaddingBottom = UDim.new(0, 12)
    }), 
    l_createStyleRule_0(".StartPage-TablePadding ::UIPadding", {
        PaddingLeft = if v4 then nil else UDim.new(0, 16), 
        PaddingRight = if v4 then nil else UDim.new(0, 16), 
        PaddingTop = UDim.new(0, 10), 
        PaddingBottom = UDim.new(0, 10)
    }), 
    l_createStyleRule_0(".StartPage-DescPadding ::UIPadding", {
        PaddingLeft = UDim.new(0, 0), 
        PaddingRight = UDim.new(0, 0), 
        PaddingTop = UDim.new(0, 12), 
        PaddingBottom = UDim.new(0, 12)
    }), 
    l_createStyleRule_0(".StartPage-SearchRowPadding ::UIPadding", {
        PaddingLeft = UDim.new(0, 8), 
        PaddingRight = UDim.new(0, 8), 
        PaddingTop = UDim.new(0, 8), 
        PaddingBottom = UDim.new(0, 8)
    }), 
    l_createStyleRule_0(".StartPage-GamePagePadding ::UIPadding", {
        PaddingLeft = UDim.new(0, 32), 
        PaddingRight = UDim.new(0, 32), 
        PaddingTop = UDim.new(0, 17), 
        PaddingBottom = UDim.new(0, 0)
    }), 
    l_createStyleRule_0(".StartPage-LeftPadding32 ::UIPadding", {
        PaddingLeft = UDim.new(0, 32), 
        PaddingRight = UDim.new(0, 15), 
        PaddingTop = UDim.new(0, 0), 
        PaddingBottom = UDim.new(0, 0)
    }), 
    l_createStyleRule_0(".StartPage-PaddingX8 ::UIPadding", {
        PaddingLeft = UDim.new(0, 8), 
        PaddingRight = UDim.new(0, 8), 
        PaddingTop = UDim.new(0, 0), 
        PaddingBottom = UDim.new(0, 0)
    }), 
    l_createStyleRule_0(".StartPage-PaddingY8 ::UIPadding", {
        PaddingLeft = UDim.new(0, 0), 
        PaddingRight = UDim.new(0, 0), 
        PaddingTop = UDim.new(0, 8), 
        PaddingBottom = UDim.new(0, 8)
    }), 
    l_createStyleRule_0(".StartPage-Padding16 ::UIPadding", {
        PaddingLeft = UDim.new(0, 16), 
        PaddingRight = UDim.new(0, 16), 
        PaddingTop = UDim.new(0, 16), 
        PaddingBottom = UDim.new(0, 16)
    }), 
    l_createStyleRule_0(".StartPage-Padding24 ::UIPadding", {
        PaddingLeft = UDim.new(0, 24), 
        PaddingRight = UDim.new(0, 24), 
        PaddingTop = UDim.new(0, 24), 
        PaddingBottom = UDim.new(0, 24)
    }), 
    l_createStyleRule_0(".StartPage-Padding32 ::UIPadding", {
        PaddingLeft = UDim.new(0, 32), 
        PaddingRight = UDim.new(0, 32), 
        PaddingTop = UDim.new(0, 32), 
        PaddingBottom = UDim.new(0, 32)
    }), 
    l_createStyleRule_0(".StartPage-ContextMenuPadding ::UIPadding", {
        PaddingLeft = UDim.new(0, 8), 
        PaddingRight = UDim.new(0, 8), 
        PaddingTop = UDim.new(0, 8), 
        PaddingBottom = UDim.new(0, 8)
    }), 
    l_createStyleRule_0(".StartPage-ContextMenuRowPadding ::UIPadding", {
        PaddingLeft = UDim.new(0, 8), 
        PaddingRight = UDim.new(0, 8), 
        PaddingTop = UDim.new(0, 4), 
        PaddingBottom = UDim.new(0, 4)
    }), 
    l_createStyleRule_0(".StartPage-PadScrollingCarouselLeft ::UIPadding", {
        PaddingLeft = UDim.new(0, 2)
    }), 
    l_createStyleRule_0(".StartPage-Border ::UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = "$Border", 
        Transparency = 0.88, 
        Thickness = 1
    }), 
    l_createStyleRule_0(".StartPage-NoBorder", {
        BorderSizePixel = 0
    }), 
    l_createStyleRule_0(".StartPage-BorderColor", {
        BackgroundColor3 = "$Border", 
        Transparency = 0.88
    }), 
    l_createStyleRule_0(".StartPage-StandardTextColor", {
        TextColor3 = "$Standard"
    }), 
    l_createStyleRule_0(".StartPage-StandardDarkTextColor", {
        TextColor3 = "$StandardDark"
    }), 
    l_createStyleRule_0(".StartPage-MutedTextColor", {
        TextColor3 = "$SemanticColorContentMuted"
    }), 
    l_createStyleRule_0(".StartPage-LinkTextColor", {
        TextColor3 = "$SemanticColorContentAction"
    }), 
    l_createStyleRule_0(".StartPage-Standard", {
        BackgroundColor3 = "$Standard"
    }), 
    l_createStyleRule_0(".StartPage-StandardDarkBackground", {
        BackgroundColor3 = "$StandardDark"
    }), 
    l_createStyleRule_0(".StartPage-TileBackground", {
        BackgroundColor3 = "$TileBackground", 
        BackgroundTransparency = 0
    }, {
        l_createStyleRule_0(":hover :: UIStroke", {
            StrokeApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = "$Border", 
            Transparency = 0.88, 
            Thickness = 2
        })
    }), 
    l_createStyleRule_0(".StartPage-PillBackground", {
        BackgroundColor3 = "$PillBackground", 
        BackgroundTransparency = 0
    }), 
    l_createStyleRule_0(".StartPage-MenuItemSelectedBackground", {
        BackgroundColor3 = "$MenuItemSelectedBackground", 
        BackgroundTransparency = 0
    }), 
    l_createStyleRule_0(".StartPage-ShimmerBackground", {
        BackgroundColor3 = "$ShimmerBackground", 
        BackgroundTransparency = "$ShimmerBackgroundTransparency"
    }), 
    l_createStyleRule_0(".StartPage-ShimmerForeground", {
        BackgroundColor3 = "$ShimmerForeground"
    }), 
    l_createStyleRule_0(".StartPage-ShimmerGradient", {
        Transparency = "$ShimmerGradientTransparency"
    }), 
    l_createStyleRule_0(".StartPage-NoExperiences", {
        Image = "$NoExperiences", 
        Size = UDim2.new(0, 96, 0, 96)
    }), 
    l_createStyleRule_0(".StartPage-RightIcon", {
        Image = "$RightChevron", 
        Size = "$IconSizeM"
    }), 
    l_createStyleRule_0(".StartPage-HomeIcon", {
        Image = "$Home", 
        Size = "$IconSizeM"
    }), 
    l_createStyleRule_0(".StartPage-PlusIcon", {
        Image = "$Plus", 
        Size = UDim2.new(0, 16, 0, 16)
    }), 
    l_createStyleRule_0(".StartPage-GridIcon", {
        Image = "$Grid", 
        Size = UDim2.new(0, 24, 0, 24)
    }), 
    l_createStyleRule_0(".StartPage-ListIcon", {
        Image = "$List", 
        Size = UDim2.new(0, 24, 0, 24)
    }), 
    l_createStyleRule_0(".StartPage-AlertIcon", {
        Image = "$Alert", 
        Size = "$IconSize"
    }), 
    l_createStyleRule_0(".StartPage-ExperiencesIcon", {
        Image = "$Experiences", 
        Size = "$IconSizeM"
    }), 
    l_createStyleRule_0(".StartPage-ArchiveIcon", {
        Image = "$Archive", 
        Size = "$IconSizeM"
    }), 
    l_createStyleRule_0(".StartPage-TemplatesIcon", {
        Image = "$Templates", 
        Size = "$IconSizeM"
    }), 
    l_createStyleRule_0(".StartPage-RecentsIcon", {
        Image = "$Recents", 
        Size = "$IconSizeM"
    }), 
    l_createStyleRule_0(".StartPage-SearchIcon", {
        Image = "$Search", 
        Size = "$IconSizeM"
    }), 
    l_createStyleRule_0(".StartPage-KebabIcon", {
        Image = "$Kebab", 
        Size = "$IconSizeL"
    }), 
    l_createStyleRule_0(".StartPage-CancelIcon", {
        Image = "$Cancel", 
        Size = "$IconSizeS"
    }), 
    l_createStyleRule_0(".StartPage-CancelWhiteIcon", {
        Image = "$CancelWhite", 
        Size = "$IconSizeS"
    }), 
    l_createStyleRule_0(".StartPage-Chevron", {
        Image = "$Chevron"
    }), 
    l_createStyleRule_0(".StartPage-TeamCreateOnlineBackground", {
        BackgroundColor3 = "$TeamCreatePresenceOnlineColor"
    }), 
    l_createStyleRule_0(".StartPage-AdditionalTCCollaboratorBackground", {
        BackgroundColor3 = "$HoverBorder"
    }), 
    l_createStyleRule_0(".StartPage-ColumnTutorialPopup", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 32), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".StartPage-SearchResultRowColumn", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 6), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".StartPage-HomePageColumn", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 16), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".StartPage-PopupTextboxColumn", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".StartPage-PopupTextBoxTextButtonColumn", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 16), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    })
};
if v5 and l_StudioUserService_0.IsLoggedIn and l_StudioService_0:HasInternalPermission() then
    table.insert(v8, l_createStyleRule_0(".StartPage-TestTemplatesIcon", {
        Image = "$CodeSnippet", 
        Size = "$IconSizeM"
    }));
end;
return l_createStyleSheet_0("StartPage", v8, {
    IconSizeS = UDim2.new(0, 12, 0, 12), 
    IconSize = UDim2.new(0, 16, 0, 16), 
    IconSizeM = UDim2.new(0, 24, 0, 24), 
    IconSizeL = UDim2.new(0, 32, 0, 32), 
    CornerSize8 = UDim.new(0, 8), 
    CornerSize12 = UDim.new(0, 12), 
    CornerSize16 = UDim.new(0, 16), 
    CornerSize32 = UDim.new(0, 32), 
    TextSizeXS = 12, 
    TextSize = 16, 
    TextSizeM = 24, 
    TextSizeL = 40, 
    TeamCreatePresenceOnlineColor = Color3.fromHex("#0fb369"), 
    AlertColor = Color3.fromHex("#335FFF"), 
    WhiteColor = Color3.fromHex("#FFFFFF")
});