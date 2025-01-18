local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioTheme_0 = require(l_Parent_0.Packages.Framework).Style.Themes.StudioTheme;
local v2 = {
    App = {
        Padding = 4, 
        Spacing = 4
    }, 
    TopPanel = {
        Size = UDim2.new(1, 0, 0, 24), 
        Padding = 2, 
        AggregateStats = {
            TextSize = 18, 
            NumTextures = {
                Size = UDim2.new(0.3333333333333333, -25, 1, 0)
            }, 
            TotalMemory = {
                Size = UDim2.fromScale(0.3333333333333333, 1)
            }
        }, 
        Refresh = {
            Size = UDim2.fromScale(0.3333333333333333, 1), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 25, 0, 0), 
            Button = {
                Icon = "rbxasset://textures/TextureViewer/refresh_dark_theme.png"
            }
        }
    }, 
    SearchBar = {
        Size = UDim2.new(1, 0, 0, 32)
    }, 
    TextureTable = {
        Size = UDim2.new(1, 0, 1, -60), 
        RowHeight = 165, 
        TableCell = {
            Style = "Box", 
            BorderSizePixel = 1, 
            IdCell = {
                TextInput = {
                    Size = UDim2.fromScale(1, 0.3333333333333333)
                }, 
                Buttons = {
                    ButtonsWrapper = {
                        Size = UDim2.fromScale(0.6666666666666666, 0.3333333333333333)
                    }, 
                    Padding = 5, 
                    CancelIcon = "rbxasset://textures/TextureViewer/cancel.png", 
                    ConfirmIcon = "rbxasset://textures/TextureViewer/confirm.png"
                }
            }, 
            FindSelectCell = {
                ZoomText = {
                    Padding = 5, 
                    TextSize = 18
                }, 
                PrevButton = {
                    Icon = "rbxasset://textures/TextureViewer/arrowleft_black_16.png"
                }, 
                NextButton = {
                    Icon = "rbxasset://textures/TextureViewer/arrowright_black_16.png"
                }
            }
        }
    }
};
return function(v3) --[[ Line: 85 ]]
    -- upvalues: l_StudioTheme_0 (copy), v2 (copy)
    local _ = nil;
    return (if v3 then l_StudioTheme_0.mock() else l_StudioTheme_0.new()):extend(v2);
end;