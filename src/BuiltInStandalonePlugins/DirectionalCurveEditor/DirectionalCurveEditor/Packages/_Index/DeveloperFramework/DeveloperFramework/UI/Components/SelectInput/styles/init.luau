local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
local v2 = require(l_Parent_0.SharedFlags.getFFlagSelectRendererOnRenderItem)();
return v1(".Component-SelectInput", {
    AutoButtonColor = false, 
    BackgroundTransparency = 1, 
    Size = UDim2.new(0, 240, 0, 32), 
    Text = ""
}, {
    v1("> TextButton", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 32)
    }, {
        v1("> #SelectedItemIcon", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 10, 0.5, 0)
        }), 
        v1("> #SelectedItemText", {
            Position = UDim2.fromOffset(10, 0), 
            Size = UDim2.new(1, -30, 1, -2)
        }), 
        v1("> #SelectArrow", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.fromOffset(12, 12), 
            Position = UDim2.new(1, -5, 0.5, 0)
        }), 
        v1(".Placeholder > #SelectedItemText", {
            TextColor = v2 and "$TextSecondary" or "$TextDisabled"
        }), 
        v1(".HasIcon > #SelectedItemText", {
            Position = UDim2.fromOffset(36, 0), 
            Size = UDim2.new(1, -46, 1, -2)
        })
    }), 
    v1(".HasError", {
        Size = UDim2.fromOffset(240, 64)
    }), 
    v1("> ImageButton", {
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/StudioToolbox/ArrowDownIconWhite.png", 
        Size = UDim2.fromScale(1, 1)
    }), 
    v1(".modern", {}, {
        v1(">> #SelectedItemText", {
            Font = Enum.Font.BuilderSansBold
        }), 
        v1(">> .Component-SelectInput-Selection", {
            BackgroundColor3 = "$Surface100", 
            BackgroundTransparency = 0
        }, {
            v1("::UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            v1("::UIStroke", {
                Thickness = 0
            }), 
            v1(":hover", {
                BackgroundColor3 = "$SelectInputHoverBackground", 
                BackgroundTransparency = 0
            }), 
            v1(":hover::UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Thickness = 1, 
                Color = "$SelectInputHoverBorderColor"
            })
        })
    })
}, {
    ArrowOffset = 22, 
    ErrorHeight = 32, 
    Height = 32, 
    IconOffset = 26
});