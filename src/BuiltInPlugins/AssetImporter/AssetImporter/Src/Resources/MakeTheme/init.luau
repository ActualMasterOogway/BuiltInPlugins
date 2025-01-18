local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_Style_0 = v1.Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_BaseTheme_0 = l_Style_0.Themes.BaseTheme;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_UIData_0 = v1.UIData;
local v10 = require(l_UIData_0.Button.style);
local v11 = require(l_UIData_0.ExpandablePane.style);
local v12 = v10["&Round"];
local v13 = v11["&Section"];
local l_Content_0 = v11.Content;
local l_join_0 = v2.join;
local v16 = {
    Icons = {
        SmallLength = 16, 
        LargeLength = 32, 
        ErrorIconSolid = l_StyleKey_0.ErrorIconSolid, 
        SuccessIconSolid = l_StyleKey_0.SuccessIconSolid
    }, 
    ImportQueue = {
        CleanupImage = l_StyleKey_0.CleanupImage, 
        ControlsHeight = 40, 
        DisabledTransparancy = 0.5, 
        ImportButtonWidth = 120, 
        LoadingBarWidth = 8, 
        OpenImage = l_StyleKey_0.OpenImage, 
        Padding = 8, 
        ProgressBarHeight = 50, 
        WindowSize = Vector2.new(395, 320), 
        IconPadding = 2, 
        IconButtonSize = 24
    }, 
    AssetList = {
        Padding = 4, 
        RowHeight = 28, 
        CheckboxWidth = 28, 
        DropdownWidth = 140, 
        StatusWidth = 80
    }, 
    AssetListCell = {
        Padding = {
            PaddingTop = UDim.new(0, 2), 
            PaddingRight = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 2), 
            PaddingLeft = UDim.new(0, 4)
        }, 
        ActionSelectedOverride = l_StyleKey_0.ActionSelectedOverride
    }, 
    PropertySectionHeader = {
        Arrow = {
            Color = l_StyleKey_0.MainText, 
            Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
            ImageRectOffset = Vector2.new(12, 0), 
            ImageRectSize = Vector2.new(12, 12), 
            Size = UDim2.fromOffset(12, 12), 
            [l_StyleModifier_0.Selected] = {
                ImageRectOffset = Vector2.new(24, 0)
            }
        }, 
        Background = l_StyleKey_0.Titlebar, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Padding = {
            Left = 10, 
            Right = 10
        }, 
        Size = UDim2.new(1, 0, 0, 32), 
        Spacing = 6, 
        Text = {
            Font = Enum.Font.SourceSansBold, 
            TextColor = l_StyleKey_0.TitlebarText, 
            TextSize = 18
        }, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, 
    PropertyView = {
        IconSize = 20, 
        Spacing = 4, 
        ScrollBarOffset = 10, 
        Height = 28, 
        EditorHeight = 24, 
        IconSpacing = 10, 
        FilePickerSize = 28
    }, 
    SuggestionDropdown = {
        DropdownHeight = 50, 
        SubtextSize = 14, 
        SubtextColor = l_StyleKey_0.DimmedText, 
        SubtextOffset = 3, 
        DropdownScrollbarSize = 8
    }, 
    TopBar = {
        ButtonSize = UDim2.new(0, 80, 1, 0), 
        Padding = {
            Left = 10, 
            Top = 6, 
            Right = 10, 
            Bottom = 5
        }, 
        Spacing = 6, 
        TemplateDropDown = UDim2.fromOffset(175, 32), 
        MenuImage = l_StyleKey_0.MenuImage, 
        MenuButtonSize = UDim2.fromOffset(16, 16), 
        MenuItemSize = UDim2.new(1, 0, 0, 40)
    }, 
    PresetNamePrompt = {
        CreateMinContentSize = Vector2.new(300, 125), 
        RenameMinContentSize = Vector2.new(300, 100), 
        LabelSize = UDim2.new(0, 75, 0, 32), 
        Padding = 10, 
        TextboxSize = UDim2.fromOffset(200, 32)
    }, 
    PreviewWindow = {
        ResetCameraImage = l_StyleKey_0.ResetCameraImage, 
        ShowWorkspaceImage = l_StyleKey_0.ShowWorkspaceImage, 
        ShowRigVisualizationImage = l_StyleKey_0.ShowRigVisualizationImage, 
        OptionIconSize = UDim2.new(0, 28, 0, 28), 
        PreviewButtonBar = {
            Size = UDim2.new(0, 28, 1, 0), 
            Position = UDim2.new(1, -38, 0, 10), 
            Spacing = 2
        }, 
        Lighting = {
            Ambient = Color3.fromRGB(170, 185, 200), 
            Color = Color3.fromRGB(242, 236, 227), 
            Direction = Vector3.new(0.5, -1, 0.10000000149011612, 0)
        }
    }, 
    TreeViewToolbar = {
        Padding = {
            Left = 6, 
            Top = 4, 
            Right = 6, 
            Bottom = 3
        }, 
        Spacing = 6
    }, 
    Sizes = {
        IndicatorOffset = 20, 
        IndicatorSize = 100, 
        PreviewRatio = 0.5, 
        StatusMessagePadding = 24, 
        ToolbarHeight = 30, 
        TopBarHeight = 40
    }, 
    UploadWidget = {
        Width = 500, 
        Height = 100, 
        ExpandedWidth = 500, 
        ExpandedHeight = 180, 
        TextLabelSize = UDim2.new(1, -10, 0, 22), 
        BoldFont = Enum.Font.SourceSansBold, 
        TextSize = 24, 
        SubtextSize = 16, 
        TextAlignment = Enum.TextXAlignment.Center, 
        LoadingBarHeight = 12, 
        LoadingBarContainerSize = UDim2.new(0.8, 0, 0, 10), 
        SuccessColor = Color3.fromRGB(2, 183, 87), 
        FailureColor = Color3.fromRGB(255, 85, 85), 
        TopPadding = {
            Left = 10, 
            Top = 20, 
            Right = 10, 
            Bottom = 10
        }, 
        SuccessWidget = {
            TextProps = {
                Font = Enum.Font.SourceSans, 
                TextSize = 16, 
                TextXAlignment = Enum.TextXAlignment.Center
            }
        }, 
        FailureWidget = {
            Padding = {
                Left = 24, 
                Top = 12, 
                Right = 24, 
                Bottom = 6
            }
        }
    }, 
    ErrorWidget = {
        Height = 100, 
        IconSize = 48, 
        IconSpacing = 16, 
        SubtextSize = 18, 
        TextSize = 24, 
        Width = 500, 
        Dropdown = {
            Header = {
                Arrow = {
                    Color = l_StyleKey_0.MainText, 
                    Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
                    ImageRectOffset = Vector2.new(12, 0), 
                    ImageRectSize = Vector2.new(12, 12), 
                    Size = UDim2.fromOffset(12, 12), 
                    [l_StyleModifier_0.Selected] = {
                        ImageRectOffset = Vector2.new(24, 0)
                    }
                }, 
                Text = {
                    Font = Enum.Font.SourceSans, 
                    TextColor = l_StyleKey_0.TitlebarText, 
                    TextSize = 16, 
                    TextXAlignment = Enum.TextXAlignment.Center
                }, 
                Spacing = 6, 
                Size = UDim2.new(1, 0, 0, 16)
            }, 
            Content = {
                Padding = {
                    Top = 6, 
                    Bottom = 6
                }
            }
        }
    }, 
    ParseWidget = {
        Width = 500, 
        Height = 156, 
        TextSize = 24, 
        SubtextSize = 16, 
        TextLabelSize = UDim2.new(1, -10, 0, 22), 
        TextAlignment = Enum.TextXAlignment.Center, 
        SubtextColor = l_StyleKey_0.SubText, 
        LoadingButtonColor = l_StyleKey_0.ButtonText
    }, 
    ErrorIcon = {
        Image = "rbxasset://textures/StudioSharedUI/alert_error@2x.png", 
        Size = UDim2.fromOffset(20, 20)
    }, 
    WarningIcon = {
        Image = "rbxasset://textures/StudioSharedUI/alert_warning@2x.png", 
        Size = UDim2.fromOffset(20, 20)
    }, 
    ErrorStatus = {
        TextColor = Color3.fromRGB(255, 85, 85), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextSize = 10
    }, 
    WarningStatus = {
        TextColor = Color3.fromRGB(255, 170, 33), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextSize = 10
    }, 
    [l_ComponentSymbols_0.ExpandablePane] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.ExpandablePane], {
        ["&ImportTree"] = l_join_0(v13, {
            Content = l_join_0(l_Content_0, {
                Padding = {
                    Left = 4, 
                    Top = 10, 
                    Right = 4, 
                    Bottom = 10
                }
            })
        })
    }), 
    [l_ComponentSymbols_0.LinkText] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.LinkText], {
        ["&Disabled"] = {
            TextColor = l_StyleKey_0.ButtonTextDisabled
        }
    }), 
    [l_ComponentSymbols_0.Button] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.Button], {
        ["&CopyMeshID"] = l_join_0(v12, {
            Size = UDim2.new(0, 180, 0, 32)
        })
    }), 
    [l_ComponentSymbols_0.StyledDialog] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.StyledDialog], {
        ["&ImportDialog"] = {
            ButtonPadding = 12, 
            ContentPadding = 0
        }
    })
};
local v17 = {
    [l_StyleKey_0.RefreshImage] = "rbxasset://textures/GameSettings/refresh_dark_theme.png", 
    [l_StyleKey_0.ResetCameraImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Dark/Large/CameraReset.png", 
    [l_StyleKey_0.ShowRigVisualizationImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Dark/Large/RigVisualization.png", 
    [l_StyleKey_0.ShowWorkspaceImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Dark/Large/WorkspacePreview.png", 
    [l_StyleKey_0.MenuImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Dark/Large/OptionsDots.png", 
    [l_StyleKey_0.OpenImage] = "rbxasset://studio_svg_textures/Lua/FileSync/Dark/Standard/Open.png", 
    [l_StyleKey_0.CleanupImage] = "rbxasset://studio_svg_textures/Shared/InsertableObjects/Dark/Standard/Cleanup.png", 
    [l_StyleKey_0.ErrorIconSolid] = "rbxasset://studio_svg_textures/Shared/Alerts/Dark/Standard/Error.png", 
    [l_StyleKey_0.SuccessIconSolid] = "rbxasset://studio_svg_textures/Shared/Alerts/Dark/Standard/Success.png", 
    [l_StyleKey_0.ActionSelectedOverride] = Color3.fromRGB(60, 60, 60)
};
local v18 = {
    [l_StyleKey_0.RefreshImage] = "rbxasset://textures/GameSettings/refresh_light_theme.png", 
    [l_StyleKey_0.ResetCameraImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Light/Large/CameraReset.png", 
    [l_StyleKey_0.ShowRigVisualizationImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Light/Large/RigVisualization.png", 
    [l_StyleKey_0.ShowWorkspaceImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Light/Large/WorkspacePreview.png", 
    [l_StyleKey_0.MenuImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Light/Large/OptionsDots.png", 
    [l_StyleKey_0.OpenImage] = "rbxasset://studio_svg_textures/Lua/FileSync/Light/Standard/Open.png", 
    [l_StyleKey_0.CleanupImage] = "rbxasset://studio_svg_textures/Shared/InsertableObjects/Light/Standard/Cleanup.png", 
    [l_StyleKey_0.ErrorIconSolid] = "rbxasset://studio_svg_textures/Shared/Alerts/Light/Standard/Error.png", 
    [l_StyleKey_0.SuccessIconSolid] = "rbxasset://studio_svg_textures/Shared/Alerts/Light/Standard/Success.png", 
    [l_StyleKey_0.ActionSelectedOverride] = Color3.fromHex("#D5F0FF")
};
return function(v19) --[[ Line: 342 ]]
    -- upvalues: l_StudioTheme_0 (copy), v17 (copy), v18 (copy), v16 (copy)
    local _ = nil;
    return (if v19 then l_StudioTheme_0.mock(v17, v18) else l_StudioTheme_0.new(v17, v18)):extend(v16);
end;