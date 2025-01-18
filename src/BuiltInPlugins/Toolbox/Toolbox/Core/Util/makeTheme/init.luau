local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v2 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAddRecentSearchesToAutoComplete);
local v3 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v4 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxPillsForCreators);
local v5 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v6 = require(l_script_FirstAncestor_0.Core.Util.Images);
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v8 = require(l_Packages_0.Framework);
local v9 = require(l_Packages_0.Cryo);
local v10 = require(l_Packages_0.Dash);
local v11 = require(l_Util_0.Colors);
local v12 = require(l_Util_0.isCli);
local l_DarkTheme_0 = v8.Style.Themes.DarkTheme;
local l_getRawComponentStyle_0 = v8.Style.getRawComponentStyle;
local l_LightTheme_0 = v8.Style.Themes.LightTheme;
local l_StudioTheme_0 = v8.Style.Themes.StudioTheme;
local l_Colors_0 = v8.Style.Colors;
local l_StyleKey_0 = v8.Style.StyleKey;
local l_ComponentSymbols_0 = v8.Style.ComponentSymbols;
local l_StyleModifier_0 = v8.Util.StyleModifier;
local l_Image_0 = v8.UI.Image;
local function v30(v22, v23, v24, v25, v26, v27) --[[ Line: 32 ]] --[[ Name: buttonStyle ]]
    -- upvalues: l_StyleKey_0 (copy), l_Image_0 (copy), l_StyleModifier_0 (copy), v9 (copy)
    local v28 = v27 or l_StyleKey_0.DialogMainButton;
    local v29 = {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v26 or UDim2.new(0.5, 0, 0.5, 0), 
        Color = v24 or Color3.fromRGB(184, 184, 184), 
        Image = v22, 
        Size = v25 or UDim2.new(0.6, 0, 0.6, 0), 
        ScaleType = Enum.ScaleType.Fit
    };
    return {
        Foreground = l_Image_0, 
        ForegroundStyle = v29, 
        [l_StyleModifier_0.Hover] = {
            ForegroundStyle = v9.Dictionary.join(v29, {
                Image = v23, 
                Color = v28
            })
        }
    };
end;
local v31 = if v2() then v8.Util.StyleModifier else nil;
return function(v32, v33) --[[ Line: 67 ]]
    -- upvalues: l_StudioTheme_0 (copy), v9 (copy), l_DarkTheme_0 (copy), l_StyleKey_0 (copy), l_Colors_0 (copy), v4 (copy), v6 (copy), l_LightTheme_0 (copy), v11 (copy), v12 (copy), v3 (copy), v5 (copy), l_ComponentSymbols_0 (copy), v10 (copy), l_getRawComponentStyle_0 (copy), v30 (copy), v2 (copy), v31 (copy)
    v33 = v33 or l_StudioTheme_0;
    local v34 = nil;
    local v35 = v9.Dictionary.join(l_DarkTheme_0, {
        [l_StyleKey_0.Toolbox_PublishAssetBackground] = l_Colors_0.Slate, 
        [l_StyleKey_0.Toolbox_AssetOutlineBackground] = Color3.fromHex("#3B3B3B"), 
        [l_StyleKey_0.Toolbox_AssetOutlineBoarderColor] = Color3.fromHex("#121212"), 
        [l_StyleKey_0.Toolbox_AssetOutlineTransparency] = 0, 
        [l_StyleKey_0.Toolbox_AssetOutlineVerifiedBackground] = Color3.fromRGB(12, 43, 89), 
        [l_StyleKey_0.Toolbox_AssetDropdownSize] = 8, 
        [l_StyleKey_0.Toolbox_AssetBorderSize] = 0, 
        [l_StyleKey_0.Toolbox_AssetBackgroundColor] = Color3.fromRGB(41, 41, 41), 
        [l_StyleKey_0.Toolbox_AssetBackgroundImage] = "", 
        [l_StyleKey_0.Toolbox_AssetNameColor] = Color3.fromRGB(60, 180, 255), 
        [l_StyleKey_0.Toolbox_AssetIconColor] = Color3.fromRGB(178, 178, 178), 
        [l_StyleKey_0.Toolbox_AssetWarningIcon] = Color3.fromHex("#F8A544"), 
        [l_StyleKey_0.Toolbox_CreatorLabelTextColor] = if v4() then Color3.fromHex("#FAFAFA") else nil, 
        [l_StyleKey_0.Toolbox_CreatorLabelThumbnailBackgroundColor] = if v4() then Color3.fromHex("#D9D9D9") else nil, 
        [l_StyleKey_0.Toolbox_CreatorPillBackgroundColor] = if v4() then Color3.fromHex("#3B3B3B") else nil, 
        [l_StyleKey_0.Toolbox_DialogErrorIcon] = "rbxasset://studio_svg_textures/Lua/Toolbox/Dark/Large/DialogError.png", 
        [l_StyleKey_0.Toolbox_ItemRowBackgroundColorEven] = Color3.fromHex("#222222"), 
        [l_StyleKey_0.Toolbox_ItemRowBackgroundColorOdd] = Color3.fromHex("#2C2C2C"), 
        [l_StyleKey_0.Toolbox_ItemRowBorderColor] = Color3.fromHex("#024897"), 
        [l_StyleKey_0.Toolbox_ItemRowHeaderTextColor] = Color3.fromHex("#989898"), 
        [l_StyleKey_0.Toolbox_ItemRowTitleTextColor] = Color3.fromHex("#52ADF4"), 
        [l_StyleKey_0.Toolbox_ItemRowTextColor] = l_Colors_0.White, 
        [l_StyleKey_0.Toolbox_AudioPlayerBackgroundColor] = Color3.fromHex("#171717"), 
        [l_StyleKey_0.Toolbox_AudioPlayerProgressBarColor] = Color3.fromHex("#0077D6"), 
        [l_StyleKey_0.Toolbox_AudioPlayerIndicatorColor] = Color3.fromHex("#555555"), 
        [l_StyleKey_0.Toolbox_AudioPlayerIndicatorBorderColor] = Color3.fromHex("#555555"), 
        [l_StyleKey_0.Toolbox_AudioTabSelectedTextColor] = l_Colors_0.White, 
        [l_StyleKey_0.Toolbox_DeleteIconColor] = Color3.fromRGB(136, 136, 136), 
        [l_StyleKey_0.Toolbox_DropdownItemSelectedColor] = l_Colors_0.Blue_Dark, 
        [l_StyleKey_0.Toolbox_DropdownIconColor] = l_Colors_0.White, 
        [l_StyleKey_0.Toolbox_FontTileBackgroundColor] = Color3.fromHex("#292929"), 
        [l_StyleKey_0.Toolbox_FontTileHoveredBackgroundColor] = Color3.fromHex("#3B3B3B"), 
        [l_StyleKey_0.Toolbox_FontTileTextFillColor] = Color3.fromHex("#FFFFFF"), 
        [l_StyleKey_0.Toolbox_HorizontalLineColor] = Color3.fromRGB(34, 34, 34), 
        [l_StyleKey_0.Toolbox_NavigationLinkTextColor] = l_Colors_0.White, 
        [l_StyleKey_0.Toolbox_NavigationLinkTextColorHover] = Color3.fromHex("#AAAAAA"), 
        [l_StyleKey_0.Toolbox_PackageBackgroundColor] = l_Colors_0.Black, 
        [l_StyleKey_0.Toolbox_PackageBackgroundTransparency] = 0.5, 
        [l_StyleKey_0.Toolbox_PackageImage] = v6.PACKAGE_DARK, 
        [l_StyleKey_0.ScrollingFrameBackgroundColor] = Color3.fromRGB(41, 41, 41), 
        [l_StyleKey_0.ScrollingFrameImageColor] = Color3.fromRGB(85, 85, 85), 
        [l_StyleKey_0.Toolbox_SearchTagBackgroundColor] = Color3.fromRGB(56, 56, 56), 
        [l_StyleKey_0.Toolbox_SearchPillTextColor] = Color3.fromHex("#FAFAFA"), 
        [l_StyleKey_0.Toolbox_SearchPillBackgroundColor] = Color3.fromHex("#3B3B3B"), 
        [l_StyleKey_0.Toolbox_SearchPillBackgroundColorHovered] = Color3.fromHex("#565656"), 
        [l_StyleKey_0.Toolbox_TabTopBorderColor] = l_Colors_0.Blue, 
        [l_StyleKey_0.Toolbox_TabSelectedColor] = l_Colors_0.White, 
        [l_StyleKey_0.Toolbox_IconTileGradientColor] = l_Colors_0.Black, 
        [l_StyleKey_0.Toolbox_HomeviewBackgroundColor] = l_Colors_0.Slate, 
        [l_StyleKey_0.Toolbox_SearchOptionButtonHover] = l_Colors_0.White, 
        [l_StyleKey_0.Toolbox_RateTextColor] = Color3.fromHex("#BDBEBE"), 
        [l_StyleKey_0.Toolbox_VoteCountColor] = Color3.fromHex("#AAAAAA"), 
        [l_StyleKey_0.Toolbox_LowConfidencePercentageColor] = Color3.fromHex("#CCCCCC"), 
        [l_StyleKey_0.Toolbox_VotingButtonsBackgroundBoxColor] = Color3.fromHex("#FFFFFF"), 
        [l_StyleKey_0.Toolbox_VotingButtonImage] = v6.THUMB_UP_WHITE, 
        [l_StyleKey_0.Toolbox_SearchIconColor] = Color3.fromRGB(225, 225, 225), 
        [l_StyleKey_0.Toolbox_ClearButtonColor] = l_StyleKey_0.SecondaryMain.Dark, 
        [l_StyleKey_0.AssetConfig_DividerHorizontalLineColor] = l_Colors_0.Carbon, 
        [l_StyleKey_0.AssetConfig_PreviewSelectedColor] = l_Colors_0.White, 
        [l_StyleKey_0.AssetConfig_SidetabSelectedBarColor] = Color3.fromRGB(11, 90, 175), 
        [l_StyleKey_0.AssetConfig_SidetabSelectedBarTransparency] = 0, 
        [l_StyleKey_0.AssetConfig_SidetabSelectedBarZIndex] = -1, 
        [l_StyleKey_0.AssetConfig_SidetabSelectedIndicatorZindex] = 1, 
        [l_StyleKey_0.AssetConfig_UploadResultButtonColor] = Color3.fromRGB(136, 136, 136), 
        [l_StyleKey_0.AssetConfig_SubjectThumbnailDefaultImageColor] = Color3.fromRGB(102, 102, 102), 
        [l_StyleKey_0.AssetConfig_DistributionQuotaTextColor] = l_Colors_0.White
    });
    local v36 = v9.Dictionary.join(l_LightTheme_0, {
        [l_StyleKey_0.Toolbox_PublishAssetBackground] = l_Colors_0.Slate, 
        [l_StyleKey_0.Toolbox_AssetOutlineBackground] = l_Colors_0.White, 
        [l_StyleKey_0.Toolbox_AssetOutlineBoarderColor] = Color3.fromHex("#989898"), 
        [l_StyleKey_0.Toolbox_AssetOutlineTransparency] = 0.08, 
        [l_StyleKey_0.Toolbox_AssetOutlineVerifiedBackground] = Color3.fromRGB(229, 243, 255), 
        [l_StyleKey_0.Toolbox_AssetDropdownSize] = 0, 
        [l_StyleKey_0.Toolbox_AssetBorderSize] = 0, 
        [l_StyleKey_0.Toolbox_AssetBackgroundColor] = Color3.fromRGB(225, 225, 225), 
        [l_StyleKey_0.Toolbox_AssetBackgroundImage] = v6.NO_BACKGROUND_ICON, 
        [l_StyleKey_0.Toolbox_AssetNameColor] = Color3.fromHex("#0B5AAF"), 
        [l_StyleKey_0.Toolbox_AssetIconColor] = Color3.fromRGB(170, 170, 170), 
        [l_StyleKey_0.Toolbox_AssetWarningIcon] = Color3.fromHex("#BC6600"), 
        [l_StyleKey_0.Toolbox_AudioPlayerBackgroundColor] = Color3.fromHex("#E1E1E1"), 
        [l_StyleKey_0.Toolbox_AudioPlayerProgressBarColor] = Color3.fromHex("#0077D6"), 
        [l_StyleKey_0.Toolbox_AudioPlayerIndicatorColor] = Color3.fromHex("#CBCBCB"), 
        [l_StyleKey_0.Toolbox_AudioPlayerIndicatorBorderColor] = Color3.fromHex("#222222"), 
        [l_StyleKey_0.Toolbox_DialogErrorIcon] = "rbxasset://studio_svg_textures/Lua/Toolbox/Light/Large/DialogError.png", 
        [l_StyleKey_0.Toolbox_CreatorLabelTextColor] = if v4() then Color3.fromHex("#191919") else nil, 
        [l_StyleKey_0.Toolbox_CreatorLabelThumbnailBackgroundColor] = if v4() then Color3.fromHex("#CBCBCB") else nil, 
        [l_StyleKey_0.Toolbox_CreatorPillBackgroundColor] = if v4() then Color3.fromHex("#E1E1E1") else nil, 
        [l_StyleKey_0.Toolbox_ItemRowBackgroundColorEven] = Color3.fromHex("#EDEDED"), 
        [l_StyleKey_0.Toolbox_ItemRowBackgroundColorOdd] = Color3.fromHex("#FAFAFA"), 
        [l_StyleKey_0.Toolbox_ItemRowBorderColor] = Color3.fromHex("#3DB3FF"), 
        [l_StyleKey_0.Toolbox_ItemRowHeaderTextColor] = Color3.fromHex("#3B3B3B"), 
        [l_StyleKey_0.Toolbox_ItemRowTitleTextColor] = Color3.fromHex("#0055AC"), 
        [l_StyleKey_0.Toolbox_ItemRowTextColor] = Color3.fromHex("#171717"), 
        [l_StyleKey_0.Toolbox_AudioTabSelectedTextColor] = Color3.fromHex("#FAFAFA"), 
        [l_StyleKey_0.Toolbox_DeleteIconColor] = Color3.fromRGB(184, 184, 184), 
        [l_StyleKey_0.Toolbox_DropdownItemSelectedColor] = l_Colors_0.Blue_Light, 
        [l_StyleKey_0.Toolbox_DropdownIconColor] = Color3.fromRGB(25, 25, 25), 
        [l_StyleKey_0.Toolbox_FontTileBackgroundColor] = Color3.fromHex("#FFFFFF"), 
        [l_StyleKey_0.Toolbox_FontTileHoveredBackgroundColor] = Color3.fromHex("#E3F0FB"), 
        [l_StyleKey_0.Toolbox_FontTileTextFillColor] = Color3.fromHex("#393B3D"), 
        [l_StyleKey_0.Toolbox_HorizontalLineColor] = Color3.fromRGB(227, 227, 227), 
        [l_StyleKey_0.Toolbox_NavigationLinkTextColor] = Color3.fromHex("#121212"), 
        [l_StyleKey_0.Toolbox_NavigationLinkTextColorHover] = Color3.fromHex("#666666"), 
        [l_StyleKey_0.Toolbox_PackageBackgroundColor] = l_Colors_0.White, 
        [l_StyleKey_0.Toolbox_PackageBackgroundTransparency] = 0.25, 
        [l_StyleKey_0.Toolbox_PackageImage] = v6.PACKAGE_LIGHT, 
        [l_StyleKey_0.ScrollingFrameBackgroundColor] = Color3.fromRGB(245, 245, 245), 
        [l_StyleKey_0.ScrollingFrameImageColor] = Color3.fromRGB(245, 245, 245), 
        [l_StyleKey_0.Toolbox_SearchTagBackgroundColor] = l_Colors_0.Gray_Lighter, 
        [l_StyleKey_0.Toolbox_SearchPillTextColor] = Color3.fromHex("#191919"), 
        [l_StyleKey_0.Toolbox_SearchPillBackgroundColor] = Color3.fromHex("#E1E1E1"), 
        [l_StyleKey_0.Toolbox_SearchPillBackgroundColorHovered] = Color3.fromHex("#CBCBCB"), 
        [l_StyleKey_0.Toolbox_TabTopBorderColor] = Color3.fromRGB(182, 182, 182), 
        [l_StyleKey_0.Toolbox_TabSelectedColor] = l_Colors_0.Blue, 
        [l_StyleKey_0.Toolbox_IconTileGradientColor] = l_Colors_0.Gray_Light, 
        [l_StyleKey_0.Toolbox_HomeviewBackgroundColor] = l_Colors_0.White, 
        [l_StyleKey_0.Toolbox_SearchOptionButtonHover] = l_Colors_0.Black, 
        [l_StyleKey_0.Toolbox_RateTextColor] = Color3.fromHex("#3B3B3B"), 
        [l_StyleKey_0.Toolbox_VoteCountColor] = Color3.fromHex("#666666"), 
        [l_StyleKey_0.Toolbox_LowConfidencePercentageColor] = Color3.fromHex("#666666"), 
        [l_StyleKey_0.Toolbox_VotingButtonsBackgroundBoxColor] = Color3.fromHex("#000000"), 
        [l_StyleKey_0.Toolbox_VotingButtonImage] = v6.THUMB_UP_DARK_GRAY, 
        [l_StyleKey_0.Toolbox_SearchIconColor] = Color3.fromRGB(94, 94, 94), 
        [l_StyleKey_0.Toolbox_ClearButtonColor] = l_StyleKey_0.SecondaryMain.Light, 
        [l_StyleKey_0.AssetConfig_DividerHorizontalLineColor] = Color3.fromRGB(227, 227, 227), 
        [l_StyleKey_0.AssetConfig_PreviewSelectedColor] = l_Colors_0.Blue, 
        [l_StyleKey_0.AssetConfig_SidetabSelectedBarColor] = v11.GRAY_1, 
        [l_StyleKey_0.AssetConfig_SidetabSelectedBarTransparency] = 0.9, 
        [l_StyleKey_0.AssetConfig_SidetabSelectedBarZIndex] = 0, 
        [l_StyleKey_0.AssetConfig_SidetabSelectedIndicatorZindex] = 0, 
        [l_StyleKey_0.AssetConfig_UploadResultButtonColor] = l_Colors_0.Black, 
        [l_StyleKey_0.AssetConfig_SubjectThumbnailDefaultImageColor] = Color3.fromRGB(151, 151, 151), 
        [l_StyleKey_0.AssetConfig_DistributionQuotaTextColor] = l_Colors_0.Black
    });
    v34 = if v12() then l_StudioTheme_0.mock(v35, v36) else v33.new(v35, v36);
    local l_Toolbox_AssetWarningIcon_0 = l_StyleKey_0.Toolbox_AssetWarningIcon;
    v34:extend({
        backgroundColor = l_StyleKey_0.InputFieldBackground, 
        progressBarColor = v11.BLUE_PRIMARY, 
        horizontalLineColor = l_StyleKey_0.Toolbox_HorizontalLineColor, 
        link = l_StyleKey_0.LinkText, 
        redText = Color3.fromRGB(255, 68, 68), 
        spacingUnit = 10, 
        announcementDialog = {
            backgroundColor = l_StyleKey_0.MainBackground, 
            closeIconColor = l_Colors_0.White, 
            descriptionColor = l_StyleKey_0.TextPrimary, 
            headerTextColor = l_StyleKey_0.BrightText, 
            overlayColor = l_Colors_0.Black, 
            overlayTransparency = 0.4
        }, 
        asset = {
            assetName = {
                textColor = l_StyleKey_0.Toolbox_AssetNameColor
            }, 
            background = {
                color = l_StyleKey_0.Toolbox_AssetBackgroundColor, 
                borderSize = l_StyleKey_0.Toolbox_AssetBorderSize, 
                image = l_StyleKey_0.Toolbox_AssetBackgroundImage
            }, 
            dropShadowSize = l_StyleKey_0.Toolbox_AssetDropdownSize, 
            icon = {
                borderColor = l_StyleKey_0.ItemHovered, 
                buttonColor = l_StyleKey_0.Toolbox_AssetIconColor, 
                warningColor = l_StyleKey_0.Toolbox_AssetWarningIcon
            }, 
            outline = {
                backgroundColor = l_StyleKey_0.Toolbox_AssetOutlineBackground, 
                verifiedBackgroundColor = l_StyleKey_0.Toolbox_AssetOutlineVerifiedBackground, 
                borderColor = l_StyleKey_0.Toolbox_AssetOutlineBoarderColor, 
                transparency = l_StyleKey_0.Toolbox_AssetOutlineTransparency
            }, 
            textColor = l_StyleKey_0.MainText, 
            strokeThickness = 3, 
            strokeColor = v11.BLUE_PRIMARY, 
            voting = {
                downVotes = Color3.fromRGB(206, 100, 91), 
                upVotes = Color3.fromRGB(82, 168, 70), 
                textColor = l_StyleKey_0.SubText, 
                votedDownThumb = Color3.fromRGB(216, 104, 104), 
                votedUpThumb = Color3.fromRGB(0, 178, 89), 
                voteThumb = Color3.fromRGB(117, 117, 117), 
                rateTextColor = l_StyleKey_0.Toolbox_RateTextColor, 
                voteCountColor = l_StyleKey_0.Toolbox_VoteCountColor, 
                lowConfidencePercentageColor = l_StyleKey_0.Toolbox_LowConfidencePercentageColor, 
                votingButtonsBackgroundBoxColor = l_StyleKey_0.Toolbox_VotingButtonsBackgroundBoxColor, 
                votingButtonImage = l_StyleKey_0.Toolbox_VotingButtonImage
            }, 
            packages = {
                backgroundColor = l_StyleKey_0.Toolbox_PackageBackgroundColor, 
                backgroundTransparency = l_StyleKey_0.Toolbox_PackageBackgroundTransparency, 
                packageImage = l_StyleKey_0.Toolbox_PackageImage
            }
        }, 
        assetConfig = {
            labelTextColor = l_StyleKey_0.DimmedText
        }, 
        audioPlayer = {
            backgroundColor = l_StyleKey_0.Toolbox_AudioPlayerBackgroundColor, 
            progressBarColor = l_StyleKey_0.Toolbox_AudioPlayerProgressBarColor, 
            indicatorColor = l_StyleKey_0.Toolbox_AudioPlayerIndicatorColor, 
            indicatorBorderColor = l_StyleKey_0.Toolbox_AudioPlayerIndicatorBorderColor
        }, 
        audioTabs = {
            backgroundButtonColor = l_StyleKey_0.Toolbox_AudioPlayerBackgroundColor, 
            selectedButtonColor = Color3.fromHex("#0077D6"), 
            selectedTextColor = l_StyleKey_0.Toolbox_AudioTabSelectedTextColor, 
            textColor = l_StyleKey_0.TextSecondary
        }, 
        creatorLabel = if v4() then {
            spacingUnit = 10, 
            textSize = 18, 
            font = Enum.Font.SourceSans, 
            thumbnailBackgroundColor = l_StyleKey_0.Toolbox_CreatorLabelThumbnailBackgroundColor, 
            textColor = l_StyleKey_0.Toolbox_CreatorLabelTextColor
        } else nil, 
        creatorPill = if v4() then {
            spacingUnit = 10, 
            backgroundColor = l_StyleKey_0.Toolbox_CreatorPillBackgroundColor
        } else nil, 
        creatorName = {
            textColor = l_StyleKey_0.SubText
        }, 
        dialog = {
            errorIcon = l_StyleKey_0.Toolbox_DialogErrorIcon
        }, 
        dropdownMenu = {
            dropdownIconColor = l_StyleKey_0.Toolbox_DropdownIconColor, 
            currentSelection = {
                backgroundColor = l_StyleKey_0.Dropdown, 
                backgroundSelectedColor = l_StyleKey_0.CurrentMarker, 
                backgroundDisabledColor = l_StyleKey_0.Border, 
                borderColor = l_StyleKey_0.Border, 
                borderSelectedColor = l_StyleKey_0.CurrentMarker, 
                textColor = l_StyleKey_0.MainText, 
                textSelectedColor = l_StyleKey_0.MainTextSelected
            }, 
            item = {
                backgroundColor = l_StyleKey_0.Item, 
                backgroundSelectedColor = l_StyleKey_0.Toolbox_DropdownItemSelectedColor, 
                selectedBarColor = l_StyleKey_0.CurrentMarker, 
                textColor = l_StyleKey_0.MainText, 
                labelTextColor = l_StyleKey_0.DimmedText
            }, 
            dropdownFrame = {
                borderColor = l_StyleKey_0.Border
            }
        }, 
        fontTile = {
            backgroundColor = l_StyleKey_0.Toolbox_FontTileBackgroundColor, 
            hoveredBackgroundColor = l_StyleKey_0.Toolbox_FontTileHoveredBackgroundColor, 
            textFillColor = l_StyleKey_0.Toolbox_FontTileTextFillColor
        }, 
        footer = {
            backgroundColor = l_StyleKey_0.Titlebar, 
            borderColor = l_StyleKey_0.Border, 
            labelTextColor = l_StyleKey_0.MainText, 
            button = {
                backgroundColor = l_StyleKey_0.Dropdown, 
                backgroundSelectedColor = l_StyleKey_0.CurrentMarker, 
                borderColor = l_StyleKey_0.Border, 
                borderSelectedColor = l_StyleKey_0.CurrentMarker, 
                textColor = l_StyleKey_0.MainText, 
                textSelectedColor = l_StyleKey_0.MainTextSelected
            }
        }, 
        header = {
            backgroundColor = l_StyleKey_0.Titlebar, 
            borderColor = l_StyleKey_0.Border, 
            iconColor = if v3() then v11.GRAY_2 else nil
        }, 
        homeView = {
            backgroundColor = l_StyleKey_0.Toolbox_HomeviewBackgroundColor
        }, 
        iconTile = {
            font = Enum.Font.SourceSansBold, 
            gradientColor = l_StyleKey_0.Toolbox_IconTileGradientColor, 
            overlayColor = Color3.fromHex("#000"), 
            overlayTransparency = 0.88, 
            padding = 8, 
            spacing = 16, 
            textColor = Color3.fromHex("#E1E1E1"), 
            textColorHovered = nil, 
            textSize = 16
        }, 
        infoBanner = {
            backgroundColor = l_StyleKey_0.Titlebar, 
            textColor = l_StyleKey_0.SubText
        }, 
        itemRow = {
            backgroundColorEven = l_StyleKey_0.Toolbox_ItemRowBackgroundColorEven, 
            backgroundColorOdd = l_StyleKey_0.Toolbox_ItemRowBackgroundColorOdd, 
            borderColor = l_StyleKey_0.Toolbox_ItemRowBorderColor, 
            headerTextColor = l_StyleKey_0.Toolbox_ItemRowHeaderTextColor, 
            titleTextColor = l_StyleKey_0.Toolbox_ItemRowTitleTextColor, 
            primaryIconColor = Color3.fromHex("#DF9251"), 
            textColor = l_StyleKey_0.SubText, 
            textSize = 16, 
            playButtonColor = v11.BLACK, 
            pauseButtonColor = v11.BLUE_PRIMARY, 
            insertButtonColor = Color3.fromHex("#0077D6"), 
            insertButtonTextColor = v11.WHITE
        }, 
        linkButton = {
            textColor = Color3.fromRGB(0, 162, 255)
        }, 
        messageBox = {
            backgroundColor = l_StyleKey_0.MainBackground, 
            textColor = l_StyleKey_0.MainText, 
            informativeTextColor = l_StyleKey_0.SubText, 
            button = {
                textColor = l_StyleKey_0.MainText, 
                textSelectedColor = l_StyleKey_0.MainTextSelected, 
                backgroundColor = l_StyleKey_0.MainBackground, 
                backgroundSelectedColor = l_StyleKey_0.CurrentMarker, 
                borderColor = l_StyleKey_0.Border, 
                borderSelectedColor = l_StyleKey_0.CurrentMarker
            }
        }, 
        purchaseDialog = {
            promptText = l_StyleKey_0.MainText, 
            balanceText = l_StyleKey_0.DimmedText
        }, 
        publishAsset = {
            backgroundColor = l_StyleKey_0.Toolbox_PublishAssetBackground, 
            distributionQuotaTextColor = l_StyleKey_0.AssetConfig_DistributionQuotaTextColor, 
            titleTextColor = l_StyleKey_0.SubText, 
            textColor = l_StyleKey_0.MainText, 
            quotaTextColor = l_StyleKey_0.BrightText, 
            verifyTextColor = l_StyleKey_0.TextSecondary, 
            warningIconColor = Color3.fromHex("#FFAA21"), 
            additionalImagesThumbnailSize = UDim2.new(0, 185, 0, 104)
        }, 
        searchBar = {
            backgroundColor = l_StyleKey_0.Dropdown, 
            liveBackgroundColor = l_StyleKey_0.InputFieldBackground, 
            borderColor = l_StyleKey_0.Border, 
            borderHoveredColor = l_StyleKey_0.CurrentMarker, 
            borderSelectedColor = v11.BLUE_PRIMARY, 
            textColor = l_StyleKey_0.MainText, 
            placeholderTextColor = l_StyleKey_0.DimmedText, 
            divideLineColor = l_StyleKey_0.Border, 
            searchButton = {
                imageColor = Color3.fromRGB(184, 184, 184), 
                imageSelectedColor = Color3.fromRGB(0, 162, 255)
            }, 
            clearButton = {
                imageColor = Color3.fromRGB(184, 184, 184), 
                imageSelectedColor = Color3.fromRGB(0, 162, 255)
            }
        }, 
        scrollingFrame = {
            scrollbarBackgroundColor = l_StyleKey_0.ScrollingFrameBackgroundColor, 
            scrollbarImageColor = l_StyleKey_0.ScrollingFrameImageColor
        }, 
        suggestionsComponent = {
            labelTextColor = l_StyleKey_0.MainText, 
            textColor = l_StyleKey_0.SubText, 
            textHoveredColor = l_StyleKey_0.LinkText, 
            underlineColor = l_StyleKey_0.LinkText
        }, 
        searchOptions = {
            background = l_StyleKey_0.MainBackground, 
            border = l_StyleKey_0.Border, 
            headerTextColor = l_StyleKey_0.MainText, 
            imageColor = v11.GRAY_2, 
            imageHoveredColor = l_StyleKey_0.Toolbox_SearchOptionButtonHover, 
            imageSelectedColor = v11.BLUE_PRIMARY, 
            warningIconColor = l_Toolbox_AssetWarningIcon_0, 
            audioSearch = {
                textColor = l_StyleKey_0.MainText
            }, 
            timeTextBox = {
                borderColor = l_StyleKey_0.Border, 
                backgroundColor = l_StyleKey_0.InputFieldBackground, 
                selectedBorderColor = v11.BLUE_PRIMARY, 
                textColor = l_StyleKey_0.MainText, 
                placeholderTextColor = l_StyleKey_0.DimmedText
            }, 
            applyButton = if not v5() then {
                textColor = v11.WHITE, 
                backgroundColor = v11.BLUE_PRIMARY, 
                borderColor = l_StyleKey_0.MainBackground
            } else nil, 
            cancelButton = if not v5() then {
                textColor = l_StyleKey_0.MainText, 
                backgroundColor = l_StyleKey_0.Button, 
                borderColor = l_StyleKey_0.Border
            } else nil
        }, 
        searchList = {
            buttonSpacing = 3
        }, 
        searchPill = {
            backgroundColor = l_StyleKey_0.Toolbox_SearchPillBackgroundColor, 
            backgroundColorHovered = l_StyleKey_0.Toolbox_SearchPillBackgroundColorHovered, 
            font = Enum.Font.SourceSans, 
            padding = {
                top = 4, 
                bottom = 6, 
                left = 10, 
                right = 10
            }, 
            textSize = 18, 
            textColor = l_StyleKey_0.Toolbox_SearchPillTextColor
        }, 
        searchTag = {
            backgroundColor = l_StyleKey_0.Toolbox_SearchTagBackgroundColor, 
            borderColor = l_StyleKey_0.Border, 
            textColor = l_StyleKey_0.BrightText, 
            clearAllText = l_StyleKey_0.LinkText
        }, 
        sectionHeader = {
            textColor = l_StyleKey_0.Toolbox_NavigationLinkTextColor, 
            font = Enum.Font.SourceSansBold, 
            textSize = 18
        }, 
        sectionHeaderNavLink = {
            textColor = l_StyleKey_0.Toolbox_NavigationLinkTextColor, 
            hoverTextColor = l_StyleKey_0.Toolbox_NavigationLinkTextColorHover, 
            font = Enum.Font.SourceSans, 
            textSize = 16
        }, 
        tabSet = {
            backgroundColor = l_StyleKey_0.MainBackground, 
            borderColor = l_StyleKey_0.Border, 
            topBorderColor = l_StyleKey_0.Toolbox_TabTopBorderColor, 
            tabBackground = l_StyleKey_0.Titlebar, 
            disabledColor = l_StyleKey_0.Border, 
            contentColor = l_StyleKey_0.TitlebarText, 
            selectedColor = l_StyleKey_0.Toolbox_TabSelectedColor
        }, 
        toggle = {
            buttonHeight = 24, 
            buttonWidth = 40, 
            verticalTextSpacing = 4, 
            verticalListPadding = 16
        }, 
        [l_ComponentSymbols_0.LinkText] = v10.join(l_getRawComponentStyle_0("LinkText"), {
            ["&ToolboxItemRowLink"] = {
                TextSize = 16, 
                TextColor = l_StyleKey_0.SubText, 
                ShowUnderline = true
            }, 
            ["&ToolboxItemRowInnerLink"] = {
                TextColor = l_StyleKey_0.Toolbox_ItemRowTextColor, 
                ShowUnderline = true
            }, 
            ["&ToolboxItemRowTitle"] = {
                TextSize = 16, 
                TextColor = l_StyleKey_0.Toolbox_ItemRowTitleTextColor, 
                ShowUnderline = true
            }
        }), 
        [l_ComponentSymbols_0.SearchBar] = v9.Dictionary.join(l_getRawComponentStyle_0("SearchBar"), {
            ["&ToolboxSearchBar"] = {
                Padding = {
                    Top = -1, 
                    Left = 0, 
                    Bottom = 0, 
                    Right = 0
                }, 
                SearchIcon = "rbxasset://textures/StudioSharedUI/search-v2.png", 
                IconColor = l_StyleKey_0.Toolbox_SearchIconColor, 
                IconWidth = 16, 
                IconOffset = 8, 
                Buttons = {
                    Clear = v30("rbxasset://textures/StudioSharedUI/clear.png", "rbxasset://textures/StudioSharedUI/clear-hover.png", l_StyleKey_0.SecondaryMain, UDim2.fromOffset(11, 11), nil, l_StyleKey_0.SecondaryContrast), 
                    Filter = v30("rbxasset://textures/StudioSharedUI/Filter.png", nil, l_StyleKey_0.Toolbox_SearchIconColor, UDim2.fromOffset(16, 16)), 
                    FilterHighlighted = v30("rbxasset://textures/StudioSharedUI/Filter.png", nil, Color3.fromRGB(0, 162, 255), UDim2.fromOffset(16, 16))
                }
            }
        }), 
        recentSearchesCloseButton = if v2() then {
            backgroundColor = l_StyleKey_0.SecondaryMain, 
            hoverColor = l_StyleKey_0.SecondaryContrast
        } else nil, 
        wideIconButtonPadding = {
            Top = 8, 
            Bottom = 0, 
            Right = 8, 
            Left = 8
        }, 
        [l_ComponentSymbols_0.Button] = if v2() then v9.Dictionary.join(l_getRawComponentStyle_0("Button"), {
            ["&ToolboxRecentSearchesButton"] = {
                BackgroundStyle = {
                    Color = l_StyleKey_0.ForegroundMain
                }, 
                [v31.Hover] = {
                    BackgroundStyle = {
                        Color = l_StyleKey_0.ActionHover
                    }
                }
            }
        }) else nil, 
        [l_ComponentSymbols_0.TextLabel] = v10.join(l_getRawComponentStyle_0("TextLabel"), {
            ["&ToolboxItemRowText"] = {
                TextColor = l_StyleKey_0.SubText, 
                TextSize = 16
            }, 
            ["&ToolboxItemRowHeader"] = {
                TextColor = l_StyleKey_0.Toolbox_ItemRowHeaderTextColor, 
                TextSize = 14
            }
        }), 
        [l_ComponentSymbols_0.TextLabelWithRobloxLinks] = v10.join(l_getRawComponentStyle_0("TextLabelWithRobloxLinks"), {
            ["&ToolboxItemRowInnerText"] = {
                TextColor = l_StyleKey_0.Toolbox_ItemRowTextColor
            }
        })
    });
    if v32 then
        v34:extend(v32);
    end;
    v34:extend({
        [l_ComponentSymbols_0.DropdownMenu] = v9.Dictionary.join(l_getRawComponentStyle_0("DropdownMenu"), {
            ["&ToolboxSearchBarDropdown"] = {
                Offset = Vector2.new(0, 4)
            }
        })
    });
    return v34;
end;