local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_Style_0 = v1.Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_Colors_0 = l_Style_0.Colors;
local l_getRawComponentStyle_0 = l_Style_0.getRawComponentStyle;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_join_0 = v1.Dash.join;
local v10 = settings().Studio.Theme.Name == "Dark";
local v11 = {
    Title = {
        Font = Enum.Font.SourceSans, 
        TextSize = 24, 
        TextColor3 = l_StyleKey_0.TitlebarText
    }, 
    Normal = {
        Font = Enum.Font.SourceSans, 
        TextSize = 22, 
        TextColor3 = l_StyleKey_0.MainText
    }, 
    Smaller = {
        Font = Enum.Font.SourceSans, 
        TextSize = 20, 
        TextColor3 = l_StyleKey_0.MainText
    }, 
    Subtext = {
        Font = Enum.Font.SourceSans, 
        TextSize = 16, 
        TextColor3 = l_StyleKey_0.DimmedText
    }
};
local v12 = l_join_0(l_getRawComponentStyle_0("Image"), {
    ["&TooltipStyle"] = {
        Image = "rbxasset://textures/PublishPlaceAs/MoreDetails.png", 
        Color = l_StyleKey_0.SubText, 
        [l_StyleModifier_0.Hover] = {
            Color = l_StyleKey_0.MainTextHover
        }
    }
});
local v13 = {
    font = Enum.Font.SourceSans, 
    fontStyle = v11, 
    backgroundColor = l_StyleKey_0.MainBackground, 
    foregroundColorContrast = l_StyleKey_0.ForegroundContrast, 
    textColor = l_StyleKey_0.MainText, 
    subTextColor = l_StyleKey_0.SubText, 
    dimmerTextColor = l_StyleKey_0.DimmedText, 
    warningTextColor = l_StyleKey_0.WarningText, 
    disabledColor = l_StyleKey_0.Tab, 
    borderColor = l_StyleKey_0.Border, 
    hoverColor = l_Colors_0.Blue, 
    errorColor = l_StyleKey_0.ErrorText, 
    icons = {
        newPlace = "rbxasset://textures/PublishPlaceAs/WhiteNew.png", 
        backArrow = "rbxasset://textures/PublishPlaceAs/navigation_pushBack.png", 
        checkmark = "rbxasset://textures/PublishPlaceAs/common_checkmarkCircle.png", 
        thumbnailPlaceHolder = "rbxasset://textures/StudioSharedUI/TransparentWhiteImagePlaceholder.png", 
        warning = "rbxasset://textures/StudioSharedUI/statusWarning.png", 
        backgroundColor = l_StyleKey_0.IconBackgroundColor, 
        imageColor = l_StyleKey_0.IconImageColor
    }, 
    descriptionBox = {
        maxHeight = 120, 
        textBoxHeight = 72
    }, 
    toggleButton = {
        width = 40, 
        height = 24
    }, 
    dialog = {
        minSize = {
            width = 400, 
            height = 204
        }, 
        spacing = 20
    }, 
    tooltipIcon = {
        paddingY = 30, 
        size = 14
    }, 
    optInLocations = {
        height = 52
    }, 
    requirementsLink = {
        height = 22, 
        length = 250, 
        paddingY = 25
    }, 
    emailDialog = {
        Size = {
            X = 500, 
            Y = 350
        }
    }, 
    selectInput = {
        button = {
            height = 38
        }, 
        fontStyle = {
            Normal = {
                TextSize = 22
            }
        }, 
        padding = 10, 
        width = {
            creator = 330, 
            genre = 210
        }
    }, 
    defaultButton = {
        ButtonColor = l_StyleKey_0.DialogMainButton, 
        ButtonColor_Hover = l_StyleKey_0.LinkText, 
        ButtonColor_Disabled = l_StyleKey_0.DialogMainButtonDisabled, 
        TextColor = l_StyleKey_0.DialogMainButtonText, 
        TextColor_Disabled = l_StyleKey_0.DialogMainButtonTextDisabled, 
        BorderColor = l_StyleKey_0.Light
    }, 
    cancelButton = {
        ButtonColor = l_StyleKey_0.Button, 
        ButtonColor_Hover = l_StyleKey_0.ButtonHover, 
        ButtonColor_Disabled = l_StyleKey_0.ButtonDisabled, 
        TextColor = l_StyleKey_0.ButtonText, 
        TextColor_Disabled = l_StyleKey_0.DimmedText, 
        BorderColor = l_StyleKey_0.Border
    }, 
    pageButton = {
        ButtonColor = l_StyleKey_0.Button, 
        ImageColor = l_StyleKey_0.MainText, 
        BorderColor = l_StyleKey_0.Border, 
        hovered = {
            ButtonColor = l_StyleKey_0.ButtonHover
        }, 
        disabled = {
            ButtonColor = l_StyleKey_0.ButtonDisabled, 
            ImageColor = l_StyleKey_0.DimmedText
        }
    }, 
    menuBar = {
        backgroundColor = l_StyleKey_0.MenuBarBackground
    }, 
    menuEntry = {
        hover = l_StyleKey_0.MenuEntryHover, 
        highlight = l_StyleKey_0.MenuEntryHighlight, 
        text = l_StyleKey_0.BrightText, 
        font = {
            selected = Enum.Font.SourceSansSemibold, 
            unselected = Enum.Font.SourceSans
        }
    }, 
    footer = {
        gradient = l_StyleKey_0.MainText, 
        textbutton = {
            font = Enum.Font.SourceSans
        }
    }, 
    header = {
        font = Enum.Font.SourceSans, 
        text = l_StyleKey_0.BrightText
    }, 
    checkboxset = {
        font = Enum.Font.SourceSans, 
        error = l_StyleKey_0.ErrorText, 
        maxHeight = 65
    }, 
    listDialog = {
        font = Enum.Font.SourceSansSemibold, 
        textColor = l_StyleKey_0.MainText
    }, 
    successText = {
        font = Enum.Font.SourceSans, 
        text = Color3.fromRGB(2, 183, 87)
    }, 
    textWithInlineLink = {
        maxWidth = 380
    }, 
    failText = {
        font = Enum.Font.SourceSans, 
        text = l_StyleKey_0.ErrorText
    }, 
    pageText = {
        font = Enum.Font.SourceSansLight
    }, 
    radioButton = {
        backgroundColor = l_StyleKey_0.InputFieldBackground, 
        size = 20, 
        image = {
            background = "rbxasset://textures/GameSettings/RadioButton.png", 
            selected = l_StyleKey_0.RadioButtonImage
        }
    }, 
    genreInfo = {
        image = l_StyleKey_0.InformationImage, 
        imageSize = 20, 
        imageTextGap = 2, 
        BodyBodyDefault = {
            Font = Enum.Font.SourceSans, 
            TextSize = 18, 
            TextColor = l_StyleKey_0.MainText
        }, 
        paneBackgroundColor = l_StyleKey_0.ForegroundContrast, 
        paneBorderColor = l_StyleKey_0.OtherDivider, 
        panePadding = 8, 
        paneBorderSize = 1
    }, 
    DROPDOWN_WIDTH = 330, 
    DROPDOWN_HEIGHT = 38, 
    MENU_BAR_WIDTH = 192, 
    FOOTER_HEIGHT = 65, 
    SCREEN_CHOOSE_GAME = {
        ARROW_SIZE = 12, 
        PAGE_PADDING = 115, 
        TILE_HEIGHT = 232, 
        ICON_SIZE = 150, 
        NAME_SIZE = 45, 
        NAME_PADDING = 8, 
        TILE_FOOTER_SIZE = 35, 
        FOOTER_SIDE_PADDING = 4, 
        GUIDELINE_LABEL_PADDING = 4, 
        FRAME_BUTTON_SIZE = 32, 
        CELL_PADDING_X = 30, 
        CELL_PADDING_Y = 40
    }, 
    isDarkerTheme = v10, 
    [l_ComponentSymbols_0.Image] = v12
};
local v14 = {
    [l_StyleKey_0.RadioButtonImage] = "rbxasset://textures/StudioSharedUI/radio_selected_enabled_dark.png", 
    [l_StyleKey_0.InformationImage] = "rbxasset://studio_svg_textures/Shared/Alerts/Dark/Large/Information.png"
};
local v15 = {
    [l_StyleKey_0.RadioButtonImage] = "rbxasset://textures/ui/LuaApp/icons/ic-blue-dot.png", 
    [l_StyleKey_0.InformationImage] = "rbxasset://studio_svg_textures/Shared/Alerts/Light/Large/Information.png"
};
return function(v16) --[[ Line: 258 ]]
    -- upvalues: l_StudioTheme_0 (copy), v14 (copy), v15 (copy), v13 (copy)
    local _ = nil;
    return ((if v16 then l_StudioTheme_0.mock(v14, v15) else l_StudioTheme_0.new(v14, v15)):extend(v13));
end;