local v0 = require(script.Parent.createStyleRule);
return {
    v0(".X-Fill", {
        Size = UDim2.fromScale(1, 1)
    }), 
    v0(".X-Fit", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.fromScale(0, 0)
    }), 
    v0(".X-FitX", {
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.fromScale(0, 1)
    }), 
    v0(".X-FitY", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0)
    }), 
    v0(".X-PadXS ::UIPadding", {
        PaddingLeft = UDim.new(0, 2), 
        PaddingRight = UDim.new(0, 2), 
        PaddingTop = UDim.new(0, 2), 
        PaddingBottom = UDim.new(0, 2)
    }), 
    v0(".X-PadS ::UIPadding", {
        PaddingLeft = UDim.new(0, 5), 
        PaddingRight = UDim.new(0, 5), 
        PaddingTop = UDim.new(0, 5), 
        PaddingBottom = UDim.new(0, 5)
    }), 
    v0(".X-Pad ::UIPadding", {
        PaddingLeft = UDim.new(0, 10), 
        PaddingRight = UDim.new(0, 10), 
        PaddingTop = UDim.new(0, 10), 
        PaddingBottom = UDim.new(0, 10)
    }), 
    v0(".X-PadL ::UIPadding", {
        PaddingLeft = UDim.new(0, 20), 
        PaddingRight = UDim.new(0, 20), 
        PaddingTop = UDim.new(0, 20), 
        PaddingBottom = UDim.new(0, 20)
    }), 
    v0(".X-Row", {}, {
        v0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    v0(".X-RowS", {}, {
        v0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 5), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    v0(".X-RowM", {}, {
        v0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 10), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    v0(".X-Column", {}, {
        v0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    v0(".X-ColumnS", {}, {
        v0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 5), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    v0(".X-ColumnM", {}, {
        v0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 10), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    v0(".X-Top", {}, {
        v0("::UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Top
        })
    }), 
    v0(".X-Middle", {}, {
        v0("::UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    }), 
    v0(".X-Bottom", {}, {
        v0("::UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        })
    }), 
    v0(".X-Left", {}, {
        v0("::UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        })
    }), 
    v0(".X-Center", {}, {
        v0("::UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        })
    }), 
    v0(".X-Right", {}, {
        v0("::UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    }), 
    v0(".X-AnchorCenter", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5)
    }), 
    v0(".X-Corner ::UICorner", {
        CornerRadius = UDim.new(0, 4)
    }), 
    v0(".X-Stroke ::UIStroke", {
        Color = "$Divider", 
        Thickness = 1
    }), 
    v0(".X-Border", {
        BorderColor3 = "$Divider", 
        BorderSizePixel = 1
    }), 
    v0(".X-Clip", {
        ClipsDescendants = true
    }), 
    v0(".X-Input", {
        BackgroundColor3 = "$FilledInputBackground", 
        BackgroundTransparency = 0
    }, {
        v0("::UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), 
        v0("::UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = "$Divider", 
            Thickness = 1
        }), 
        v0("&:hover::UIStroke", {
            Color = "$ActionFocusBorder"
        })
    }), 
    v0(".X-Focus ::UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = "$ActionFocusBorder", 
        Thickness = 1
    }), 
    v0(".X-Error ::UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = "$TextError", 
        Thickness = 1
    }), 
    v0(".X-Success ::UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = "$TextSuccess", 
        Thickness = 1
    }), 
    v0(".X-Warning ::UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = "$TextWarning", 
        Thickness = 1
    }), 
    v0(".X-Transparent", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    })
};