local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_getRawComponentStyle_0 = v1.Style.getRawComponentStyle;
local l_Style_0 = v1.Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_Util_0 = v1.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_deepCopy_0 = l_Util_0.deepCopy;
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local v13 = v2.Dictionary.join(l_DarkTheme_0, {
    [l_StyleKey_0.SelectedTabColor] = Color3.fromRGB(64, 64, 64), 
    [l_StyleKey_0.UIGroupColor] = Color3.fromRGB(77, 77, 77)
});
local v14 = v2.Dictionary.join(l_LightTheme_0, {
    [l_StyleKey_0.SelectedTabColor] = Color3.fromRGB(253, 253, 253), 
    [l_StyleKey_0.UIGroupColor] = Color3.fromRGB(246, 247, 248)
});
local function v17() --[[ Line: 35 ]] --[[ Name: mockStyleKey ]]
    -- upvalues: l_StyleKey_0 (copy), v14 (copy)
    for _, v16 in ipairs({
        "SelectedTabColor", 
        "UIGroupColor"
    }) do
        l_StyleKey_0[v16] = v14[l_StyleKey_0[v16]];
    end;
end;
l_ComponentSymbols_0:add("TabbedView");
l_ComponentSymbols_0:add("PlaybackTabView");
l_ComponentSymbols_0:add("FileSelectorUIGroup");
l_ComponentSymbols_0:add("PlaybackInfoUIGroup");
l_ComponentSymbols_0:add("FilterSettingsUIGroup");
l_ComponentSymbols_0:add("LabeledToggleButton");
l_ComponentSymbols_0:add("UIKeyValueTextLabel");
l_ComponentSymbols_0:add("ChooseRecordingNamePopUp");
l_ComponentSymbols_0:add("InputVisualizer");
l_ComponentSymbols_0:add("KeyBarTile");
local v18 = l_getRawComponentStyle_0("Button");
local v19 = v18["&RoundPrimary"];
local v20 = l_getRawComponentStyle_0("TextLabel");
local v21 = l_getRawComponentStyle_0("RoundBox");
local v22 = l_getRawComponentStyle_0("SelectInput");
local v23 = l_getRawComponentStyle_0("Pane");
local v24 = l_deepCopy_0(v21);
local function v25() --[[ Line: 64 ]] --[[ Name: getPluginTheme ]]
    -- upvalues: l_ComponentSymbols_0 (copy), v2 (copy), v18 (copy), v19 (copy), l_StyleModifier_0 (copy), v24 (copy), v23 (copy), l_StyleKey_0 (copy), v20 (copy), v22 (copy)
    return {
        PrimaryButtonSize = UDim2.new(0, 160, 0, 32), 
        UIGroupWidthPx = 340, 
        PaddingPx = 10, 
        [l_ComponentSymbols_0.Button] = v2.Dictionary.join(v18, {
            ["&RoundPrimaryRecordButton"] = v2.Dictionary.join(v19, {
                [l_StyleModifier_0.Selected] = {
                    BackgroundStyle = v2.Dictionary.join(v24, {
                        Color = Color3.fromRGB(255, 211, 16)
                    }), 
                    TextColor = Color3.fromRGB(0, 0, 0)
                }, 
                [l_StyleModifier_0.Pressed] = {
                    BackgroundStyle = v2.Dictionary.join(v24, {
                        Color = Color3.fromRGB(255, 25, 25)
                    }), 
                    TextColor = Color3.fromRGB(255, 255, 255)
                }
            }), 
            ["&RoundPrimaryPlayButton"] = v2.Dictionary.join(v19, {
                [l_StyleModifier_0.Selected] = {
                    BackgroundStyle = v2.Dictionary.join(v24, {
                        Color = Color3.fromRGB(255, 211, 16)
                    }), 
                    TextColor = Color3.fromRGB(0, 0, 0)
                }, 
                [l_StyleModifier_0.Pressed] = {
                    BackgroundStyle = v2.Dictionary.join(v24, {
                        Color = Color3.fromRGB(0, 219, 26)
                    }), 
                    TextColor = Color3.fromRGB(255, 255, 255)
                }
            })
        }), 
        [l_ComponentSymbols_0.Pane] = v2.Dictionary.join(v23, {
            ["&CornerBox"] = {
                CornerRadius = UDim.new(0, 8), 
                Background = l_StyleKey_0.UIGroupColor
            }, 
            ["&KeyTileBox"] = {
                CornerRadius = UDim.new(0, 8), 
                Background = Color3.new(0, 0, 0)
            }
        }), 
        [l_ComponentSymbols_0.TabbedView] = {
            TabBarHeightPx = 30, 
            ForegroundTabColor = l_StyleKey_0.SelectedTabColor, 
            TabBarBackgroundColor = l_StyleKey_0.SubBackground
        }, 
        [l_ComponentSymbols_0.PlaybackTabView] = {
            PaddingPx = 10
        }, 
        [l_ComponentSymbols_0.FileSelectorUIGroup] = {
            PaddingPx = 10
        }, 
        [l_ComponentSymbols_0.TextLabel] = v2.Dictionary.join(v20, {
            ["&StatusTextLabel"] = {
                TextSize = 16, 
                TextColor = l_StyleKey_0.MainText, 
                TextWrapped = true
            }
        }), 
        [l_ComponentSymbols_0.LabeledToggleButton] = {
            ComponentSize = UDim2.new(0, 150, 0, 30), 
            ToggleSize = UDim2.fromOffset(40, 24), 
            LeftInsetPx = 12, 
            PaddingPx = 10
        }, 
        [l_ComponentSymbols_0.UIKeyValueTextLabel] = {
            PaddingPx = 10, 
            HeightPx = 25, 
            KeyWidthPx = 150
        }, 
        [l_ComponentSymbols_0.FileSelectorUIGroup] = {
            PaddingPx = 10, 
            ProgressBarWidth = 250
        }, 
        [l_ComponentSymbols_0.FilterSettingsUIGroup] = {
            GridAreaHeightPx = 100, 
            PaddingPx = 10, 
            GridLayoutCellSize = UDim2.fromOffset(150, 30), 
            GridCellPaddingYPx = 2
        }, 
        [l_ComponentSymbols_0.PlaybackInfoUIGroup] = {
            PaddingPx = 10
        }, 
        PlaybackSelectInput = v2.Dictionary.join(v22, {
            Size = UDim2.new(0, 240, 0, 32)
        }), 
        [l_ComponentSymbols_0.ChooseRecordingNamePopUp] = {
            ContentSize = Vector2.new(300, 60), 
            PanelSize = UDim2.fromOffset(250, 60), 
            PanelPosition = UDim2.fromOffset(20, -10), 
            DialogMessageSize = UDim2.new(1, 0, 0, 40), 
            TextInputSize = UDim2.fromOffset(250, 30), 
            PaddingPx = 1
        }, 
        [l_ComponentSymbols_0.InputVisualizer] = {
            KeyBarRowSpacingPx = 2, 
            KeyBarSize = UDim2.fromOffset(200, 100)
        }, 
        [l_ComponentSymbols_0.KeyBarTile] = {
            TextColor = Color3.new(1, 1, 1), 
            BackgroundColor = Color3.new(0, 0, 0)
        }
    };
end;
return function(v26) --[[ Line: 189 ]]
    -- upvalues: v17 (copy), l_StudioTheme_0 (copy), v13 (copy), v14 (copy), v25 (copy)
    local v27 = nil;
    if v26 then
        v17();
        v27 = l_StudioTheme_0.mock(v13, v14);
    else
        v27 = l_StudioTheme_0.new(v13, v14);
    end;
    return v27:extend((v25()));
end;