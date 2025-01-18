local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Parent.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Explorer-UnderlaysRow", {}, {
    l_createStyleRule_0(">> .Explorer-UnderlaysRow-Background", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, 6)
        }), 
        l_createStyleRule_0(".Explorer-HoveredKind-Hovered", {
            BackgroundColor3 = "$RDLSemanticColorStatesHover", 
            BackgroundTransparency = "$RDLSemanticColorStatesHoverTransparency"
        }), 
        l_createStyleRule_0(".Explorer-SelectionKind-Selected", {
            BackgroundColor3 = "$RDLSemanticColorActionPrimaryBrandFill", 
            BackgroundTransparency = 0.76
        }), 
        l_createStyleRule_0(".Explorer-SelectionKind-ParentSelected", {
            BackgroundColor3 = "$RDLSemanticColorActionPrimaryBrandFill", 
            BackgroundTransparency = 0.92
        }), 
        l_createStyleRule_0(".Explorer-SelectionKind-ParentSelected .Explorer-HoveredKind-Hovered", {
            BackgroundColor3 = "$RDLSemanticColorActionPrimaryBrandFill", 
            BackgroundTransparency = 0.84
        }), 
        l_createStyleRule_0(".Explorer-SelectionSegment-Top", {
            Size = UDim2.fromScale(1, 2)
        }), 
        l_createStyleRule_0(".Explorer-SelectionSegment-Middle", {}, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 0)
            })
        }), 
        l_createStyleRule_0(".Explorer-SelectionSegment-Bottom", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            Size = UDim2.fromScale(1, 2)
        })
    }), 
    l_createStyleRule_0(">> .Explorer-UnderlaysRow-Border", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.new(1, -5, 1, -5)
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), 
        l_createStyleRule_0(".Explorer-HoveredKind-HoveredWithin ::UIStroke", {
            Color = "$RDLSemanticColorStatesHover", 
            Transparency = "$RDLSemanticColorStatesHoverTransparency", 
            Thickness = 2.5
        }), 
        l_createStyleRule_0(".Explorer-SelectedWithin ::UIStroke", {
            Color = "$RDLSemanticColorActionPrimaryBrandFill", 
            Transparency = 0.84, 
            Thickness = 2.5
        })
    })
});