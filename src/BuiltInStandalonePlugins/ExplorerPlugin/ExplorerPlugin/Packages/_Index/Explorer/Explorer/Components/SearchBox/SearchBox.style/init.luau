local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Parent.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Explorer-SearchBox", {
    BackgroundTransparency = 1, 
    Size = UDim2.fromScale(1, 1)
}, {
    l_createStyleRule_0(">> .Explorer-SearchBox-Corner ::UICorner", {
        CornerRadius = UDim.new(0, 6)
    }), 
    l_createStyleRule_0(">> .Explorer-SearchBox-SearchBar", {}, {
        l_createStyleRule_0(">> UIStroke", {
            Color = "$RDLSemanticColorActionPrimaryBrandFill", 
            Thickness = 1.5
        }), 
        l_createStyleRule_0(">> TextBox", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClearTextOnFocus = false, 
            ClipsDescendants = true, 
            Font = Enum.Font.SourceSans, 
            Position = UDim2.fromScale(0.5, 0.5), 
            TextColor3 = "$RDLSemanticColorContentMuted", 
            Text = "", 
            TextSize = 17.598, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    }), 
    l_createStyleRule_0(">> .Explorer-SearchBox-SearchBrowser", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 20)
    }, {
        l_createStyleRule_0(">> TextLabel", {
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Font = Enum.Font.SourceSans, 
            Size = UDim2.fromScale(1, 1), 
            TextColor3 = "$RDLSemanticColorContentMuted", 
            TextSize = 17.598, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    }), 
    l_createStyleRule_0(">> .Explorer-SearchBox-BottomBorder", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 10, 0, v1.searchHeaderBottomBorderWidth)
    }), 
    l_createStyleRule_0(">> .Explorer-SearchBox-Dropdown", {
        AnchorPoint = Vector2.new(0.5, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = UDim2.fromScale(0.5, 0), 
        Size = UDim2.new(1, -10, 0, 0)
    }, {
        l_createStyleRule_0("::UIStroke", {
            Color = "$RDLSemanticColorComponentInputFill", 
            Transparency = "$RDLSemanticColorComponentInputFillTransparency", 
            Thickness = 1.5
        }), 
        l_createStyleRule_0(">> ScrollingFrame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.fromScale(1, 0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            ScrollBarImageColor3 = "$RDLSemanticColorActionSecondary", 
            ScrollBarImageTransparency = "$RDLSemanticColorActionSecondaryTransparency", 
            ScrollingDirection = Enum.ScrollingDirection.Y
        })
    }), 
    l_createStyleRule_0(">> .Explorer-SearchBox-DropdownHeader", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 25)
    }), 
    l_createStyleRule_0(">> .Explorer-SearchBox-DropdownTitle", {
        BackgroundTransparency = 1, 
        Font = Enum.Font.SourceSans, 
        TextColor3 = "$RDLSemanticColorContentMuted", 
        TextSize = 17.598, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top
    }), 
    l_createStyleRule_0(">> .Explorer-SearchBox-DropdownItem", {
        BackgroundColor3 = "$RDLSemanticColorStatesHover", 
        Text = ""
    }, {
        l_createStyleRule_0(">> TextLabel", {
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    })
});