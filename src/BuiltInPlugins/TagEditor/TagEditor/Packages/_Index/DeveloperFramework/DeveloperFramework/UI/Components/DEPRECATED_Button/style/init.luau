local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util);
local v2 = require(l_Parent_0.Parent.Cryo);
local l_deepCopy_0 = v1.deepCopy;
local v4 = require(l_Parent_0.Util.StyleModifier);
local v5 = require(l_Parent_0.Style.StyleKey);
local v6 = require(l_Parent_0.UI.Components.Box);
local v7 = require(l_Parent_0.UI.Components.RoundBox);
local v8 = require(l_Parent_0.UI.Components.Image);
local v9 = require(l_Parent_0.UI.Components.UIFolderData);
local v10 = require(v9.RoundBox.style);
local v11 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkModernStartPageStyle)();
local v12 = l_deepCopy_0(v10);
local v13 = v2.Dictionary.join(v12, {
    BackgroundImage = "rbxasset://textures/StudioSharedUI/RoundedLeftBackground.png", 
    BorderImage = "rbxasset://textures/StudioSharedUI/RoundedLeftBorder.png"
});
local v14 = v2.Dictionary.join(v12, {
    BackgroundImage = "rbxasset://textures/StudioSharedUI/RoundedCenterBackground.png", 
    BorderImage = "rbxasset://textures/StudioSharedUI/RoundedCenterBorder.png"
});
local v15 = v2.Dictionary.join(v12, {
    BackgroundImage = "rbxasset://textures/StudioSharedUI/RoundedRightBackground.png", 
    BorderImage = "rbxasset://textures/StudioSharedUI/RoundedRightBorder.png"
});
local v16 = {
    Font = Enum.Font.SourceSansBold, 
    Background = v7, 
    BackgroundStyle = v2.Dictionary.join(v12, {
        BorderColor = v5.MainBackground, 
        Color = v5.DialogMainButton
    }), 
    TextColor = v5.DialogMainButtonText, 
    [v4.Hover] = {
        BackgroundStyle = v2.Dictionary.join(v12, {
            BorderColor = v5.MainBackground, 
            Color = v5.DialogMainButtonHover
        })
    }, 
    [v4.Disabled] = {
        BackgroundStyle = v2.Dictionary.join(v12, {
            BorderColor = v5.MainBackground, 
            Color = v5.DialogMainButtonDisabled
        }), 
        TextColor = v5.DialogMainButtonTextDisabled
    }
};
local function v18(v17) --[[ Line: 59 ]] --[[ Name: roundBase ]]
    -- upvalues: v7 (copy), v4 (copy), v2 (copy), v5 (copy)
    return {
        Background = v7, 
        BackgroundStyle = v17, 
        [v4.Hover] = {
            BackgroundStyle = v2.Dictionary.join(v17, {
                Color = v5.ButtonHover
            })
        }, 
        [v4.Disabled] = {
            BackgroundStyle = v2.Dictionary.join(v17, {
                Color = v5.ButtonDisabled
            }), 
            TextColor = v5.ButtonTextDisabled
        }, 
        [v4.Pressed] = {
            BackgroundStyle = v2.Dictionary.join(v17, {
                Color = v5.ButtonPressed
            })
        }
    };
end;
local function v20(v19) --[[ Line: 82 ]] --[[ Name: roundActive ]]
    -- upvalues: v7 (copy), v2 (copy), v5 (copy), v4 (copy)
    return {
        Background = v7, 
        BackgroundStyle = v2.Dictionary.join(v19, {
            Color = v5.ActionActivated
        }), 
        TextColor = v5.DialogMainButtonText, 
        [v4.Hover] = {
            BackgroundStyle = v2.Dictionary.join(v19, {
                Color = v5.ButtonHover
            })
        }, 
        [v4.Disabled] = {
            BackgroundStyle = v2.Dictionary.join(v19, {
                Color = v5.DialogMainButtonDisabled
            }), 
            TextColor = v5.DialogMainButtonTextDisabled
        }
    };
end;
return {
    IconPadding = 5, 
    IconSize = UDim2.fromOffset(16, 16), 
    Padding = 0, 
    TextXAlignment = Enum.TextXAlignment.Center, 
    TextYAlignment = Enum.TextYAlignment.Center, 
    TextColor = v5.ButtonText, 
    Background = v6, 
    BackgroundStyle = v2.Dictionary.join(v12, {
        Color = v5.Button
    }), 
    [v4.Hover] = {
        BackgroundStyle = v2.Dictionary.join(v12, {
            Color = v5.ButtonHover
        })
    }, 
    [v4.Disabled] = {
        BackgroundStyle = v2.Dictionary.join(v12, {
            Color = v5.ButtonDisabled
        }), 
        TextColor = v5.ButtonTextDisabled
    }, 
    [v4.Pressed] = {
        BackgroundStyle = v2.Dictionary.join(v12, {
            Color = v5.ButtonPressed
        })
    }, 
    ["&RoundSubtle"] = {
        Background = v7, 
        BackgroundStyle = {
            Color = v5.SubBackground
        }, 
        [v4.Disabled] = {
            BackgroundStyle = {
                Color = v5.ButtonDisabled
            }, 
            TextColor = v5.ButtonTextDisabled
        }, 
        [v4.Hover] = {
            BackgroundStyle = v2.Dictionary.join(v12, {
                Color = v5.ButtonHover
            })
        }, 
        [v4.Pressed] = {
            BackgroundStyle = {
                Color = v5.ButtonPressed
            }, 
            TextColor = v5.ButtonTextDisabled
        }, 
        [v4.Selected] = {
            BackgroundStyle = v2.Dictionary.join(v12, {
                Color = v5.ActionActivated
            }), 
            TextColor = v5.ButtonTextDisabled
        }
    }, 
    ["&RoundLeft"] = v18(v13), 
    ["&RoundCenter"] = v18(v14), 
    ["&RoundRight"] = v18(v15), 
    ["&RoundLeftActive"] = v20(v13), 
    ["&RoundCenterActive"] = v20(v14), 
    ["&RoundRightActive"] = v20(v15), 
    ["&Round"] = {
        Background = v7
    }, 
    ["&RoundPrimary"] = v16, 
    ["&RoundLargeText"] = {
        Background = v7, 
        TextSize = 22
    }, 
    ["&RoundLargeTextPrimary"] = v2.Dictionary.join(v16, {
        Font = Enum.Font.SourceSans, 
        TextSize = 22
    }), 
    ["&RoundActive"] = {
        Font = Enum.Font.SourceSansBold, 
        Background = v7, 
        BackgroundStyle = v2.Dictionary.join(v12, {
            BorderColor = v5.DialogMainButton, 
            Color = v5.Button
        }), 
        TextColor = v5.DialogMainButtonText, 
        [v4.Hover] = {
            BackgroundStyle = v2.Dictionary.join(v12, {
                BorderColor = v5.DialogMainButton, 
                Color = v5.ButtonHover
            })
        }, 
        [v4.Disabled] = {
            BackgroundStyle = v2.Dictionary.join(v12, {
                BorderColor = v5.DialogMainButton, 
                Color = v5.ButtonDisabled
            }), 
            TextColor = v5.DialogMainButtonTextDisabled
        }
    }, 
    ["&Close"] = {
        Foreground = v8, 
        Size = UDim2.fromOffset(24, 24), 
        ForegroundStyle = {
            Image = "rbxasset://textures/StudioSharedUI/clear.png", 
            Color = v5.SubText
        }, 
        [v4.Disabled] = {
            ForegroundStyle = {
                Image = "rbxasset://textures/StudioSharedUI/clear.png", 
                Color = v5.ButtonDisabled
            }
        }, 
        [v4.Hover] = {
            ForegroundStyle = {
                Image = "rbxasset://textures/StudioSharedUI/clear-hover.png", 
                Color = v5.SubText
            }
        }
    }, 
    ["&ModernDropdown"] = if v11 then {
        Font = Enum.Font.BuilderSans, 
        BackgroundStyle = {
            Transparency = 1
        }, 
        [v4.Hover] = {
            BackgroundStyle = {
                Color = v5.ActionSecondaryHover, 
                Transparency = v5.ActionSecondaryHoverTransparency
            }
        }
    } else nil
};