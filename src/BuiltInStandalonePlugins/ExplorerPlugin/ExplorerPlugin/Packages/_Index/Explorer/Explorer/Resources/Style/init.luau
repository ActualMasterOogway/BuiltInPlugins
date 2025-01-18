local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.Framework);
local v2 = require(l_script_FirstAncestor_0.Util.ImageUrl);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagLuaExplorerUseRDLColors);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return {
    Base = v1.Styling.createStyleSheet("Explorer", {
        l_createStyleRule_0(".Explorer-BG-Surface0", {
            BackgroundColor3 = "$RDLSemanticColorSurface0", 
            BackgroundTransparency = 0
        }), 
        l_createStyleRule_0(".Explorer-BG-Surface100", {
            BackgroundColor3 = v3() and "$RDLSemanticColorSurface100" or "$LegacyMainBackground", 
            BackgroundTransparency = 0
        }), 
        l_createStyleRule_0(".Explorer-BG-Shift300", {
            BackgroundColor3 = "$RDLSemanticColorShift300", 
            BackgroundTransparency = "$RDLSemanticColorShift300Transparency"
        }), 
        l_createStyleRule_0(".Explorer-BG-Input", {
            BackgroundColor3 = "$RDLSemanticColorComponentInputFill", 
            BackgroundTransparency = "$RDLSemanticColorComponentInputFillTransparency"
        }), 
        l_createStyleRule_0(".Explorer-Button", {
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            Text = ""
        }), 
        l_createStyleRule_0(".Explorer-GrowX", {
            Size = UDim2.fromScale(0, 1)
        }, {
            l_createStyleRule_0("::UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Grow
            })
        }), 
        l_createStyleRule_0(".Explorer-FillX", {
            Size = UDim2.fromScale(0, 1)
        }, {
            l_createStyleRule_0("::UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            })
        }), 
        l_createStyleRule_0(".Explorer-SidePadS ::UIPadding", {
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5)
        }), 
        l_createStyleRule_0(".Explorer-Content-Muted", {
            ImageColor3 = "$RDLSemanticColorContentMuted", 
            TextColor3 = "$RDLSemanticColorContentMuted"
        }), 
        l_createStyleRule_0(".Explorer-Content-Standard", {
            ImageColor3 = "$RDLSemanticColorContentStandard"
        }), 
        l_createStyleRule_0(".Explorer-Content-Surface-Outline", {
            ImageColor3 = "$RDLSemanticColorSurfaceOutline", 
            ImageTransparency = "$RDLSemanticColorSurfaceOutlineTransparency"
        }), 
        l_createStyleRule_0(".Explorer-Text-Size-14", {
            TextSize = 17.598
        }), 
        l_createStyleRule_0(".Explorer-View", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }), 
        l_createStyleRule_0(".Explorer-ScrollingFrame", {
            BottomImage = v2.standard("scrollBottom"), 
            MidImage = v2.standard("scrollMid"), 
            TopImage = v2.standard("scrollTop")
        }), 
        l_createStyleRule_0(".Explorer-SessionView-ScrollingFrame", {
            ScrollBarImageColor3 = "$RDLSemanticColorActionSecondary", 
            ScrollBarImageTransparency = "$RDLSemanticColorActionSecondaryTransparency"
        }), 
        l_createStyleRule_0(".Explorer-Square ::UIAspectRatioConstraint", {
            AspectRatio = 1
        }), 
        l_createStyleRule_0(".Explorer-Icon", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(16, 16)
        }), 
        l_createStyleRule_0(">> .Explorer-StandardText", {
            Font = Enum.Font.SourceSans, 
            TextColor3 = "$RDLSemanticColorContentStandard", 
            TextSize = 17.598
        }), 
        l_createStyleRule_0("TextLabel", {
            Font = Enum.Font.SourceSans
        })
    }, {}), 
    Dark = v1.Styling.createStyleSheet("ExplorerDark", {}, {
        LegacyMainBackground = Color3.fromHex("#2E2E2E"), 
        RDLSemanticColorActionPrimaryBrandFill = Color3.fromHex("#3C64FA"), 
        RDLSemanticColorActionSecondary = Color3.fromHex("#BBC2D1"), 
        RDLSemanticColorActionSecondaryTransparency = 0.88, 
        RDLSemanticColorComponentInputFill = Color3.fromHex("#BBC2D1"), 
        RDLSemanticColorComponentInputFillTransparency = 0.88, 
        RDLSemanticColorContentMuted = Color3.fromHex("#BBBCBE"), 
        RDLSemanticColorContentStandard = Color3.fromHex("#F9F9F9"), 
        RDLSemanticColorShift300 = Color3.fromHex("#D0D9FB"), 
        RDLSemanticColorShift300Transparency = 0.88, 
        RDLSemanticColorStatesHover = Color3.fromHex("#BBC2D1"), 
        RDLSemanticColorStatesHoverTransparency = 0.92, 
        RDLSemanticColorSurface0 = Color3.fromHex("#111216"), 
        RDLSemanticColorSurface100 = Color3.fromHex("#1F2024"), 
        RDLSemanticColorSurfaceOutline = Color3.fromHex("#FFFFFF"), 
        RDLSemanticColorSurfaceOutlineTransparency = 0.88
    }), 
    Light = v1.Styling.createStyleSheet("ExplorerLight", {}, {
        LegacyMainBackground = Color3.fromHex("#FFFFFF"), 
        RDLSemanticColorActionPrimaryBrandFill = Color3.fromHex("#3C64FA"), 
        RDLSemanticColorActionSecondary = Color3.fromHex("#333B4C"), 
        RDLSemanticColorActionSecondaryTransparency = 0.92, 
        RDLSemanticColorComponentInputFill = Color3.fromHex("#333B4C"), 
        RDLSemanticColorComponentInputFillTransparency = 0.92, 
        RDLSemanticColorContentMuted = Color3.fromHex("#696A6D"), 
        RDLSemanticColorContentStandard = Color3.fromHex("#111216"), 
        RDLSemanticColorShift300 = Color3.fromHex("#1B254B"), 
        RDLSemanticColorShift300Transparency = 0.88, 
        RDLSemanticColorStatesHover = Color3.fromHex("#333B4C"), 
        RDLSemanticColorStatesHoverTransparency = 0.92, 
        RDLSemanticColorSurface0 = Color3.fromHex("#F2F2F3"), 
        RDLSemanticColorSurface100 = Color3.fromHex("#FFFFFF"), 
        RDLSemanticColorSurfaceOutline = Color3.fromHex("#000000"), 
        RDLSemanticColorSurfaceOutlineTransparency = 0.88
    })
};